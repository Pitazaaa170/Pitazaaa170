//
//  TabItem.swift
//  Pitaza170
//
//  Created by Глеб Фандеев on 20.11.2022.
//

import UIKit

enum TabItem: String, CaseIterable {
    case bag
    case market
    case profile
    
    var viewController: UIViewController {
        switch self {
        case .bag:
            return BagViewController(presenter: BagViewPresenter())
        case .market:
            return MarketViewController(presenter: MarketViewPresenter())
        case .profile:
            return ProfileViewController()
        }
    }

    var icon: UIImage {
        switch self {
        case .bag:
            return UIImage(named: "bag")!
        case .market:
            return UIImage(named: "market")!
        case .profile:
            return UIImage(named: "profile")!
        }
    }
    
    var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
}
