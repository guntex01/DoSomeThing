//
//  NotificationViewController.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/6/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit
import Stevia
class NotificationViewController: UIViewController {
    let screenWidth = UIScreen.main.bounds.width
    let screeHeight = UIScreen.main.bounds.height
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UINib(nibName: "NotificationTableViewCell", bundle: nil), forCellReuseIdentifier: "NotificationTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    var notifications = [Notification]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Thông báo"
        view.sv(tableView)
        setupLayout()
        tableView.delegate = self
        tableView.dataSource = self
        notifications = fakeData()
    }
    func setupLayout(){
        view.layout(
            1/10 * screeHeight,
            |-0-tableView-0-|,
            1/11 * screenWidth
        )
    }
    
}
extension NotificationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as! NotificationTableViewCell
        cell.a = notifications[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
