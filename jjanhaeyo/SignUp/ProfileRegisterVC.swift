//
//  ProfileRegisterVC.swift
//  jjanhaeyo
//
//  Created by minjae on 08/09/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class ProfileRegisterVC: UIViewController {
    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var nicknameTextView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationView.setContraintsForDevice(NotchO: 100, NotchX: 76)
        
    }
 

}
