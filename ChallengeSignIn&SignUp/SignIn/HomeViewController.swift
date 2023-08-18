//
//  ViewController.swift
//  ChallengeSignIn&SignUp
//
//  Created by Ellington Cavalcante on 09/08/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var signInScreen: SignInScreen?
    
    override func loadView() {
        signInScreen = SignInScreen()
        view = signInScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInScreen?.delegate(delegate: self)
        signInScreen?.configTextFieldDelegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 100/255, green: 181/255, blue: 246/255, alpha: 1.0).cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 6.0
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.1
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        return true
    }
}

extension HomeViewController: SignInScreenProtocol {
    func actionRegisterButton() {
        print(#function)
    }
    
    func actionForgotThePasswordButton() {
        if signInScreen?.emailTextField.text == "" {
            let alert = UIAlertController(title: "SignIn", message: "Informe o e-mail para continuar", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alert, animated: true)
        } else if signInScreen?.emailTextField.text == "meu@email.com" {
            let alert = UIAlertController(title: "SignIn", message: "Enviamos um e-mail para recuperação de senha", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alert, animated: true)
            signInScreen?.emailTextField.text = ""
        } else {
            let alert = UIAlertController(title: "SignIn", message: "Informe o e-mail para continuar", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alert, animated: true)
            signInScreen?.emailTextField.text = ""
        }
    }
    
    func actionSignInButtonButton() {
        
        let email: String = signInScreen?.emailTextField.text ?? ""
        let password: String = signInScreen?.passwordTextField.text ?? ""
        
        if email == "meu@email.com" && password == "Teste@123" {
            let signUpVC: SignUpViewController = SignUpViewController()
            navigationController?.pushViewController(signUpVC, animated: true)
            signInScreen?.emailTextField.text = ""
            signInScreen?.passwordTextField.text = ""
        } else {
            let alert = UIAlertController(title: "SignIn", message: "Entre com e-mail e senha válidos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alert, animated: true)
            signInScreen?.emailTextField.text = ""
            signInScreen?.passwordTextField.text = ""
        }
    }
}

