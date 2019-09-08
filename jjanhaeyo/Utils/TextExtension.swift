//
//  TextExtension.swift
//  jjanhaeyo
//
//  Created by minjae on 08/09/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

extension UILabel {
    func setLineSpacing(_ text: String, lineSpacing: CGFloat) {
        let attributedString = NSMutableAttributedString(string: text)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        self.attributedText = attributedString
    }
}
