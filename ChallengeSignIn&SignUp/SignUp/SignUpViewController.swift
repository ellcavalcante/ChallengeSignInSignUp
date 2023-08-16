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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension SignUpViewController: SignUpScreenProtocol {
    func actionBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func actionSignUpButton() {
        print(#function)
    }
}
