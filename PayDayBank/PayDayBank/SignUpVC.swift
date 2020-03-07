//
//  SingUpVC.swift
//  PayDayBank
//
//  Created by Сергей Мирошниченко on 07.03.2020.
//  Copyright © 2020 7rlines. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    public let viewModel = ViewModel()
    
    let firstnameTextField : UITextFieldPadding = {
        let textField = UITextFieldPadding()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textContentType = .name
        textField.backgroundColor = .clear
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.placeholder = "Name"
        return textField
    }()
    let lastnameTextField : UITextFieldPadding = {
        let textField = UITextFieldPadding()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textContentType = .familyName
        textField.backgroundColor = .clear
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.placeholder = "Last name"
        return textField
    }()
    let phoneNumberTextField : UITextFieldPadding = {
        let textField = UITextFieldPadding()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textContentType = .telephoneNumber
        textField.backgroundColor = .clear
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.placeholder = "Phone number"
        return textField
    }()
    let emailTextField : UITextFieldPadding = {
        let textField = UITextFieldPadding()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textContentType = .emailAddress
        textField.backgroundColor = .clear
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.placeholder = "Email"
        return textField
    }()
    let passwordTextField : UITextFieldPadding = {
        let textField = UITextFieldPadding()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .clear
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.placeholder = "Password"
        return textField
    }()
    let genderSegmentedControl : UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.insertSegment(withTitle: "Male", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Female", at: 1, animated: false)
        return segmentedControl
    }()
    let dobTextField : UITextFieldPadding = {
        let textField = UITextFieldPadding()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
        textField.backgroundColor = .clear
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.placeholder = "Date of birth"
        return textField
    }()
    let completeButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.setTitle("Complete", for: .normal)
        button.setTitleColor(UIColor(red: 101/255, green: 191/255, blue: 255/255, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(completeRegistration), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstnameTextField.delegate = self
        lastnameTextField.delegate = self
        phoneNumberTextField.delegate = self
        emailTextField.delegate = self
        dobTextField.delegate = self
        passwordTextField.delegate = self
        
        view.backgroundColor = UIColor(red: 101/255, green: 191/255, blue: 255, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.addSubview(firstnameTextField)
        firstnameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        firstnameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        firstnameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        firstnameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 48).isActive = true
        
        view.addSubview(lastnameTextField)
        lastnameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        lastnameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        lastnameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        lastnameTextField.topAnchor.constraint(equalTo: firstnameTextField.bottomAnchor, constant: 16).isActive = true
        
        view.addSubview(phoneNumberTextField)
        phoneNumberTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        phoneNumberTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        phoneNumberTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        phoneNumberTextField.topAnchor.constraint(equalTo: lastnameTextField.bottomAnchor, constant: 16).isActive = true
        
        view.addSubview(emailTextField)
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        emailTextField.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 16).isActive = true
        
        view.addSubview(passwordTextField)
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16).isActive = true
        
        view.addSubview(genderSegmentedControl)
        genderSegmentedControl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        genderSegmentedControl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        genderSegmentedControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        genderSegmentedControl.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16).isActive = true
        
        view.addSubview(dobTextField)
        dobTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        dobTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        dobTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        dobTextField.topAnchor.constraint(equalTo: genderSegmentedControl.bottomAnchor, constant: 16).isActive = true
        
        view.addSubview(completeButton)
        completeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        completeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        completeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        completeButton.topAnchor.constraint(equalTo: dobTextField.bottomAnchor, constant: 16).isActive = true
    }
    
}

extension SignUpVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func completeRegistration(_ sender: UIButton) {
        view.endEditing(true)
        if preparedBeforeRegistration() {
            viewModel.customers {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    func presentAlert () {
        let alert = UIAlertController(title: "Attention", message: "All fields should be filled. Password should be minimum six characters in length!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func preparedBeforeRegistration() -> Bool {
        guard (self.genderSegmentedControl.selectedSegmentIndex as Int?) != nil else {
            presentAlert()
            return false
        }
        if     self.firstnameTextField.text!.isEmpty
            && self.lastnameTextField.text!.isEmpty
            && self.phoneNumberTextField.text!.isEmpty
            && self.emailTextField.text!.isEmpty
            && self.passwordTextField.text!.count < 6
            && self.dobTextField.text!.isEmpty
            {
                presentAlert()
                return false
        } else {
            return true
        }
    }
}
