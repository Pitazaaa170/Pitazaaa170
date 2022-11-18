//
//  AppGraph.swift
//  Pitaza170
//
//  Created by Глеб Фандеев on 18.11.2022.
//

import UIKit

protocol AppInerface {
    var rootViewController: UIViewController { get }
}

final class AppGraph: AppInerface {
    let rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    convenience init() {
        let vc = ViewController()
        self.init(rootViewController: vc)
    }
}
