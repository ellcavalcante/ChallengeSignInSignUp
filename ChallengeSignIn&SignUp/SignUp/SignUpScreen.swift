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
        let myAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15) as Any]
        let myString = NSMutableAttributedString(string: "Ao criar a conta, você concorda com nossos", attributes: myAttributes)
        let myAttributes2 = [NSAttributedString.Key.foregroundColor: UIColor(red: 33/255, green: 150/255, blue: 243/255, alpha: 1.0), NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15) as Any]
        let myString2 = NSAttributedString(string: " termos e condições de uso", attributes: myAttributes2)
        myString.append(myString2)
        label.attributedText = myString
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let stackViewTextFields: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 8
        return view
    }()
    
    lazy var firstNameTextField: UITextField = {
        let name = UITextField()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.autocorrectionType = .no
        name.backgroundColor = .white
        name.borderStyle = .roundedRect
        name.autocapitalizationType = .none
        name.keyboardType = .default
        name.placeholder = "Primeiro nome"
        name.textColor = .darkGray
        name.clearButtonMode = .whileEditing
        name.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
        return name
    }()
    
    lazy var lastNameTextField: UITextField = {
        let lastName = UITextField()
        lastName.translatesAutoresizingMaskIntoConstraints = false
        lastName.autocorrectionType = .no
        lastName.backgroundColor = .white
        lastName.borderStyle = .roundedRect
        lastName.autocapitalizationType = .none
        lastName.keyboardType = .default
        lastName.placeholder = "Último nome"
        lastName.textColor = .darkGray
        lastName.clearButtonMode = .whileEditing
        lastName.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
        return lastName
    }()
    
    lazy var emailTextField: UITextField = {
        let email = UITextField()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.autocorrectionType = .no
        email.backgroundColor = .white
        email.borderStyle = .roundedRect
        email.autocapitalizationType = .none
        email.keyboardType = .emailAddress
        email.placeholder = "Email"
        email.textColor = .darkGray
        email.clearButtonMode = .whileEditing
        email.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
        return email
    }()
    
    lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.autocorrectionType = .no
        password.backgroundColor = .white
        password.borderStyle = .roundedRect
        password.autocapitalizationType = .none
        password.keyboardType = .default
        password.placeholder = "Senha"
        password.isSecureTextEntry = true
        password.textColor = .darkGray
        password.clearButtonMode = .whileEditing
        password.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
        return password
    }()
    
    lazy var confirmPasswordTextField: UITextField = {
        let confirmPassword = UITextField()
        confirmPassword.translatesAutoresizingMaskIntoConstraints = false
        confirmPassword.autocorrectionType = .no
        confirmPassword.backgroundColor = .white
        confirmPassword.borderStyle = .roundedRect
        confirmPassword.autocapitalizationType = .none
        confirmPassword.keyboardType = .default
        confirmPassword.placeholder = "Confirmar senha"
        confirmPassword.isSecureTextEntry = true
        confirmPassword.textColor = .darkGray
        confirmPassword.clearButtonMode = .whileEditing
        confirmPassword.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
        return confirmPassword
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
    
    public lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
    
    private func configureStackView() {
        stackViewTextFields.addArrangedSubview(firstNameTextField)
        stackViewTextFields.addArrangedSubview(lastNameTextField)
        stackViewTextFields.addArrangedSubview(emailTextField)
        stackViewTextFields.addArrangedSubview(passwordTextField)
        stackViewTextFields.addArrangedSubview(confirmPasswordTextField)
    }
    
    private func addSubview() {
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(bottomTitleLabel)
        addSubview(signUpButton)
        addSubview(stackViewTextFields)
        addSubview(view)
        view.addSubview(bottomTitleLabel)
        configureStackView()
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

            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -114),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 65),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -65),
            view.heightAnchor.constraint(equalToConstant: 36),
            
            bottomTitleLabel.topAnchor.constraint(equalTo: view.topAnchor),
            bottomTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            stackViewTextFields.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 37),
            stackViewTextFields.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            stackViewTextFields.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            stackViewTextFields.heightAnchor.constraint(equalToConstant: 307),
            
            signUpButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -52),
            signUpButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48),
            signUpButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -48),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
