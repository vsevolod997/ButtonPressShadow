//
//  ViewController.swift
//  ButtonPressShadow
//
//  Created by Всеволод Андрющенко on 29/08/2019.
//  Copyright © 2019 Всеволод Андрющенко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // testOval()
    }

    
    func testOval(){
        let oval = CAShapeLayer()
        let path = UIBezierPath(arcCenter: self.view.center, radius: 100, startAngle: 0, endAngle: CGFloat.pi*2, clockwise: true)
        oval.path = path.cgPath
        oval.fillColor = UIColor.yellow.cgColor
        self.view.layer.addSublayer(oval)
        
    }

}

