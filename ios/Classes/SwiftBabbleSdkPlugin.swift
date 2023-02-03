import Flutter
import UIKit
import BabbleiOS

public class SwiftBabbleSdkPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "babble_sdk", binaryMessenger: registrar.messenger())
    let instance = SwiftBabbleSdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if(call.method == "init")
         {
            guard let babbleData: Dictionary = call.arguments as? [String: Any?] else {
                result("Babble SDK: Please provide valid api key");
                return;
            }
            if(babbleData["user_id"]==nil || (babbleData["user_id"] as! String).isEmpty){
                result("Babble SDK: Please provide valid api key");
            }else{
                BabbleSdk.configure(babbleData["user_id"] as! String)
            }
        } else if(call.method == "set_customer_id")
        {
           guard let babbleData: Dictionary = call.arguments as? [String: Any?] else {
               result("Babble SDK: Please provide valid customer id");
               return;
           }
           BabbleSdk.setCustomerId(babbleData["customer_id"] as? String)
          
        } else if(call.method == "trigger_survey"){
            guard let babbleData: Dictionary = call.arguments as? [String: Any?] else {
                result("Babble SDK: Please provide valid trigger name");
                return;
            }
            if(babbleData["trigger"]==nil || (babbleData["trigger"] as! String).isEmpty){
                result("Babble SDK: Please provide valid trigger name");
            }else{
                BabbleSdk.trigger(babbleData["trigger"] as! String)
            }
        }else {
            result(FlutterMethodNotImplemented)
        }
  }
}
