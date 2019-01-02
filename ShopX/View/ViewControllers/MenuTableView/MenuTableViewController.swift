//
//  MenuTableViewController.swift
//  ShopX
//
//  Created by Mostafa AbdEl Fatah on 12/30/18.
//  Copyright © 2018 Mostafa AbdEl Fatah. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController, MenuViewDelegate{
    
    fileprivate var menu:Menu?
    fileprivate var presenter:MenuPresenter?
    fileprivate var reuseIdentifier = "MenuCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        self.presenter = MenuPresenter(view: self)
    }
    
    func updateView(menu: Menu) {
        self.menu = menu
        self.tableView.reloadData()
    }
    
    func showMessage(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

extension MenuTableViewController {
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if menu != nil {
            return (menu?.gifts.count)!
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell:MenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MenuTableViewCell

        let gift = self.menu?.gifts[indexPath.row]
        if let store = self.menu?.stores.filter({ (store) -> Bool in
            return store.id == gift?.store
        }).first {
            cell.configCell(store: store, gift: gift!)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  200.0
    }

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }

}
