//
//  InformationViewController.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/6/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit
import Stevia
import Firebase
class InformationViewController: UIViewController {
    let screenWidth = UIScreen.main.bounds.width
    let screeHeight = UIScreen.main.bounds.height
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    let accountImgae: UIImageView = {
        let image = UIImageView(image: UIImage(named: "nen1"))
        return image
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text("ABC")
        label.backgroundColor = .clear
        return label
    }()
    let laneView: UIView = {
        let view = UIView()
        view.backgroundColor = .lane()
        return view
    }()
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UINib(nibName: "InformationTableViewCell", bundle: nil), forCellReuseIdentifier: "InformationTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        return tableView
    }()
    var datas = [Information]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //photoImage()
        title = "Thông tin cá nhân"
        view.sv(containerView)
        containerView.sv([accountImgae,nameLabel,laneView,tableView])
        setupLayout()
        tableView.delegate = self
        tableView.dataSource = self
        datas = fakeData()
        
    }
    @objc func nextSetting(){
        let settingVC = SettingViewController()
        navigationController?.pushViewController(settingVC, animated: true)
    }
    func photoImage(){
        accountImgae.layer.cornerRadius = accountImgae.bounds.height/2
        accountImgae.layer.masksToBounds = true
        accountImgae.layer.borderWidth = 1
        accountImgae.layer.borderColor = UIColor.black.cgColor
    }
    func setupLayout(){
        view.layout(
            1/10 * screeHeight,
            |-0-containerView-0-|,
            1/10 * screeHeight
        )
        containerView.layout(
            10,
            |-20-accountImgae-10-nameLabel-50-| ~ 40,
            10,
            |-laneView-| ~ 1,
            10,
            |-0-tableView-0-|,
            0
        )
        accountImgae.Width == accountImgae.Height
    }
    
}
extension InformationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InformationTableViewCell", for: indexPath) as! InformationTableViewCell
        cell.infomation = datas[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let a = indexPath.row
        if a == 0 {
            let myrequestVC = MyRequestViewController()
            navigationController?.pushViewController(myrequestVC, animated: true)
        }else if a == 1 {
            let requestReceivedVC = RequestReceivedViewController()
            navigationController?.pushViewController(requestReceivedVC, animated: true)
        }else if a == 2 {
            let settingVC = SettingViewController()
            navigationController?.pushViewController(settingVC, animated: true)
        }else{
            let auth = Auth.auth()
            do {
                try auth.signOut()
                let defaults = UserDefaults.standard
                defaults.set(false, forKey: "isUserSignedIn")
                self.dismiss(animated: true, completion: nil)
            }catch let signOutError {
                self.present(Service.createAlertController(title: "Error", message: signOutError.localizedDescription), animated: true, completion: nil)
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
}
