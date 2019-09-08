//
//  ColorExtension.swift
//  jjanhaeyo
//
//  Created by minjae on 08/09/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

// 그라데이션 컬러
extension CAGradientLayer {
    
    convenience init(frame: CGRect, colors: [UIColor]) {
        self.init()
        self.frame = frame
        self.colors = []
        for color in colors {
            self.colors?.append(color.cgColor)
        }
        startPoint = CGPoint(x: 0, y: 0)
        endPoint = CGPoint(x: 1, y: 1)
    }
    
    convenience init(frame: CGRect, colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint) {
        self.init()
        self.frame = frame
        self.colors = []
        for color in colors {
            self.colors?.append(color.cgColor)
        }
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    func createGradientImage() -> UIImage? {
        
        var image: UIImage? = nil
        UIGraphicsBeginImageContext(bounds.size)
        if let context = UIGraphicsGetCurrentContext() {
            render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }
}
