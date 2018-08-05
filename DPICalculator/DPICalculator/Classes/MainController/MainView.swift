//
//  MainView.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 05.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class MainView: UIView {

    let usernameTextField: UITextField
    let passwordTextField: UITextField
    let button: UIButton
    let stackView: UIStackView

    override init(frame: CGRect) {
        usernameTextField = UITextField(frame: .zero)
        usernameTextField.placeholder = NSLocalizedString("Username", comment: "")
        usernameTextField.borderStyle = .line

        passwordTextField = UITextField(frame: .zero)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = NSLocalizedString("Password", comment: "")
        passwordTextField.borderStyle = .line

        button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .gray
        button.tintColor = .white
        button.layer.cornerRadius = 5

        let textFieldStackView = UIStackView(arrangedSubviews: [usernameTextField, passwordTextField])
        textFieldStackView.axis = .vertical
        textFieldStackView.spacing = 10
        textFieldStackView.distribution = .fillEqually

        stackView = UIStackView(arrangedSubviews: [textFieldStackView, button])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20

        super.init(frame: frame)
        backgroundColor = .red

        addSubview(stackView)

        // MARK: - Layout
        let views = ["stackView": stackView]
        var layoutConstraints = [NSLayoutConstraint]()
        layoutConstraints += NSLayoutConstraint.constraints(withVisualFormat: "|-[stackView]-|", options: [], metrics: nil, views: views)
        layoutConstraints.append(usernameTextField.heightAnchor.constraint(equalToConstant: 30))
        layoutConstraints.append(button.heightAnchor.constraint(equalToConstant: 40))
        NSLayoutConstraint.activate(layoutConstraints)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
