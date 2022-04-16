//
//  MHView.swift
//  PinCode
//
//  Created by Mahmoud Hamad on 14/04/2022.
//

import UIKit

@IBDesignable
class MHView: UIView {
    
    // MARK: - Shadow
    @IBInspectable public var shadowOpacity: CGFloat = 0
    @IBInspectable public var shadowColor: UIColor = UIColor.clear
    @IBInspectable public var shadowRadius: CGFloat = 0
    @IBInspectable public var shadowOffset: CGSize = CGSize(width: 0, height: 0)

    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            if cornerRadius > 0 {
                self.layer.cornerRadius = cornerRadius
                //self.clipsToBounds = true
                self.clipsToBounds = false
                self.layer.masksToBounds = true
            }
        }
    }
    
    @IBInspectable var perfectCircle: Bool = false {
        didSet {
            if perfectCircle {
                self.layer.cornerRadius = self.frame.height / 2
                //self.clipsToBounds = true
                self.clipsToBounds = false
                self.layer.masksToBounds = true
            }
        }
    }
    
    
    
    var shadowView: UIView!

     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
        
        if perfectCircle {
            self.layer.cornerRadius = self.frame.height / 2
            //self.clipsToBounds = true
            self.clipsToBounds = false
            self.layer.masksToBounds = true
        }
        
        if shadowView == nil && shadowOpacity > 0 {
            shadowView = UIView(frame: self.frame)
            shadowView.backgroundColor = UIColor.clear
            shadowView.layer.shadowColor = shadowColor.cgColor
            shadowView.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: perfectCircle == false ? self.cornerRadius : self.frame.height/2).cgPath
            shadowView.layer.shadowOffset = shadowOffset
            shadowView.layer.shadowOpacity = Float(shadowOpacity)
            shadowView.layer.shadowRadius = shadowRadius
            shadowView.layer.masksToBounds = true
            shadowView.clipsToBounds = false
            
            //self.superview?.addSubview(shadowView)
            //self.superview?.bringSubview(toFront: self)
            
            self.superview?.insertSubview(shadowView, belowSubview: self)

        }
     }
}
