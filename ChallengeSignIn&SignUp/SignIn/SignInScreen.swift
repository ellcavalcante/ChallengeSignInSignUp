//
//  SignInScreen.swift
//  ChallengeSignIn&SignUp
//
//  Created by Ellington Cavalcante on 09/08/23.
//

import UIKit

protocol SignInScreenProtocol: AnyObject {
    func actionRegisterButton()
    func actionForgotThePasswordButton()
    func actionSignInButtonButton()
}

class SignInScreen: UIView {
    
    private weak var delegate: SignInScreenProtocol?
    func delegate(delegate: SignInScreenProtocol?) {
        self.delegate = delegate
    }
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Olá! \nQuer melhorar sua vida financeira?"
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    public lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Identifique-se e fique por dentro de todas as novidades!"
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let email = UITextField()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.autocorrectionType = .no
        email.backgroundColor = .white
        email.borderStyle = .roundedRect
        email.autocapitalizationType = .none
        email.keyboardType = .emailAddress
        email.placeholder = "Digite seu e-mail:"
        email.textColor = .darkGray
        email.clearButtonMode = .whileEditing
        email.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
        return email
    }()
    
    public lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.autocorrectionType = .no
        password.backgroundColor = .white
        password.borderStyle = .roundedRect
        password.autocapitalizationType = .none
        password.keyboardType = .default
        password.placeholder = "Digite sua senha:"
        password.textColor = .darkGray
        password.clearButtonMode = .whileEditing
        password.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
        return password
    }()
    
    public lazy var esqueceuSenhaButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Esqueci a senha", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(UIColor(red: 25/255, green: 118/255, blue: 210/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(tappedForgotThePasswordButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedForgotThePasswordButton() {
        delegate?.actionForgotThePasswordButton()
    }
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ENTRAR", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 255/255, green: 167/255, blue: 38/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedSignInButtonButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedSignInButtonButton(){
        delegate?.actionSignInButtonButton()
    }
    
    public lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public lazy var sideTextButton: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Não tem conta? "
        label.textAlignment = .left
        label.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    public lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Criar conta", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(UIColor(red: 33/255, green: 150/255, blue: 243/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    
    @objc func tappedRegisterButton(){
        delegate?.actionRegisterButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func backgroundColor() {
        backgroundColor = .white
    }
    
    private func addSubview() {
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(esqueceuSenhaButton)
        addSubview(signInButton)
        addSubview(view)
        view.addSubview(sideTextButton)
        view.addSubview(registerButton)
        setUpConstraints()
        backgroundColor()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 92),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 19),
            subTitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 22),
            subTitleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -22),
            
            emailTextField.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 102),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            emailTextField.heightAnchor.constraint(equalToConstant: 55),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            passwordTextField.heightAnchor.constraint(equalToConstant: 55),
            
            esqueceuSenhaButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 22),
            esqueceuSenhaButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 255),
            esqueceuSenhaButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            
            view.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 235),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -54),
            view.heightAnchor.constraint(equalToConstant: 14),

            sideTextButton.topAnchor.constraint(equalTo: view.topAnchor),
            sideTextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sideTextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            signInButton.topAnchor.constraint(equalTo: esqueceuSenhaButton.bottomAnchor, constant: 22),
            signInButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48),
            signInButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -48),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            
            registerButton.topAnchor.constraint(equalTo: view.topAnchor),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        ])
    }
}
