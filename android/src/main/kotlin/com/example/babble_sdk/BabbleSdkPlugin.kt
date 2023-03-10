package com.example.babble_sdk

import androidx.annotation.NonNull
import com.babble.babblesdk.BabbleSDK
import android.app.Activity
import android.util.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.util.HashMap

/** BabbleSdkPlugin */
class BabbleSdkPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  private var activity: Activity? = null
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "babble_sdk")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when(call.method){
      "init" ->{
        val userId=call.argument("user_id") as String?
        if(userId!=null&&userId.isNotEmpty()){
          BabbleSDK.init(activity!!,userId)
        }else{
          result.error("404","Babble SDK: Please provide valid api key",null)
        }

      }
      "set_customer_id" ->{
        val customerId=call.argument("customer_id") as String?
        val userDetails=call.argument("user_details") as HashMap<String, Any?>?
        BabbleSDK.setCustomerId(customerId = customerId,userDetails = userDetails)

      }
      "trigger_survey" ->{
        val trigger=call.argument("trigger") as String?
        val properties=call.argument("properties") as HashMap<String, Any?>?
        if(trigger!=null&&trigger.isNotEmpty()){
          BabbleSDK.triggerSurvey(trigger= trigger, properties = properties)
        }else{
          result.error("404","Babble SDK: Please provide valid trigger",null)
        }

      }
      else ->{
        result.notImplemented()
      }
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {
    TODO("Not yet implemented")
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    TODO("Not yet implemented")
  }

  override fun onDetachedFromActivity() {
    TODO("Not yet implemented")
  }
}
