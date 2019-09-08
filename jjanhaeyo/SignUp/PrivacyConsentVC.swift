//
//  PrivacyConsentVC.swift
//  jjanhaeyo
//
//  Created by minjae on 08/09/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class PrivacyConsentVC: UIViewController {

    @IBOutlet weak var agreeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        agreeButton.applyGradient(colours: [UIColor(hex: "#6a73ff"), UIColor(hex: "#6dafff")], locations: [0,1], cornerRadius: 40)
        
    }

}
