//
//  GradientView.swift
//  Ponix
//
//  Created by Andrew Smith on 11/12/17.
//  Copyright © 2017 Andrew Smith. All rights reserved.
//

import UIKit
@IBDesignable
class GradientView: UIView {

    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.0938704398, green: 0.7469265546, blue: 0.06713275429, alpha: 1) {
        didSet {
            self.setNeedsLayout()
            
        }
        
    }

    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0.2270135949, green: 0.3861437183, blue: 0.157998203, alpha: 0.943359375) {
        didSet {
            self.setNeedsLayout()
        }
        
    }
    
    override func layoutSubviews() {
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [topColor.cgColor, bottomColor]
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
            gradientLayer.frame = self.bounds
            self.layer.insertSublayer(gradientLayer, at: 0)
        
    }

}
