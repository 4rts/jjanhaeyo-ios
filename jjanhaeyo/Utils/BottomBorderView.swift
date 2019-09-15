//
//  BottomBorderView.swift
//  jjanhaeyo
//
//  Created by minjae on 09/09/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class BottomBorderView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.addBorder(side: .bottom, thickness: 1.0, color: UIColor(hex: "#ffffff") ?? UIColor(white: 1, alpha: 1))
    }

}
