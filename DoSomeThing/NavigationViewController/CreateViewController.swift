//
//  CreateViewController.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/6/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    let screenWidth = UIScreen.main.bounds.width
    let screeHeight = UIScreen.main.bounds.height
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let professionLabel: UILabel = {
        let label = UILabel()
        label.text = "Ngành nghề"
        label.layer.borderWidth = 1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Khoảng giá"
        label.layer.borderWidth = 1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let professionTextField: CustomTextFieldCreatVC = {
        let textField = CustomTextFieldCreatVC("Ngành nghề", UIColor.white, UIColor.black, UIColor.plachoder(), .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
        return textField
    }()
    let priceTextField: CustomTextFieldCreatVC = {
        let textField = CustomTextFieldCreatVC("Khoảng giá", UIColor.white, UIColor.black, UIColor.plachoder(), .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
        return textField
    }()
    private let dataProfession = ["IT", "Sáng tạo", "Kỹ sư"]
    
    let professionPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        return pickerView
    }()
    private let dataPrice = ["0 ~ 1.000.000", "1.000.000 ~ 5.000.000", "5.000.000 ~ 10.000.000"]
    let pricePickerView: UIPickerView = {
        let pickerView = UIPickerView()
        return pickerView
    }()
    let textView: UITextView = {
        let textView = UITextView()
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lane().cgColor
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    let themeTextField: CustomTextField = {
        let textField = CustomTextField("Chủ đề", UIColor.white, UIColor.black, UIColor.plachoder(), .zero)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lane().cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let creatButton: CustomButton = {
        let button = CustomButton("Tạo yêu cầu", UIColor.color01(), UIColor.white, .zero, UIFont.boldSystemFont(ofSize: 22))
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        title = "Tạo yêu cầu"
        view.backgroundColor = .white
        professionLabel.becomeFirstResponder()
        getPickerView()
    }
    func getPickerView(){
        professionPickerView.delegate = self
        professionPickerView.dataSource = self
        professionTextField.inputView = professionPickerView
        pricePickerView.delegate = self
        pricePickerView.dataSource = self
        priceTextField.inputView = pricePickerView
        
    }
    func setupLayout(){
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 1/10 * screeHeight).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        scrollView.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        containerView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant:0).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 896).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        
        containerView.addSubview(professionLabel)
        professionLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30).isActive = true
        professionLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20).isActive = true
        professionLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        professionLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        containerView.addSubview(professionTextField)
        professionTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30).isActive = true
        professionTextField.leftAnchor.constraint(equalTo: professionLabel.rightAnchor, constant: 20).isActive = true
        professionTextField.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20).isActive = true
        professionTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        containerView.addSubview(priceLabel)
        priceLabel.topAnchor.constraint(equalTo: professionLabel.bottomAnchor, constant: 20).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20).isActive = true
        priceLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        containerView.addSubview(priceTextField)
        priceTextField.topAnchor.constraint(equalTo: professionTextField.bottomAnchor, constant: 20).isActive = true
        priceTextField.leftAnchor.constraint(equalTo: priceLabel.rightAnchor, constant: 20).isActive = true
        priceTextField.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20).isActive = true
        priceTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        containerView.addSubview(themeTextField)
        themeTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 1/4 * screeHeight).isActive = true
        themeTextField.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20).isActive = true
        themeTextField.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20).isActive = true
        themeTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        containerView.addSubview(textView)
        textView.topAnchor.constraint(equalTo: themeTextField.bottomAnchor, constant: 0).isActive = true
        textView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20).isActive = true
        textView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        containerView.addSubview(creatButton)
        creatButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 40).isActive = true
        creatButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 50).isActive = true
        creatButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -50).isActive = true
        creatButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        
    }
}
extension CreateViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pricePickerView {
            return dataPrice.count
        }else {
            return dataProfession.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pricePickerView {
            return dataPrice[row]
        }else{
            return dataProfession[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pricePickerView {
            priceTextField.text = dataPrice[row]
            priceTextField.resignFirstResponder()
        }else{
            professionTextField.text = dataProfession[row]
            professionTextField.resignFirstResponder()
        }
    }
}
