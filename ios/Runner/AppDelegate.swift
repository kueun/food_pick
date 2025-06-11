import Flutter
import UIKit
import Network

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // 1. Enable network permissions early by activating a simple connection
    if #available(iOS 13.0, *) {
        let monitor = NWPathMonitor()
        monitor.start(queue: DispatchQueue.global())
        
        // 2. Enable local network permission prompt by accessing multicast
        if #available(iOS 14.0, *) {
            let browser = NWBrowser(for: .bonjour(type: "_http._tcp.", domain: nil), using: NWParameters())
            browser.start(queue: DispatchQueue.global())
        }
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
