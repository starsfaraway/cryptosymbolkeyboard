//
//  UIView+DropShadow.swift
//  EpisodeSolutions
//
//  Created by 86BMac on 11/17/16.
//  Copyright © 2016 86Borders, LLC. All rights reserved.
//

import UIKit

extension UIView {
    
    func addDropShadow(color: UIColor) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    }
    
    func addBigDropShadow(color: UIColor) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.8
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    }
    
    func removeDropShadow() {
        self.layer.masksToBounds = true
        self.layer.shadowRadius = 0.0
        self.layer.shadowOpacity = 0.4
        self.layer.shouldRasterize = false
        self.layer.shadowColor = UIColor.clear.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
    }
    
    func addLeftDropShadow(color: UIColor) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: -2.0, height: 0.0)
    }
    
    func addRightDropShadow(color: UIColor) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 2.0, height: 0.0)
    }
    
    func addTopDropShadow(color: UIColor) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 0.0, height: -2.0)
    }
    
    func addBottomDropShadow(color: UIColor) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
    }
    
}
