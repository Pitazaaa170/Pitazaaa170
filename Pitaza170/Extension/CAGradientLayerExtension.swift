//
//  CAGradientLayerExtension.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 18.11.2022.
//

import UIKit

extension CAGradientLayer {
    static func getFirstCustomGradient() -> CAGradientLayer{
        let gradient = CAGradientLayer()
        let colorTop = UIColor(red: 76.0/255.0, green: 46.0/255.0, blue: 110.0/255.0, alpha: 1)
        let colorBot = UIColor(red: 30.0/255.0, green: 61.0/255.0, blue: 52.0/255.0, alpha: 1)
        gradient.colors = [colorTop.cgColor, colorBot.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        return gradient
    }
    
    static func getSecondCustomGradient() -> CAGradientLayer{
        let gradient = CAGradientLayer()
        let colorTop = UIColor(red: 76.0/255.0, green: 46.0/255.0, blue: 110.0/255.0, alpha: 1)
        let colorBot = UIColor(red: 30.0/255.0, green: 61.0/255.0, blue: 52.0/255.0, alpha: 1)
        gradient.colors = [colorTop.cgColor, colorBot.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        return gradient
    }
}
