//
//  MyRequestViewController.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/23/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit

class MyRequestViewController: UIViewController {
    let screenWidth = UIScreen.main.bounds.width
    let screeHeight = UIScreen.main.bounds.height
    
    let professionTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ngành nghề"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lane().cgColor
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let dateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "dd/mm/yyyy"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lane().cgColor
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let dataProfession = ["IT", "Sáng tạo", "Kỹ sư"]
    
    let professionPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        return pickerView
    }()
    
    let datePicker: UIDatePicker = {
        let date = UIDatePicker()
        
        return date
    }()
    let dateLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Yêu cầu của bạn"
        dateTextField.becomeFirstResponder()
        setupLayout()
        getPickerView()
        setDatePicker()
    }
    func setupLayout(){
        view.addSubview(professionTextField)
        professionTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 1/9 * screeHeight).isActive = true
        professionTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        professionTextField.widthAnchor.constraint(equalToConstant: 100).isActive = true
        professionTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(dateTextField)
        dateTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 1/9 * screeHeight).isActive = true
        dateTextField.leftAnchor.constraint(equalTo: professionTextField.rightAnchor, constant: 20).isActive = true
        dateTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        dateTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    func getPickerView(){
        professionPickerView.delegate = self
        professionPickerView.dataSource = self
        professionTextField.inputView = professionPickerView
    }
    func setDatePicker() {
        // set kiểu cho datePicker
        datePicker.datePickerMode = .date
        // gán datePicker cho textField
        dateTextField.inputView = datePicker
        // Set ngày mặc định khi hiển thị
        datePicker.setDate(Date(), animated: true)
        
        //  khởi tạo toolBar, toolBar.sizeToFit là các thành phần nằm trong nó tự dãn theo đúng kích thước width
        let toolBar = UIToolbar()
        dateTextField.inputAccessoryView = toolBar
        toolBar.sizeToFit()
        
        dateLabel.text = "Thời gian"
        
        // khai báo các thành phần trong toolBar (button,label)
        let doneButton = UIBarButtonItem(title: "Chọn", style: .plain, target: self, action: #selector(doneDateAction))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        let label = UIBarButtonItem(customView: dateLabel)
        let cancelButton = UIBarButtonItem(title: "Huỷ", style: .plain, target: self, action: #selector(cancelAction))
        
        // set các thành phần vào toolBar
        toolBar.setItems([cancelButton, spaceButton, label, spaceButton, doneButton], animated: false)
        
        // add hành động datepicker
        datePicker.addTarget(self, action: #selector(valueChangeDatePicker), for: UIControl.Event.valueChanged)
    }
    
    @objc func valueChangeDatePicker() {
        dateLabel.text = ConvertHelper.stringFromDate(date: datePicker.date, format: "dd/MM/yyyy")
        dateLabel.sizeToFit()
        
    }
    @objc func doneDateAction() {
        dateTextField.text = ConvertHelper.stringFromDate(date: datePicker.date, format: "dd/MM/yyyy")
        
    }
    @objc func cancelAction() {
        self.view.endEditing(true)
    }
}
extension MyRequestViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return dataProfession.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return dataProfession[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        professionTextField.text = dataProfession[row]
        professionTextField.resignFirstResponder()
    }
}
