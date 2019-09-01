//
//  ShadowPressButton.swift
//  ButtonPressShadow
//
//  Created by Всеволод Андрющенко on 29/08/2019.
//  Copyright © 2019 Всеволод Андрющенко. All rights reserved.
//

import UIKit

class ShadowPressButton: UIButton {
    
    let pressLayer = CAShapeLayer()

    required init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
        setupButton()
        gestAdd()
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupButton()
        gestAdd()
    }

    private func setupButton(){

        backgroundColor = .white
        layer.cornerRadius = 10
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 1
        
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize.zero
        
        setTitleColor(.darkGray, for: .normal)
        setTitle("Кнопка", for: .normal)
        
        layer.addSublayer(pressLayer)
    }
    
    private func gestAdd(){
        let gest = UITapGestureRecognizer(target: self, action: #selector(buttonTapped))
        self.addGestureRecognizer(gest)
    }
    
    @objc func buttonTapped(_ gestureRecognizer: UITapGestureRecognizer){
        
        let pressPoint = gestureRecognizer.location(in: self)
        createShadow(pressPoint)
        
        let pressAnimation = CABasicAnimation(keyPath: "path")
        pressAnimation.toValue = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.frame.height).cgPath
        pressAnimation.isRemovedOnCompletion = true
        pressAnimation.duration = 0.3
        pressAnimation.fillMode = .forwards
        
        pressLayer.add(pressAnimation, forKey: "key")
    }
    
    
    //MASK: создания слоя эффекта нажатия передать точку касания
    private func createShadow(_ startPoin: CGPoint){
        pressLayer.masksToBounds = false
        pressLayer.opacity = 0.2
        pressLayer.fillColor = UIColor.lightGray.cgColor
        pressLayer.path = UIBezierPath(arcCenter: startPoin, radius: 0, startAngle: 0, endAngle: CGFloat.pi*2, clockwise: true).cgPath
        
    }
    
}
