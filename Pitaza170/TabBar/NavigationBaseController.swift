//
//  NavigationBaseController.swift
//  Pitaza170
//
//  Created by Глеб Фандеев on 20.11.2022.
//

import UIKit
import SnapKit

class NavigationMenuBaseController: UITabBarController {
    var customTabBar: TabNavigationMenu!
    var tabBarHeight: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTabBar()
    }
    
    private func loadTabBar() {
        let tabItems: [TabItem] = [.bag, .market, .profile]
        setupCustomTabBar(tabItems) { (controllers) in
            self.viewControllers = controllers
        }
        self.selectedIndex = 0
    }
    
    private func setupCustomTabBar(
        _ menuItems: [TabItem],
        completion: @escaping ([UIViewController]) -> Void
    ) {
        let frame = tabBar.frame
        var controllers = [UIViewController]()

        tabBar.isHidden = false
        self.customTabBar = TabNavigationMenu(menuItems: menuItems, frame: frame)
        self.customTabBar.translatesAutoresizingMaskIntoConstraints = false
        self.customTabBar.clipsToBounds = true
        self.customTabBar.itemTapped = self.changeTab
        
        self.view.addSubview(customTabBar)
        NSLayoutConstraint.activate([
            self.customTabBar.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            self.customTabBar.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            self.customTabBar.widthAnchor.constraint(equalToConstant: tabBar.frame.width),
            self.customTabBar.heightAnchor.constraint(equalToConstant: tabBarHeight),
            self.customTabBar.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor)
        ])
        
        for idx in 0 ..< menuItems.count {
            controllers.append(menuItems[idx].viewController)
        }
        view.layoutIfNeeded()
        completion(controllers)
        
    }
    
    func changeTab(tab: Int) {
        self.selectedIndex = tab
    }
}
