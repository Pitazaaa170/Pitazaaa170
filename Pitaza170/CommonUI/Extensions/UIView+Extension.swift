//
//  UIView+Extension.swift
//  Pitaza170
//
//  Created by Глеб Фандеев on 19.11.2022.
//

import UIKit

extension UIView {
    func applyGradient(
        colors: [UIColor],
        startPoint: CGPoint?,
        endPoint: CGPoint?,
        axis: GradientAxis? = nil
    ) {
        let gradient = CAGradientLayer(
            colors: colors,
            startPoint: startPoint,
            endPoint: endPoint
        )
        gradient.frame = bounds
        layer.insertSublayer(gradient, at: 0)
    }
    
}
