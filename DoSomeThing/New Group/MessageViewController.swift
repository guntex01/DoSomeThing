//
//  MessageViewController.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/6/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit
import Stevia

class MessageViewController: UIViewController {
    let screenWidth = UIScreen.main.bounds.width
    let screeHeight = UIScreen.main.bounds.height
    let searchBar: UISearchBar = {
        var searchBar = UISearchBar()
        searchBar.text = "search"
        searchBar.backgroundColor = .red
        searchBar.layer.cornerRadius = 20
        return searchBar
    }()
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UINib(nibName: "MessagerTableViewCell", bundle: nil), forCellReuseIdentifier: "MessagerTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    var persons = [Person]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tin nhắn"
        view.sv([searchBar,tableView])
        setupLayout()
        tableView.delegate = self
        tableView.dataSource = self
        persons = fakeData()
    }
    func setupLayout(){
        view.layout(
            1/10 * screeHeight,
            |-30-searchBar-30-| ~ 30,
            10,
            |-0-tableView-0-|,
            0
            
        )
    }
    
    
}
extension MessageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessagerTableViewCell", for: indexPath) as! MessagerTableViewCell
        cell.person = persons[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") {(action, view, completion) in
            self.persons.remove(at: indexPath.row)
            tableView.reloadData()
            }
       
        delete.backgroundColor = .red
        let configration = UISwipeActionsConfiguration(actions: [delete])
        
        return configration
    }
   
}
