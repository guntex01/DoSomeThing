//
//  MyTabBarViewController.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/6/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit

class MyTabBarViewController: UITabBarController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChildController()
        //UINavigationBar.appearance().backgroundColor = UIColor.green
        UINavigationBar.appearance().tintColor = UIColor.imageColor()
        UITabBar.appearance().tintColor = UIColor.imageColor()
        //UITabBar.appearance().backgroundColor = UIColor.green
    }
    func setupChildController(){
        let homeVC = HomesViewController()
        homeVC.view.backgroundColor = UIColor.white
        homeVC.tabBarItem = UITabBarItem(title: "Trang chủ", image: UIImage(named: "home"), tag: 0)
        let homeNavigation = UINavigationController(rootViewController: homeVC)
        
        let messageVC = MessageViewController()
        messageVC.view.backgroundColor = .white
        messageVC.tabBarItem = UITabBarItem(title: "Nhắn tin", image: UIImage(named: "chat"), tag : 1)
        let messageNavigation = UINavigationController(rootViewController: messageVC)

        let notificationVC = NotificationViewController()
        notificationVC.view.backgroundColor = UIColor.white
        notificationVC.tabBarItem = UITabBarItem(title: "Thông báo", image: UIImage(named: "bell"), tag: 3)
        let notificationNavigation = UINavigationController(rootViewController: notificationVC)
        
        let informationVC = InformationViewController()
        informationVC.view.backgroundColor = UIColor.white
        informationVC.tabBarItem = UITabBarItem(title: "Thông tin cá nhân", image: UIImage(named: "account"), tag: 2)
        let informationNavigation = UINavigationController(rootViewController: informationVC)
        
        self.setViewControllers([homeNavigation,messageNavigation,informationNavigation,notificationNavigation], animated: true)

    }
}

