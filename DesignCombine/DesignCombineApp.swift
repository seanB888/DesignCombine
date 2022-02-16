//
//  DesignCombineApp.swift
//  DesignCombine
//
//  Created by SEAN BLAKE on 2/12/22.
//

import SwiftUI
import Firebase

@main
struct DesignCombineApp: App {
//    @UIApplicationDelegateAdapter(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
    [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
