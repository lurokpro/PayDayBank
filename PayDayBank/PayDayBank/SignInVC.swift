//
//  SignInVC.swift
//  PayDayBank
//
//  Created by Сергей Мирошниченко on 06.03.2020.
//  Copyright © 2020 7rlines. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {
    
    public let viewModel = ViewModel()
    
    let layerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 101/255, green: 191/255, blue: 255/255, alpha: 1)
        return view
    }()
    
    private let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private let loginTextField : UITextFieldPadding = {
        let textField = UITextFieldPadding()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .left
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 8
        textField.placeholder = "Enter your login"
        return textField
    }()
    
    private let passwordTextField : UITextFieldPadding = {
        let textField = UITextFieldPadding()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 8
        textField.isSecureTextEntry = true
        textField.placeholder = "Enter your password"
        return textField
    }()
    
    private let loginButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign in", for: .normal)
        button.setTitleColor(UIColor(red: 101/255, green: 191/255, blue: 255/255, alpha: 1), for: .normal)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(signInTouchUpInside), for: .touchUpInside)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let signUpButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(UIColor(red: 101/255, green: 191/255, blue: 255/255, alpha: 1), for: .normal)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(signUnTouchUpInside), for: .touchUpInside)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let logoImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(SignInVC.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SignInVC.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        loginButton.isEnabled = true
        signUpButton.isEnabled = true
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(layerView)
        layerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        layerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        layerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        layerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        layerView.addSubview(containerView)
        containerView.centerYAnchor.constraint(equalTo: layerView.centerYAnchor).isActive = true
        containerView.centerXAnchor.constraint(equalTo: layerView.centerXAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: layerView.leftAnchor, constant: 16).isActive = true
        containerView.rightAnchor.constraint(equalTo: layerView.rightAnchor, constant: -16).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 208).isActive = true
        
        containerView.addSubview(loginTextField)
        loginTextField.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        loginTextField.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        loginTextField.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        
        containerView.addSubview(passwordTextField)
        passwordTextField.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 16).isActive = true
        
         
        containerView.addSubview(loginButton)
        loginButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        containerView.addSubview(signUpButton)
        signUpButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        signUpButton.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        signUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16).isActive = true
        signUpButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        
        layerView.addSubview(logoImageView)
        logoImageView.leftAnchor.constraint(equalTo: layerView.leftAnchor, constant: 16).isActive = true
        logoImageView.rightAnchor.constraint(equalTo: layerView.rightAnchor, constant: -16).isActive = true
        logoImageView.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: -16).isActive = true
        logoImageView.topAnchor.constraint(greaterThanOrEqualTo: layerView.topAnchor, constant: 16).isActive = true

        layerView.bringSubviewToFront(containerView)
        layerView.bringSubviewToFront(logoImageView)
    }
}


extension SignInVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
//    @objc func hideKeyboard(_ sender: UITapGestureRecognizer) {
//        view.endEditing(true)
//    }
    
    @objc func signInTouchUpInside(_ sender: UIButton) {
        view.endEditing(true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyboard.instantiateViewController(withIdentifier: "MainVCID")
        navigationController?.pushViewController(mainVC, animated: true)
        loginButton.isEnabled = false
    }
    
    @objc func signUnTouchUpInside(_ sender: UIButton) {
        view.endEditing(true)
        signUpButton.isEnabled = false
        viewModel.authenticate{
            let signUpVC = SignUpVC()
            self.navigationController?.pushViewController(signUpVC, animated: true)
        }
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            print("notification: Keyboard will show")
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - containerView.frame.size.height*1.2
            }
        }
    }

    @objc func keyboardWillHide(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y += keyboardSize.height - containerView.frame.size.height*1.2
            }
        }
    }
}

class UITextFieldPadding : UITextField {

    let padding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
