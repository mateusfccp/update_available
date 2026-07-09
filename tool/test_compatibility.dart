import 'dart:io';

void main() async {
  final scriptFile = File(Platform.script.toFilePath());
  final workspaceDirectory = scriptFile.parent.parent.absolute.path;
  final testAppDirectory = Directory(
    '$workspaceDirectory/.compatibility_test_app',
  );

  stdout.writeln('Workspace directory: $workspaceDirectory');
  stdout.writeln('Temporary test app directory: ${testAppDirectory.path}');

  if (testAppDirectory.existsSync()) {
    try {
      testAppDirectory.deleteSync(recursive: true);
    } catch (error) {
      stderr.writeln('Failed to delete ${testAppDirectory.path}: $error');
    }
  }

  int runStatus = 0;

  try {
    testAppDirectory.createSync(recursive: true);

    stdout.writeln('Creating a temporary Flutter Android project...');
    var exitCode = await _runCommand('flutter', [
      'create',
      '--project-name=compat_test_app',
      '--platforms=android',
      '--org=me.mateusfccp.compat_test_app',
      '.',
    ], workingDirectory: testAppDirectory.path);
    if (exitCode != 0) throw Exception('flutter create failed');

    stdout.writeln('Configuring local package overrides...');
    final overridesFile = File(
      '${testAppDirectory.path}/pubspec_overrides.yaml',
    );
    final overridesContent =
        '''
dependency_overrides:
  update_available:
    path: $workspaceDirectory/update_available
  update_available_android:
    path: $workspaceDirectory/update_available_android
  update_available_ios:
    path: $workspaceDirectory/update_available_ios
  update_available_platform_interface:
    path: $workspaceDirectory/update_available_platform_interface
''';
    overridesFile.writeAsStringSync(overridesContent);

    stdout.writeln('Adding update_available dependency...');
    exitCode = await _runCommand('flutter', [
      'pub',
      'add',
      'update_available',
      '--path',
      '$workspaceDirectory/update_available',
    ], workingDirectory: testAppDirectory.path);

    if (exitCode != 0) throw Exception('flutter pub add failed');

    stdout.writeln(
      'Building APK (debug) to verify native Gradle and Kotlin compilation...',
    );
    exitCode = await _runCommand('flutter', [
      'build',
      'apk',
      '--debug',
      '--target-platform',
      'android-arm64',
    ], workingDirectory: testAppDirectory.path);

    if (exitCode != 0) throw Exception('flutter build apk failed');

    stdout.writeln('=============================================');
    stdout.writeln(' Compatibility test passed successfully!');
    stdout.writeln('=============================================');
  } catch (error, stackTrace) {
    stderr.writeln('Error: $error');
    stderr.writeln('StackTrace: $stackTrace');
    runStatus = 1;
  } finally {
    if (testAppDirectory.existsSync()) {
      stdout.writeln('Cleaning up temporary test app...');
      try {
        testAppDirectory.deleteSync(recursive: true);
      } catch (error, stackTrace) {
        stderr.writeln(
          'Warning: Failed to clean up temporary directory: $error',
        );
        stderr.writeln('StackTrace: $stackTrace');
      }
    }
  }

  exit(runStatus);
}

Future<int> _runCommand(
  String executable,
  List<String> arguments, {
  required String workingDirectory,
}) async {
  // On Windows, the flutter executable needs to be run using flutter.bat
  final exec = Platform.isWindows && executable == 'flutter'
      ? 'flutter.bat'
      : executable;

  final process = await Process.start(
    exec,
    arguments,
    workingDirectory: workingDirectory,
  );

  // Pipe stdout and stderr in real-time
  final stdoutDone = stdout.addStream(process.stdout);
  final stderrDone = stderr.addStream(process.stderr);

  await Future.wait([stdoutDone, stderrDone]);
  return await process.exitCode;
}
