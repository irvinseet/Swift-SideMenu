//
//  ViewController.swift
//  mySideMenu
//
//  Created by Seet, Ting Yang Irvin (uif08816) on 30/5/22.
//

import SideMenu
import UIKit

class ViewController: UIViewController {
    
    private var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menu = SideMenuNavigationController(rootViewController: MenuViewController(with: ["Home", "Info", "Settings"]))
        menu?.leftSide = true
        
        //add gestures
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
    }

    @IBAction func didTappedMenuButton(_ sender: UIBarButtonItem) {
        present(menu!, animated: true)
    }
    
}
