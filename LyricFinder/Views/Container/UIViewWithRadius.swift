//
//  UIViewWithRadius.swift
//  LyricFinder
//
//  Created by George Nyakundi on 10/02/2021.
//

import UIKit

class UIViewWithRadius: UIView {

    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}

class UIViewWithBackgroundRadius : UIViewWithRadius {
    override func layoutSubviews() {
        super.layoutSubviews()
        setViewBorder()
    }
    
    func setViewBorder() {
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.bounds = bounds
        shapeLayer.position = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        shapeLayer.fillColor = UIColor(hex: Constants.shared.isabellineColor)?.cgColor
        shapeLayer.lineWidth = 1
        
        shapeLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 10).cgPath
        self.layer.insertSublayer(shapeLayer, at: 0)
        
    }
}

class UIViewRoundedCornerRadius: UIView {
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}

class UIViewWithRoundedTopCornerRadius: UIView {
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 25
        self.clipsToBounds = true
        self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    }
}


