//
//  UITextViewRoundedBorder.swift
//  LyricFinder
//
//  Created by George Nyakundi on 10/02/2021.
//

import UIKit

class UITextViewRoundedBorder: UITextField {
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = bounds.height / 2
        self.layer.masksToBounds = true
    }

}
