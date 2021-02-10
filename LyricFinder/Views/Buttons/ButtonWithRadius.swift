//
//  ButtonWithRadius.swift
//  LyricFinder
//
//  Created by George Nyakundi on 10/02/2021.
//

import UIKit

class ButtonWithRadius: UIButton {

    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
    }
    
}
