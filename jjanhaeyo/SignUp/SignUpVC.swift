//
//  SignUpVC.swift
//  jjanhaeyo
//
//  Created by minjae on 09/08/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import KakaoOpenSDK

class SignUpVC: UIViewController {


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
