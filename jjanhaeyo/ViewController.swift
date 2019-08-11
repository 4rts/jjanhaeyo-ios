//
//  ViewController.swift
//  jjanhaeyo
//
//  Created by minjae on 09/08/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import KakaoOpenSDK
import GoogleSignIn

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.uiDelegate = self
    }

    @IBAction func loginFaceBookAction(_ sender: Any) {
        LoginManager().logIn(permissions: ["public_profile", "email", "user_birthday", "user_gender"], from: self, handler: { (result, error) in
            guard let result = result, error == nil && !result.isCancelled else { return }
            GraphRequest(graphPath: "me", parameters: ["fields": "id, name, email, picture, birthday, gender"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error != nil) { return }
                guard let facebook = result as? [String: AnyObject] else { return }
                if let token = facebook["id"] as? String {
                    print(token)
                }
            })
        })
    }
    
    @IBAction func loginGoogleAction(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    @IBAction func loginKakaoAction(_ sender: Any) {
        if KOSession.shared()?.isOpen() ?? false {
            KOSession.shared()?.close()
        }
        KOSession.shared()?.presentingViewController = self
        KOSession.shared()?.open(completionHandler: { (error) in
            if error != nil || !(KOSession.shared()?.isOpen() ?? false) { return }
            KOSessionTask.userMeTask(completion: { (error, user) in
                if let token = KOSession.shared()?.token {
                    let accessToken = token.accessToken
                    print(accessToken)
                }
            })
        })
    }
    
}

extension ViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("사용자가 로그인 취소, \(error)")
            return
        } else if let user = user {
            print("userID: \(user.userID)")
            print("idToken: \(user.authentication.idToken)")
            print("name: \(user.profile.name)")
            print("email: \(user.profile.email)")
        }
    }
}

extension ViewController: GIDSignInUIDelegate {
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        viewController.dismiss(animated: true, completion: nil)
    }
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
}
