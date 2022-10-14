package me.mateusfccp.update_available_android

import android.content.Context
import com.google.android.play.core.appupdate.AppUpdateManagerFactory
import com.google.android.play.core.install.model.UpdateAvailability
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

/** UpdateAvailableAndroidPlugin */
class UpdateAvailableAndroidPlugin : FlutterPlugin, MethodCallHandler {
    private val CHANNEL = "me.mateusfccp/update_available"
    private lateinit var channel: MethodChannel
    private lateinit var context: Context;

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, CHANNEL)
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext;
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "getUpdateAvailability") {
            getUpdateAvailability(result)
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun getUpdateAvailability(result: Result) {
        val appUpdateManager = AppUpdateManagerFactory.create(context)
        val appUpdateInfoTask = appUpdateManager.appUpdateInfo

        appUpdateInfoTask.addOnSuccessListener { info ->
            if (info.updateAvailability() == UpdateAvailability.UPDATE_AVAILABLE) {
                result.success(true)
            } else {
                result.success(false)
            }
        }

        appUpdateInfoTask.addOnFailureListener {
            result.error("INITIALIZATION_FAILURE", "Failed to get appUpdateInfoTask", null)
        }
    }
}
