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
        screen?.tappedViewBottonScreen()
        screen?.validaTextFields()
        settings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        screen?.configButtonEnable(false)
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
        
        self.screen?.scroll.contentInset = contentInsets
        self.screen?.scroll.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        self.screen?.scroll.contentInset = .zero
        self.screen?.scroll.scrollIndicatorInsets = .zero
    }
    
    private func settings() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeFunc(_:)))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func swipeFunc(_ gesture: UIGestureRecognizer) {
        
        navigationController?.popToRootViewController(animated: true)
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}



