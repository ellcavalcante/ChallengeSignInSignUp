//
//  SignUpViewController.swift
//  ChallengeSignIn&SignUp
//
//  Created by Ellington Cavalcante on 11/08/23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var screen: SignUpScreen?
    
    override func loadView() {
        screen = SignUpScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.configTextFieldDelegate(delegate: self)
        screen?.addtap()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        screen?.configButtonEnable(false)
    }
}

extension SignUpViewController: SignUpScreenProtocol {
    func actiontapGesture() {
        let home: WebViewViewController = WebViewViewController()
        home.modalPresentationStyle = .formSheet
        self.present(home, animated: true)
    }
    
    func actionBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func actionSignUpButton() {
        
        screen?.firstNameTextField.text = ""
        screen?.lastNameTextField.text = ""
        screen?.emailTextField.text = ""
        screen?.passwordTextField.text = ""
        screen?.confirmPasswordTextField.text = ""
        
        let alert = UIAlertController(title: "Sucesso", message: "Cadastro foi realizado com sucesso", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            self.screen?.firstNameTextField.becomeFirstResponder()
            self.navigationController?.popToRootViewController(animated: true)
        }))
        present(alert, animated: true)
    }
}

extension SignUpViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        <#code#>
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        screen?.validaTextFields()
    }
}
