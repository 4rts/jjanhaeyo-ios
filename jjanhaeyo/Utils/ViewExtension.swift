//
//  ColorExtension.swift
//  jjanhaeyo
//
//  Created by minjae on 08/09/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

// Border 
extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
}

// Shadow
extension UIView {
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}

// Gradient
extension UIView {
    func applyGradient(colours: [UIColor?], cornerRadius: CGFloat = 30) -> Void {
        self.applyGradient(colours: colours, locations: nil, cornerRadius: cornerRadius)
    }
    
    func applyGradient(colours: [UIColor?], locations: [NSNumber]?, cornerRadius: CGFloat) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { ($0 ?? UIColor(white: 1, alpha: 1)).cgColor}
        gradient.locations = locations
        gradient.cornerRadius = cornerRadius
        self.layer.addSublayer(gradient)
    }
}

// Constraints
extension UIView {
    public func setContraintsForDevice(NotchO: CGFloat, NotchX: CGFloat){
        for constraint in self.constraints {
            if constraint.identifier == "constraints" {
                if (UIDevice.current.isiPhoneXS || UIDevice.current.isiPhoneXSMAX)  {
                    constraint.constant = NotchO
                }
                else {
                    constraint.constant = NotchX
                }
            }
        }
    }
}

