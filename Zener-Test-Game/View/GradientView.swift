//
//  GradientView.swift
//  Zener-Test-Game
//
//  Created by Hayden Jamieson on 03/02/2018.
//  Copyright © 2018 Hayden Jamieson. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {

    @IBInspectable var topColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        (layer as! CAGradientLayer).colors = [topColor.cgColor, bottomColor.cgColor]
    }
}
