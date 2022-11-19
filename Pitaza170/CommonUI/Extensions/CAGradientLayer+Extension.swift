//
//  File.swift
//  Pitaza170
//
//  Created by Глеб Фандеев on 19.11.2022.
//

import UIKit

enum GradientAxis {
    case vertival, horizontal
}

extension CAGradientLayer {
    convenience init(
        colors: [UIColor],
        startPoint: CGPoint?,
        endPoint: CGPoint?,
        axis: GradientAxis? = nil
    ) {
        self.init()
        self.colors = colors.map { $0.cgColor }
        self.startPoint = startPoint ?? CGPoint(x: 0, y: 0)
        self.endPoint = endPoint ?? CGPoint(x: 0, y: 1)
    }
}
