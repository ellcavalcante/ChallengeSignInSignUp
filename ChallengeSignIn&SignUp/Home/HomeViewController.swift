//
//  HomeViewController.swift
//  ChallengeSignIn&SignUp
//
//  Created by Ellington Cavalcante on 18/08/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
