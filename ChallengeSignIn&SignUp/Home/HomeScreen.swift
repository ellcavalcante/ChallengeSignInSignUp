//
//  HomeScreen.swift
//  ChallengeSignIn&SignUp
//
//  Created by Ellington Cavalcante on 18/08/23.
//

import UIKit
import Lottie

protocol HomeScreenProtocol: AnyObject {
    func actionOutButton()
}

class HomeScreen: UIView {
    
    private weak var delegate: HomeScreenProtocol?
    func delegate(delegate: HomeScreenProtocol?) {
        self.delegate = delegate
    }
    
    private lazy var personAnimation: LottieAnimationView = {
        var animation = LottieAnimationView()
        animation.translatesAutoresizingMaskIntoConstraints = false
        animation = .init(name: "person")
        animation.frame = .init(x: 50, y: 200, width: 290, height: 230)
        animation.contentMode = .scaleAspectFit
        animation.loopMode = .loop
        animation.animationSpeed = 0.9
        animation.play(fromFrame: 0, toFrame: 50)
        return animation
    }()
    
    private lazy var welcomeAnimation: LottieAnimationView = {
        var animation = LottieAnimationView()
        animation.translatesAutoresizingMaskIntoConstraints = false
        animation = .init(name: "welcome")
        animation.frame = .init(x: 50, y: 450, width: 290, height: 80)
        animation.contentMode = .scaleAspectFit
        animation.loopMode = .loop
        animation.animationSpeed = 0.9
        animation.play(fromFrame: 0, toFrame: 50)
        return animation
    }()
    
    private lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public lazy var outButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("     Sair     ", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = UIColor.black
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(tappedOutButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedOutButton(){
        delegate?.actionOutButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configBackground()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configBackground() {
        backgroundColor = UIColor.white
    }
    
    private func addSubview() {
        addSubview(personAnimation)
        addSubview(welcomeAnimation)
        addSubview(outButton)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            outButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40),
            outButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
