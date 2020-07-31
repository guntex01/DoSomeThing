//
//  RegisterViewController.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/1/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit
import Stevia
import Firebase
class RegisterViewController: UIViewController {
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
        let textField = CustomTextField("Tên tài khoản", UIColor.white, UIColor.black, UIColor.placeholderText, CGRect.zero)
        textField.layer.cornerRadius = 20
        textField.layer.masksToBounds = true
        
        return textField
    }()
    let emailTextField: CustomTextField = {
        let textField = CustomTextField("Email", UIColor.white, UIColor.black, UIColor.placeholderText, CGRect.zero)
        textField.layer.cornerRadius = 20
        textField.layer.masksToBounds = true
        
        return textField
    }()
    let phoneTextField: CustomTextField = {
        let textField = CustomTextField("Số điện thoại", UIColor.white, UIColor.black, UIColor.placeholderText, CGRect.zero)
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
    let passwordTextnField: CustomTextField = {
        let textField = CustomTextField("Nhập lại mật khẩu", UIColor.white, UIColor.black, UIColor.placeholderText, CGRect.zero)
        textField.layer.cornerRadius = 20
        textField.layer.masksToBounds = true
        textField.isSecureTextEntry = true
        return textField
    }()
    let registerButton: CustomButton = {
        let button = CustomButton("Đăng ký", UIColor.white, UIColor.imageColor(), .zero, UIFont.boldSystemFont(ofSize: 22))
        button.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        return button
    }()
    let accountLabel: UILabel = {
        let label = UILabel()
        label.text = "Đã có tài khoản?"
        label.textColor = UIColor.textColor()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .right
        return label
    }()
    let loginButton: UIButton = {
        let button = UIButton()
        button.text("Đăng nhập")
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.textColor(), for: .normal)
        button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        return button
    }()
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    let containerView: UIView = {
        let view = UIView()
        
        return view
    }()
    var selectedTextField: UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.applyGradient(withColours: [UIColor.imageColor(),UIColor.color01()], gradientOrientation: .horizontal)
        view.sv(scrollView)
        scrollView.sv(containerView)
        containerView.sv([logoImage, dstLabel, nameTextField, emailTextField, phoneTextField, passwordTextField, passwordTextnField, registerButton, accountLabel, loginButton])
        setupLayout()
        nameTextField.delegate = self
        emailTextField.delegate = self
        phoneTextField.delegate = self
        passwordTextField.delegate = self
        passwordTextnField.delegate = self
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapSuperView))
        self.view.addGestureRecognizer(gesture)
        
        // đăng ký nhận thông báo khi có sự kiện bàn phím được bật lên
        NotificationCenter.default.addObserver(self, selector: #selector(willShowKeyboard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        //đăng ký nhận thông báo khui có sự kiện ẩn bàn phím
        NotificationCenter.default.addObserver(self, selector: #selector(willHideKeyboard(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    func setupLayout(){
        view.layout(
            0,
            |-0-scrollView-0-|,
            0
        )
        scrollView.layout(
            0,
            |-0-containerView.width(screenWidth)-0-| ~ 896,
            0
        )
        containerView.layout(
            50,
            |-150-logoImage.centerHorizontally()-150-| ~ 20,
            1,
            |-50-dstLabel-50-| ~ 40,
            50,
            |-50-nameTextField-50-| ~ 40,
            20,
            |-50-emailTextField-50-| ~ 40,
            20,
            |-50-phoneTextField-50-| ~ 40,
            20,
            |-50-passwordTextField-50-| ~ 40,
            20,
            |-50-passwordTextnField-50-| ~ 40,
            40,
            |-100-registerButton-100-|,
            20,
            |-80-accountLabel.width(150)-loginButton.width(80)-80-|
            
        )
        
        logoImage.Width == logoImage.Height
    }
    @objc func nextPage(){
        self.dismiss(animated: true, completion: nil)
    }
    @objc func tapSuperView(){
        self.view.endEditing(true)
    }
    @objc func willShowKeyboard( _ notification: NSNotification ){
        // tính kích thước bàn phím
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            // nếu mà y của textField mà lớn hơn view-eight của bàn phím
            if let selectedTextField = selectedTextField {
                if selectedTextField.frame.origin.y > view.frame.height - keyboardSize.height - selectedTextField.bounds.height {
                    
                    self.view.frame.origin.y = 0
                    // đẩy view lên một khoảng là chiều cao bàn phím
                    self.view.frame.origin.y -= keyboardSize.height
                }
            }
        }
    }
    //hàm này sẽ xử lý khi ẩn bàn phím
    @objc func willHideKeyboard(_ notification: NSNotification){
        self.view.frame.origin.y = 0
    }
}
extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            phoneTextField.becomeFirstResponder()
        case phoneTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextnField.becomeFirstResponder()
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
    @objc func didTapSignUpButton() {
        
        let signUpManager = FirebaseAuthManager()
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            signUpManager.createUser(email: email, password: password) {[weak self] (success) in
                guard let strongSelf = self else { return }
                var message: String = ""
                if (success) {
                    message = "User was sucessfully created."
                    self?.dismiss(animated: true, completion: nil)
                } else {
                    message = "There was an error."
                }
                let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                strongSelf.present(alertController, animated: true)
                
            }
            
        }
        
        
        func isValidEmail(_ email: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
        }
    }
}
