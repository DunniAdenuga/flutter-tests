import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    //Maps Key
    GMSServices.provideAPIKey("AIzaSyB6R9ecWuyABlKMz1K3VQbxBDmBkxdFmDA")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
