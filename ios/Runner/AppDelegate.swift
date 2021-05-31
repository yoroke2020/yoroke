import UIKit
import Flutter
import CoreLocation
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  let manager = CLLocationManager()

      override func application(
          _ application: UIApplication,
          didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
      ) -> Bool {
          if (CLLocationManager.locationServicesEnabled()) {
              switch CLLocationManager.authorizationStatus() {
              case .denied, .notDetermined, .restricted:
                  self.manager.requestAlwaysAuthorization()
                  break
              default:
                  break
              }
          }
          FirebaseApp.configure()
          GeneratedPluginRegistrant.register(with: self)
          return super.application(application, didFinishLaunchingWithOptions: launchOptions)
      }
}
