//
//  AppDelegate.swift
//  jjanhaeyo
//
//  Created by minjae on 09/08/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit
import CoreData
import FBSDKLoginKit
import KakaoOpenSDK
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // FaceBook
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        // Google
        GIDSignIn.sharedInstance().clientID = "76493067515-gepn8p7j0593lec99rbq8gmea5vktvur.apps.googleusercontent.com"
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
        // FaceBook
        AppEvents.activateApp()
        
        // KAKAKO
        KOSession.handleDidBecomeActive()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
        self.saveContext()
    }

    // MARK: - Login & Share Process
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        guard let scheme = url.scheme else { return true }
        if #available(iOS 9.0, *) {
            // FaceBook
            let sourceApplication: String? = options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String
            if scheme.contains("fb") {
                return ApplicationDelegate.shared.application(app, open: url.absoluteURL, sourceApplication: sourceApplication, annotation: nil)
            }
            // Kakao
            if KOSession.isKakaoAccountLoginCallback(url.absoluteURL) {
                return KOSession.handleOpen(url)
            }
            // Google
            if scheme.contains("com.googleusercontent.apps") {
                return GIDSignIn.sharedInstance().handle(url as URL?,sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,annotation: options[UIApplication.OpenURLOptionsKey.annotation])
            }
        }
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        guard let scheme = url.scheme else { return true }
        // FaceBook
        if scheme.contains("fb") {
            return ApplicationDelegate.shared.application(application, open: url.absoluteURL, sourceApplication: sourceApplication, annotation: annotation)
        }
        // Kakao
        if KOSession.isKakaoAccountLoginCallback(url.absoluteURL) {
            return KOSession.handleOpen(url)
        }
        // Google
        if scheme.contains("com.googleusercontent.apps") {
            return GIDSignIn.sharedInstance().handle(url, sourceApplication: sourceApplication, annotation: annotation)
        }
        return true
    }
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "jjanhaeyo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

