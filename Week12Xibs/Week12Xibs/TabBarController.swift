//
//  TabBarController.swift
//  Week12Xibs
//
//  Created by Yundong Lee on 2021/12/15.
//

import UIKit
// Nav controller, tab contoller 비슷
// Tab bar - tab bar item (title, image, select image), tint color
// ios 13 -> UITabbarAppearance() 버전에 따른 분기 필요.

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstVC = SettingViewController(nibName: "SettingViewController", bundle: nil)
        let secondVC = SnapDetailViewController()
        let thirdVC = DetailViewController()
        let thirdNav = UINavigationController(rootViewController: thirdVC)
        
        firstVC.tabBarItem.title = "first"
        secondVC.tabBarItem.title = "second"
        thirdVC.tabBarItem.title = "third"
        firstVC.tabBarItem.image = UIImage(systemName: "pencil")
        
        
        // 이런식 가능
//        thirdVC.tabBarItem = UITabBarItem(title: <#T##String?#>, image: <#T##UIImage?#>, selectedImage: <#T##UIImage?#>)
        
        
        let appearence = UITabBarAppearance()
        appearence.configureWithDefaultBackground()
        
        tabBar.scrollEdgeAppearance = appearence
        tabBar.standardAppearance = appearence
        
        tabBar.tintColor = .black
        
        setViewControllers([firstVC,secondVC,thirdNav], animated: true)
        
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("Aa")
    }
}
