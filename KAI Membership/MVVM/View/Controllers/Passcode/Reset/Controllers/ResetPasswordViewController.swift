//
//  ResetPasscodeViewController.swift
//  KAI Membership
//
//  Created by Anh Kiệt on 20/02/2021.
//

import UIKit

class ResetPasscodeViewController: BaseViewController {

    // MARK: Properties
    private let emailTextField: KAIInputTextFieldView = {
        let view = KAIInputTextFieldView(with: .default, title: "EMAIL", placeholder: "an.nguyen@kardiachain.io", keyboardType: .emailAddress)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(NSAttributedString(string: "Send Instructions", attributes: [
            NSAttributedString.Key.font: UIFont.workSansFont(ofSize: 16, weight: .medium),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]), for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(onPressedSend), for: .touchUpInside)
        
        return button
    }()
    
    override var pageTitle: String {
        return "Reset Passcode"
    }
    
    override var pageDiscription: String {
        return "We will send an email with instructions to your registed email. "
    }
    
    // MARK: Life cycle's
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: Layout
    private func setupView() {
        view.addSubview(emailTextField)
        view.addSubview(sendButton)
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: pageTitleView.bottomAnchor, constant: 32),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            sendButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            sendButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            sendButton.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -(safeAreaInsets.bottom + 24)),
            sendButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            sendButton.heightAnchor.constraint(equalToConstant: 52),
        ])
        
        DispatchQueue.main.async {
            self.sendButton.gradientBackgroundColors([UIColor.init(hex: "394656").cgColor, UIColor.init(hex: "181E25").cgColor], direction: .vertical)
        }
    }
}

// MARK: Handle actions
extension ResetPasscodeViewController {
    
    @objc private func onPressedSend() {
        
    }
}
