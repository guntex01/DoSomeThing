//
//  HomesViewController.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/14/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit
import Stevia
class HomesViewController: UIViewController {
    let tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    let screenWidth = UIScreen.main.bounds.width
    let screeHeight = UIScreen.main.bounds.height
    
    let datas = sectionData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Trang chủ"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goCreate))
        self.navigationItem.rightBarButtonItem = addButton
        
        view.sv(containerView)
        containerView.sv(tableView)
        setupLayout()
        configTableView()
    }
    func configTableView(){
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    @objc func goCreate(){
        let createVC = CreateViewController()
        self.navigationController?.pushViewController(createVC, animated: true)
    }
    func setupLayout(){
        view.layout(
            1/10*screeHeight,
            |-0-containerView-0-|,
            1/11*screeHeight
        )
        containerView.layout(
            0,
            |-0-tableView-0-|,
            0
            
        )
    }
    
}
extension HomesViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.cellDatas = datas[indexPath.section].contents
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return datas[section].nameSection
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = CustomHeader()
        headerView.nameLabel.text = datas[section].nameSection
        headerView.moreButton.setTitle("xem thêm", for: .normal)
        headerView.section = section
        headerView.passSection = {[weak self]   in
            guard let StrongSelf = self else {return}
            
            if section == 0 {
                let itVc = ITViewController()
                StrongSelf.navigationController?.pushViewController(itVc, animated: true)
            }else if section == 1{
                let creationVC = CreationViewController()
                StrongSelf.navigationController?.pushViewController(creationVC, animated: true)
            }else{
                let engineerVC = EngineerViewController()
                StrongSelf.navigationController?.pushViewController(engineerVC, animated: true)
            }
            
        }
        return headerView
    }
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(50)
    }
    
}
