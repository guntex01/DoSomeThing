//
//  LogInViewController.swift
//  DoSomeThing
//
//  Created by guntex01 on 6/24/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit
import Stevia

class LogInViewController: UIViewController {
    let screenWidth = UIScreen.main.bounds.width
    let screeHeight = UIScreen.main.bounds.height
    let logoImage: UIImageView = {
    let image = UIImageView()
        image.image = UIImage(named: "_logoDoST")
        //image.backgroundColor = .white
        return image
    }()
    let dstLabel: UILabel = {
    let label = UILabel()
        label.text = "DoSomeThing"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = UIColor.white
        return label
    }()
    let nameTextField: CustomTextField = {
        let textField = CustomTextField("Tài khoản", UIColor.white, UIColor.black, UIColor.placeholderText, CGRect.zero)
        textField.layer.cornerRadius = 20
        textField.layer.masksToBounds = true
        
        return textField
    }()
    let passwordTextField: CustomTextField = {
        let textField = CustomTextField("Mật khẩu", UIColor.white, UIColor.black, UIColor.placeholderText, CGRect.zero)
        textField.layer.cornerRadius = 20
        textField.layer.masksToBounds = true
        textField.isSecureTextEntry = true
        return textField
    }()
    let loginButton: CustomButton = {
        let button = CustomButton("Đăng nhập", UIColor.white, UIColor.imageColor(), .zero, UIFont.boldSystemFont(ofSize: 22))
        button.addTarget(self, action: #selector(nextPageHome), for: .touchUpInside)
        return button
    }()
    let noAccountLabel: UILabel = {
    let label = UILabel()
        label.text = "Không có tài khoản?"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .right
        return label
    }()
    let registerButton: UIButton = {
    let button = UIButton()
        button.text("Đăng ký")
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        return button
    }()
    var selectedTextField: UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.sv([logoImage,dstLabel, nameTextField, passwordTextField, loginButton, noAccountLabel,registerButton])
        view.applyGradient(withColours: [UIColor.imageColor(),UIColor.color01()], gradientOrientation: .horizontal)
        setupLayout()
        nameTextField.delegate = self
        passwordTextField.delegate = self
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapSuperView))
        self.view.addGestureRecognizer(gesture)
        
    }
    func setupLayout(){
        view.layout(
        50,
        |-100-logoImage.centerHorizontally()-100-| ~ 100,
        1,
        |-50-dstLabel-50-| ~ 40,
        50,
        |-50-nameTextField-50-| ~ 40,
        16,
        |-50-passwordTextField-50-| ~ 40,
        40,
        |-100-loginButton-100-|,
        20,
        |-80-noAccountLabel-registerButton-80-|
        )
        
        
        logoImage.Width == logoImage.Height
    }
    @objc func nextPage(){
    let registerVC = RegisterViewController()
        registerVC.modalPresentationStyle = .fullScreen
        self.present( registerVC, animated: true, completion: nil)
    }
    @objc func nextPageHome(){
    let tabBarVC = MyTabBarViewController()
        tabBarVC.modalPresentationStyle = .fullScreen
        self.present( tabBarVC, animated: true, completion: nil)
    //let navigation = UINavigationController(rootViewController: tabBarVC)
    
    //navigation.modalPresentationStyle = .fullScreen
    //self.present(navigation, animated: true, completion: nil)
    }
    @objc func tapSuperView(){
           self.view.endEditing(true)
       }
    
}
extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            passwordTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        textField.resignFirstResponder()
        return true
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        selectedTextField = textField
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string)
        return true

    }
}
