//
//  ViewController.swift
//  LoginScreenApp
//
//  Created by Artem Yershov on 19.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailTextFieldLine: UIView!
    @IBOutlet weak var passwardTextField: UITextField!
    @IBOutlet weak var passwardTextFieldLine: UIView!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var envelopeLable: UIImageView!
    @IBOutlet weak var lockLable: UIImageView!
    
    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var signUpLable: UIButton!
    
    // MARK: - Properties
    private let activeColor = UIColor(named: "custom") ?? UIColor.systemGray5
    
    var email = ""
    var passward = ""
    private var mockEmail = "centr@altek.ua"
    private var mockPassward = "W04101991e"
    private var isValidEmailProperty = false
    private var isValidPasswordProperty = false
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configLoginButton()
        emailTextField.delegate = self
        passwardTextField.delegate = self
        emailTextField.becomeFirstResponder()
    }
    
    //MARK: - Actions
    
    @IBAction func loginAction(_ sender: Any) {
        emailTextField.resignFirstResponder()
        passwardTextField.resignFirstResponder()
        
        if email.isEmpty {
            makeErrorField(textField: emailTextField)
        }
        if passward.isEmpty {
            makeErrorField(textField: passwardTextField)
        }
        
        if email == mockEmail, passward == mockPassward {
            performSegue(withIdentifier: "goToHomePage", sender: sender)
        } else {
            let alert = UIAlertController(title: "Error".localized, message: "Wrong password or email".localized, preferredStyle: .alert)
            let action = UIAlertAction(title: "Try againe!".localized, style: .default)
            alert.addAction(action)
            present(alert, animated: true)
        }
    }
    
    @IBAction func signUpAction(_ sender: Any) {
    }
    
    private func configLoginButton() {
        loginButton.layer.cornerRadius = 12
        loginButton.layer.shadowColor = UIColor.systemGray5.cgColor
        loginButton.layer.shadowOffset = .init(width: 0, height: 7)
        loginButton.layer.cornerRadius = 7
        loginButton.layer.shadowOpacity = 0.3
        loginButton.isUserInteractionEnabled = false
        loginButton.backgroundColor = .systemGray5
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !text.isEmpty else { return }
        
        switch textField {
        case emailTextField:
            let isValidEmail = checkEmail(email: text)
            
            if isValidEmail {
                // TODO: - save
                email = text
                envelopeLable.tintColor = activeColor
                emailTextFieldLine.backgroundColor = activeColor
                isValidEmailProperty = true
            } else {
                makeErrorField(textField: textField)
                isValidEmailProperty = false
            }
        case passwardTextField:
            let isValidPassword = chaeckPassword(password: text)
            
            if isValidPassword {
                // TODO: - save
                passward = text
                lockLable.tintColor = activeColor
                passwardTextFieldLine.backgroundColor = activeColor
                isValidPasswordProperty = true
            } else {
                makeErrorField(textField: textField)
                isValidPasswordProperty = false
            }
        default:
            print("Uncknown")
        }
        if isValidEmailProperty && isValidPasswordProperty {
            loginButton.backgroundColor = .systemMint
            loginButton.layer.shadowColor = activeColor.cgColor
            loginButton.isUserInteractionEnabled = true
        }
    }
    private func checkEmail(email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
    private func chaeckPassword(password: String) -> Bool {
        return password.count >= 4
    }
    private func makeErrorField(textField: UITextField) {
        switch textField {
        case emailTextField:
            envelopeLable.tintColor = .systemRed
            emailTextFieldLine.backgroundColor = .systemRed
        case passwardTextField:
            lockLable.tintColor = .systemRed
            passwardTextFieldLine.backgroundColor = .systemRed
        default:
            print("Uncknown")
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        loginAction(textField)
        return true
    }
}
