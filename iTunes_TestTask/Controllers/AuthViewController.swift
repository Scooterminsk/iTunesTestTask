//
//  ViewController.swift
//  iTunes_TestTask
//
//  Created by Zenya Kirilov on 5.10.22.
//

import UIKit

class AuthViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let backgroundView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let loginLabel: UILabel = {
       let label = UILabel()
        label.text = "LogIn"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTextField: UITextField = {
       let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextField: UITextField = {
       let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.setTitle("SignIn", for: .normal)
        button.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.setTitle("SignUp", for: .normal)
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var textFieldsStackView = UIStackView()
    private var buttonsStackView = UIStackView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupDelegates()
        setConstraints()
    }

    private func setupViews() {
        view.backgroundColor = .white
        title = "LogIn"
        
        
    }
    
    private func setupDelegates() {
        
    }
    
    @objc func signInButtonTapped() {
        print("signInButtonTapped")
    }
    
    @objc func signUpButtonTapped() {
        print(signUpButtonTapped)
    }

}

extension AuthViewController {
    
    private func setConstraints() {
        
    }
}

