//
//  ViewController.swift
//  ChallengeSignIn&SignUp
//
//  Created by Ellington Cavalcante on 09/08/23.
//

import UIKit

class SignInViewController: UIViewController {
    
    var signInScreen: SignInScreen?
    
    override func loadView() {
        signInScreen = SignInScreen()
        view = signInScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInScreen?.delegate(delegate: self)
        signInScreen?.configTextFieldDelegate(delegate: self)
        settings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        signInScreen?.emailTextField.text = ""
        signInScreen?.passwordTextField.text = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
        guard let keyboardSize = (keyboardFrame as? NSValue)?.cgRectValue else { return }
        
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        
        self.signInScreen?.scroll.contentInset = contentInsets
        self.signInScreen?.scroll.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        self.signInScreen?.scroll.contentInset = .zero
        self.signInScreen?.scroll.scrollIndicatorInsets = .zero
    }
    
    private func settings() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
            view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension SignInViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 100/255, green: 181/255, blue: 246/255, alpha: 1.0).cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 6.0
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.1
        textField.layer.cornerRadius = 6.0
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension SignInViewController: SignInScreenProtocol {
    func actionRegisterButton() {
        let signUpVC: SignUpViewController = SignUpViewController()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    func actionForgotThePasswordButton() {
        if signInScreen?.emailTextField.text == "" {
            let alert = UIAlertController(title: "SignIn", message: "Informe o e-mail para continuar", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            signInScreen?.emailTextField.becomeFirstResponder()
            present(alert, animated: true)
        } else if signInScreen?.emailTextField.text == "meu@email.com" {
            let alert = UIAlertController(title: "SignIn", message: "Enviamos um e-mail para recuperação de senha", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alert, animated: true)
            signInScreen?.emailTextField.text = ""
        } else {
            let alert = UIAlertController(title: "SignIn", message: "Informe o e-mail para continuar", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            signInScreen?.emailTextField.becomeFirstResponder()
            present(alert, animated: true)
        }
    }
    
    func actionSignInButtonButton() {
        signInScreen?.emailTextField.becomeFirstResponder()
        let home: HomeViewController = HomeViewController()
        let email: String = signInScreen?.emailTextField.text ?? ""
        let password: String = signInScreen?.passwordTextField.text ?? ""
        
        if email == "meu@email.com" && password == "Teste@123" {
            signInScreen?.emailTextField.text = ""
            signInScreen?.passwordTextField.text = ""
            navigationController?.pushViewController(home, animated: true)
        } else {
            let alert = UIAlertController(title: "SignIn", message: "Entre com e-mail e senha válidos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alert, animated: true)
            signInScreen?.emailTextField.text = ""
            signInScreen?.passwordTextField.text = ""
        }
    }
}

