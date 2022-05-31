//
//  MenuItem.swift
//  
//
//  Created by Seet, Ting Yang Irvin (uif08816) on 31/5/22.
//

import Foundation
import UIKit

enum SideMenuItem: CaseIterable {
    case home
    case info
    case settings
    
    var icon: UIImage {
        switch self {
        case .home:
            return UIImage(systemName: "house")!
        case .info:
            return UIImage(systemName: "info.circle")!
        case .settings:
            return UIImage(systemName: "gearshape.fill")!
        }
    }
        
        var title: String {
            switch self {
            case .home:
                return "Home"
            case .info:
                return "Info"
            case .settings:
                return "Settings"
            }
        }
}


