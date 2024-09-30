import 'package:flutter/widgets.dart';
import 'package:update_available/update_available.dart';

import 'shared/button.dart';
import 'shared/colors.dart';

void main() {
  runApp(const UpdateAvailableExample());
}

class UpdateAvailableExample extends StatefulWidget {
  const UpdateAvailableExample({super.key});

  @override
  State<UpdateAvailableExample> createState() => _UpdateAvailableExampleState();
}

class _UpdateAvailableExampleState extends State<UpdateAvailableExample> {
  String text = 'Is there any update?';

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: green,
      pageRouteBuilder: <T>(RouteSettings settings, WidgetBuilder builder) {
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => builder(context),
        );
      },
      home: Container(
        padding: const EdgeInsets.all(24.0),
        color: green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Button(
              onTap: _onTap,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Check for update!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onTap() async {
    setState(() {
      text = 'Checking...';
    });

    final availability = await getUpdateAvailability();

    setState(() {
      text = switch (availability) {
        UpdateAvailable() => "There's an update available!",
        NoUpdateAvailable() => "There's no update available!",
        UnknownAvailability() => "Sorry, couldn't determine if there is or not an available update!",
      };
    });
  }
}
