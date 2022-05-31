//
//  ViewController.swift
//  mySideMenu
//
//  Created by Seet, Ting Yang Irvin (uif08816) on 30/5/22.
//

import SideMenu
import UIKit

enum SideMenuItem: String, CaseIterable {
    case home = "Home"
    case info = "Info"
    case settings = "Settings"
}

class ViewController: UIViewController, MenuControllerDelegate {
    
    private var sideMenu: SideMenuNavigationController?
    
    private let settingsController = SettingsViewController()
    private let infoController = InfoViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menu = MenuViewController(with: SideMenuItem.allCases)
        menu.delegate = self
        
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = true
        
        //add gestures
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
        addChildControllers()
    }
    
    private func addChildControllers() {
        addChild(settingsController)
        addChild(infoController)
        
        view.addSubview(settingsController.view)
        view.addSubview(infoController.view)
        
        settingsController.view.frame = view.bounds
        infoController.view.frame = view.bounds
        
        settingsController.didMove(toParent: self)
        infoController.didMove(toParent: self)
        
        settingsController.view.isHidden = true
        infoController.view.isHidden = true
    }
    
    @IBAction func didTappedMenuButton(_ sender: UIBarButtonItem) {
        present(sideMenu!, animated: true)
    }
    
    func didSelectMenuItem(named: SideMenuItem) {
        sideMenu?.dismiss(animated: true, completion: nil)
        
        title = named.rawValue // Set title of page
        
        // Can be improved using a ViewModel 
        switch named {
        case .home:
            settingsController.view.isHidden = true
            infoController.view.isHidden = true
            
        case .info:
            settingsController.view.isHidden = true
            infoController.view.isHidden = false
            
        case .settings:
            settingsController.view.isHidden = false
            infoController.view.isHidden = true
        }
    }
}
    
    

