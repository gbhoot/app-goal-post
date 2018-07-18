//
//  UIButtonExt.swift
//  goal-post
//
//  Created by Gurpreet Bhoot on 7/17/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setSelectedColor() {
        self.backgroundColor = #colorLiteral(red: 0.3215686275, green: 0.737254902, blue: 0.3607843137, alpha: 1)
        self.tintColor = #colorLiteral(red: 0.3215686275, green: 0.737254902, blue: 0.3607843137, alpha: 1)
    }
    
    func setDeselectedColor() {
        self.backgroundColor = #colorLiteral(red: 0.6470588235, green: 0.8705882353, blue: 0.6705882353, alpha: 1)
        self.tintColor = #colorLiteral(red: 0.6470588235, green: 0.8705882353, blue: 0.6705882353, alpha: 1)
    }
    
}
