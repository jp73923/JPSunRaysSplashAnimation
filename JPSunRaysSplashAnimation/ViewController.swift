//
//  ViewController.swift
//  JPSunRaysSplashAnimation
//
//  Created by Jay Patel on 02/04/21.
//  Copyright © 2021 Jay Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var vwSunShine: UIView!
    @IBOutlet weak var vwSun: UIView!

    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vwSun.backgroundColor = UIColor.orange
        self.vwSun.clipsToBounds = true
        self.vwSun.layer.cornerRadius = 125.0
        self.SetupSunRays()
    }

    //MARK:- Custom Functions
    func SetupSunRays() {
        let border = CAShapeLayer()
        border.path = UIBezierPath(roundedRect:self.vwSunShine.bounds, cornerRadius:UIScreen.main.bounds.size.height).cgPath
        border.frame = self.vwSunShine.bounds
        border.fillColor = nil
        border.strokeColor = UIColor.orange.cgColor
        border.lineWidth = UIScreen.main.bounds.size.height - 250.0
        border.lineDashPattern = [15.0]
        
        self.vwSunShine.layer.addSublayer(border)
        
        if border.animation(forKey: "linePhase") != nil {
            border.removeAnimation(forKey: "linePhase")
        } else {
            var dashAnimation: CABasicAnimation?
            dashAnimation = CABasicAnimation(
                keyPath: "lineDashPhase")
            
            dashAnimation?.fromValue = NSNumber(value: 30.0)
            dashAnimation?.toValue = NSNumber(value: 0.0)
            dashAnimation?.duration = CFTimeInterval(1.0)
            dashAnimation?.repeatCount = 10000
            
            border.add(dashAnimation!, forKey: "linePhase")
        }
    }
}

