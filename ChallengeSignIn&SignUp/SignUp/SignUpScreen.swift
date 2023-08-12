//
//  SignUpScreen.swift
//  ChallengeSignIn&SignUp
//
//  Created by Ellington Cavalcante on 11/08/23.
//

import UIKit

protocol SignUpScreenProtocol: AnyObject {
    func actionBackButton()
    func actionSignUpButton()
}

class SignUpScreen: UIView {
    
    private weak var delegate: SignUpScreenProtocol?
    func delegate(delegate: SignUpScreenProtocol?) {
        self.delegate = delegate
    }
    
    private lazy var backButton: UIButton = {
        let bButton = UIButton()
        bButton.translatesAutoresizingMaskIntoConstraints = false
        bButton.setImage(UIImage(named: "left"), for: .normal)
        bButton.imageView?.contentMode = .scaleToFill
        bButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return bButton
    }()
    
    @objc func tappedBackButton(){
        delegate?.actionBackButton()
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Criar conta"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cria sua conta e comece a gerenciar sua vida financeira"
        label.textColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1.0)
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var bottomTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ao criar a conta, você concorda com nossos  termos e condições de uso"
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("CRIAR CONTA", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 255/255, green: 167/255, blue: 38/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedSignUpButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedSignUpButton(){
        delegate?.actionSignUpButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func background() {
        backgroundColor = .white
    }
    
    private func addSubview() {
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(bottomTitleLabel)
        addSubview(signUpButton)
        setUpConstraints()
        background()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 26),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 26),
            titleLabel.widthAnchor.constraint(equalToConstant: 85),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 42),
            subTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            subTitleLabel.widthAnchor.constraint(equalToConstant: 346),
            
            bottomTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            bottomTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            bottomTitleLabel.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -12),
            
            signUpButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -52),
            signUpButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48),
            signUpButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -48),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
