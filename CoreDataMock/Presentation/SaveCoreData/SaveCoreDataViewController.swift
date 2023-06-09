//
//  SaveCoreDataViewController.swift
//  CoreDataMock
//
//  Created by JunHyeok Lee on 2023/06/01.
//

import UIKit

final class SaveCoreDataViewController: UIViewController {
    
    private let nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Nickname"
        textField.textColor = .label
        return textField
    }()
    
    private let phoneTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Phone"
        textField.keyboardType = .phonePad
        return textField
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    private let textFieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16.0
        return stackView
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.setTitleColor(UIColor(ciColor: .white), for: .normal)
        button.backgroundColor = UIColor(ciColor: .cyan)
        return button
    }()
    
    private let viewModel: SaveCoreDataViewModel
    
    init() {
        self.viewModel = SaveCoreDataViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSaveButtonAction()
        
        addSubviews()
        setupLayoutConstraints()
    }
    
    private func addSaveButtonAction() {
        guard let nickname = nicknameTextField.text,
              let phone = phoneTextField.text,
              let email = emailTextField.text else {
            self.showAlertWithCancelAndConfirm(title: "CoreData 저장 실패", message: "기입하지 않은 정보가 존재합니다.") {}
            return
        }
        // TODO: - PassthroughSubject로 변경
        viewModel.convertStringIntoIntOfPhone(phone: phone) { result in
            switch result {
            case .success(let convertedPhone):
                self.viewModel.saveCoreData(nickname: nickname, phone: convertedPhone, email: email)
            case .failure(let error):
                print("error")
                self.showAlertWithConfirm(title: "CoreData 저장 실패", message: "정확한 핸드폰 번호를 입력해 주세요.\nError: \(error)")
            }
        }
    }
}

extension SaveCoreDataViewController {
    private func addSubviews() {
        self.view.addSubview(textFieldStackView)
        self.view.addSubview(saveButton)
        textFieldStackView.addArrangedSubview(nicknameTextField)
        textFieldStackView.addArrangedSubview(phoneTextField)
        textFieldStackView.addArrangedSubview(emailTextField)
    }
    
    private func setupLayoutConstraints() {
        
    }
}
