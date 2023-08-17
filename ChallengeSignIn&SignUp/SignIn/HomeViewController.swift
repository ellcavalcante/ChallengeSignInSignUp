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

    func validaTextFields() {
        
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
    }
}

extension HomeViewController: SignInScreenProtocol {
    func actionRegisterButton() {
        print(#function)
    }
    
    func actionForgotThePasswordButton() {
        print(#function)
    }
    
    func actionSignInButtonButton() {
        
        let email: String = signInScreen?.emailTextField.text ?? ""
        let password: String = signInScreen?.passwordTextField.text ?? ""
        
        if email == "meu@email.com" && password == "Teste@123" {
            let signUpVC: SignUpViewController = SignUpViewController()
            navigationController?.pushViewController(signUpVC, animated: true)
        } else {
            
        }
    }
}

