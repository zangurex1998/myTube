//
//  AppTabBarController.swift
//  myTube
//
//  Created by technomix on 16.03.23.
//

import UIKit

class AppTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.delegate = self
    }
    

    

}
extension AppTabBarController: UITabBarControllerDelegate{}
