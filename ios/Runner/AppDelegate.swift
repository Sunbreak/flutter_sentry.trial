import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        MyPlugin.register(with: self.registrar(forPlugin: "MyPlugin")!)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

class MyPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "my_plugin", binaryMessenger: registrar.messenger())
        let instance = MyPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        print("handle \(call.method)")
        UIApplication.shared.keyWindow!.rootViewController!.present(MyViewController(), animated: true)
    }
}

class MyViewController: UIViewController {
    override func viewDidLoad() {
        cal(0)
    }

    func cal(_ a: Int) {
        print(1 / a)
    }
}
