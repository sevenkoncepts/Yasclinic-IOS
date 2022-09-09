//
//  TabBarViewController.swift
//  YAS Clinic
//
//  Created by MAC-1 on 22/06/2022.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
        
    }
    
    func setupItems() {
        print("setupItems@@@@")
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let firstVC = storyboard.instantiateViewController(withIdentifier: "SpecialitiesViewController")
        let navFirstController = UINavigationController(rootViewController: firstVC)
        navFirstController.tabBarItem.title = "title_specialities".localiz()
        navFirstController.tabBarItem.image = UIImage(named: "person")//!.withRenderingMode(.alwaysOriginal)
        
        let secondVC = storyboard.instantiateViewController(withIdentifier: "HospitalsViewController")
        let navSecondController = UINavigationController(rootViewController: secondVC)
        navSecondController.tabBarItem.title = "title_hospitals".localiz()
        navSecondController.tabBarItem.image = UIImage(named: "hospitals")//!.withRenderingMode(.alwaysOriginal)
        
        let thirdVC = storyboard.instantiateViewController(withIdentifier: "PCRTestViewController")
        let navThirdController = UINavigationController(rootViewController: thirdVC)
        navThirdController.tabBarItem.title = "title_pcr_test".localiz()
        navThirdController.tabBarItem.image = UIImage(named: "pcr")//!.withRenderingMode(.alwaysOriginal)
        
        let fourthVC = storyboard.instantiateViewController(withIdentifier: "AccountViewController")
        let navFourthController = UINavigationController(rootViewController: fourthVC)
        navFourthController.tabBarItem.title = "profile".localiz()
        navFourthController.tabBarItem.image = UIImage(named: "profile_person")?.withTintColor(.white)
        
        
        viewControllers = [navFirstController, navSecondController, navThirdController, navFourthController]
    }
    
}
