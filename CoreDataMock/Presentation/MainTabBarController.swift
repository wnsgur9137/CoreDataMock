//
//  MainTabBarController.swift
//  CoreDataMock
//
//  Created by JunHyeok Lee on 2023/06/01.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    fileprivate class NavigationTab: UINavigationController {
        init(rootViewController: UIViewController, title: String?, image: UIImage?, selectedImage: UIImage?) {
            super.init(rootViewController: rootViewController)
            self.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        }
        required init?(coder aDecoder: NSCoder) {
            fatalError("NavigationTab has not been implemented")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [
            NavigationTab(rootViewController: SaveCoreDataViewController(), title: "Save", image: nil, selectedImage: nil),
            
            NavigationTab(rootViewController: FetchCoreDataViewController(), title: "Fetch", image: nil, selectedImage: nil)
        ]
    }
}
