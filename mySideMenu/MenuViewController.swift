//
//  MenuController.swift
//  mySideMenu
//
//  Created by Seet, Ting Yang Irvin (uif08816) on 30/5/22.
//

import Foundation
import UIKit

protocol MenuControllerDelegate {
    func didSelectMenuItem(named: SideMenuItem)
}

class MenuViewController: UITableViewController {
    
    public var delegate: MenuControllerDelegate?
    
    let menuItems: [SideMenuItem]
    //let backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    
    init(with menuItems: [SideMenuItem]) {
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        
        // Register reusable cell
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Style
        //tableView.backgroundColor = backgroundColor // child
        //view.backgroundColor = backgroundColor //parent view
    }
    
    //Table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuCell
        //cell.menuLabel.text = menuItems[indexPath.row].rawValue
        
        // Style
        cell.menuIcon.image = menuItems[indexPath.row].icon
        cell.menuLabel.text = menuItems[indexPath.row].title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Relay to delegate about menu item selection
        let selectedItem = menuItems[indexPath.row]
        delegate?.didSelectMenuItem(named: selectedItem)
    }
}
