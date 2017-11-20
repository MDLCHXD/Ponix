//
//  StyledHeaderView.swift
//  Ponix
//
//  Created by Andrew Smith on 11/19/17.
//  Copyright © 2017 Andrew Smith. All rights reserved.
//

import UIKit
@IBDesignable
class StyledHeaderView: UIView {
    
    override func awakeFromNib() {
        self.makeShadow()
    }
    
    override func prepareForInterfaceBuilder() {
        self.makeShadow()
    }
    
    func makeShadow() {
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 10
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        
    }
    
  

}
