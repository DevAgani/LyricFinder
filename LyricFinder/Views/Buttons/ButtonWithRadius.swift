//
//  ButtonWithRadius.swift
//  LyricFinder
//
//  Created by George Nyakundi on 10/02/2021.
//

import UIKit

class ButtonWithRadius: UIButton {
    
    private var loader = UIActivityIndicatorView()
    

    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
    }
    
    override var isEnabled: Bool {
        didSet {
            self.titleLabel?.isHidden = isEnabled ? false : true
        }
    }
    
    func isLoading(_ state: Bool, title: String = "") {
        switch state {
        case true:
            self.setTitle("", for: .normal)
            self.isEnabled = false
            let buttonHeight = self.bounds.size.height
            let buttonWidth = self.bounds.size.width
            loader.center = CGPoint(x: buttonWidth / 2, y: buttonHeight / 2)
            loader.color = UIColor(hex: Constants.shared.isabellineColor)
            self.addSubview(loader)
            loader.startAnimating()
        default:
            self.setTitle(title, for: .normal)
            self.isEnabled = true
            loader.stopAnimating()
            loader.removeFromSuperview()
        }
    }
    
}
