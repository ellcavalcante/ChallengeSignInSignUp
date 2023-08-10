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
        
    }
}

