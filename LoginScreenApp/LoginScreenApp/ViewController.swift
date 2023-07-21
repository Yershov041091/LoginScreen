//
//  ViewController.swift
//  LoginScreenApp
//
//  Created by Artem Yershov on 19.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailTextFieldLine: UIView!
    @IBOutlet weak var passwardTextField: UITextField!
    @IBOutlet weak var passwardTextFieldLine: UIView!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var signUpLable: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configLoginButton()
    }
    
    //MARK: - Actions
    
    @IBAction func loginAction(_ sender: Any) {
    }
    
    @IBAction func signUpAction(_ sender: Any) {
    }
    
    private func configLoginButton() {
        loginButton.layer.cornerRadius = 12
        loginButton.layer.shadowOffset = .init(width: 3, height: 7)
        loginButton.layer.shadowColor = UIColor.black.cgColor
        loginButton.layer.cornerRadius = 5
        loginButton.layer.shadowOpacity = 0.5
    }
}

