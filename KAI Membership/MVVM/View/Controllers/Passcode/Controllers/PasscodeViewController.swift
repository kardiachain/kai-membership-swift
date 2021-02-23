//
//  PasscodeViewController.swift
//  KAI Membership
//
//  Created by Anh Kiệt on 23/02/2021.
//

import UIKit

class PasscodeViewController: BaseViewController {

    // MARK: Properties
    enum `Type` {
        case signUp
        case signIn
        case confirm
        case reset
    }
    
    private let type: `Type`
    
    override var pageTitle: String {
        switch type {
        case .signUp:
            return "Create Passcode"
        case .signIn:
            return "Enter passcode"
        case .confirm:
            return "Confirm Passcode"
        case .reset:
            return "New Passcode"
        }
    }
    
    override var pageDiscription: String {
        switch type {
        case .signUp:
            return "This passcode is super handy. It can save your life sometime. Try to remember it."
        case .signIn:
            return "Enter your passcode to continue."
        case .confirm:
            return "Confirm your passcode again. Just in case."
        case .reset:
            return "This passcode is super handy. It can save your life sometime. Try to remember it."
        }
    }
    
    private let footerString: String = "By creating a passcode, you agree with our \nTerms & Conditions and Privacy Policy"
    private let termsAndConditions: String = "Terms & Conditions"
    private let privacyPolicy: String = "Privacy Policy"
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        
        return view
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(NSAttributedString(string: "Confirm", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]), for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(onPressedConfirm), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var showPasscodeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(NSAttributedString(string: "Show Passcode", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular),
            NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.87)
        ]), for: .normal)
        button.addTarget(self, action: #selector(onPressedShowPasscode), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var footerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        label.numberOfLines = 2
        label.textAlignment = .center
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapFooterLabel(_:))))
        
        return label
    }()
    
    // MARK: Life cycle's
    init(with type: `Type`) {
        self.type = type
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: Layout
    private func setupView() {
        view.addSubview(containerView)
        view.addSubview(showPasscodeButton)
        view.addSubview(footerLabel)
        view.addSubview(confirmButton)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: pageTitleView.topAnchor, constant: 50),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 64),
            
            showPasscodeButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 18),
            showPasscodeButton.leadingAnchor.constraint(lessThanOrEqualTo: view.leadingAnchor, constant: 20),
            showPasscodeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showPasscodeButton.heightAnchor.constraint(equalToConstant: 40),
            
            footerLabel.topAnchor.constraint(equalTo: showPasscodeButton.bottomAnchor, constant: 94),
            footerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            footerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            confirmButton.topAnchor.constraint(equalTo: footerLabel.bottomAnchor, constant: 20),
            confirmButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            confirmButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            confirmButton.heightAnchor.constraint(equalToConstant: 52)
        ])
        
        configureFooterLabel()
        
        DispatchQueue.main.async {
            self.confirmButton.gradientBackgroundColors([UIColor.init(hex: "394656").cgColor, UIColor.init(hex: "181E25").cgColor], direction: .vertical)
        }
    }
    
    private func configureFooterLabel() {
        let mutableAttributedString = footerString.setTextWithFormat(font: .systemFont(ofSize: 14, weight: .regular), textAlignment: .center, lineHeight: 28, textColor: UIColor.black.withAlphaComponent(0.54))
        let termsAndConditionsRange = (footerString as NSString).range(of: termsAndConditions)
        mutableAttributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 14, weight: .regular), range: termsAndConditionsRange)
        mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.init(hex: "0F5DFA"), range: termsAndConditionsRange)
        
        let privacyPolicyRange = (footerString as NSString).range(of: privacyPolicy)
        mutableAttributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 14, weight: .regular), range: privacyPolicyRange)
        mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.init(hex: "0F5DFA"), range: privacyPolicyRange)
        
        footerLabel.attributedText = mutableAttributedString
    }
}

// MARK: Handle actions
extension PasscodeViewController {
    
    @objc private func onPressedConfirm() {
        
    }
    
    @objc private func onPressedShowPasscode() {
        
    }
    
    @objc private func onTapFooterLabel(_ recognizer: UITapGestureRecognizer) {
        let termsAndConditionsRange = (footerString as NSString).range(of: termsAndConditions)
        let privacyPolicyRange = (footerString as NSString).range(of: privacyPolicy)

        if recognizer.didTapAttributedTextInLabel(label: footerLabel, inRange: termsAndConditionsRange) {
            
        } else if recognizer.didTapAttributedTextInLabel(label: footerLabel, inRange: privacyPolicyRange) {
            
        }
    }
}
