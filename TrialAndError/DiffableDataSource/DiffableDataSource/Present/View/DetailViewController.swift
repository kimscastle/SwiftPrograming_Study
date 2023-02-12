//
//  DetailViewController.swift
//  DiffableDataSource
//
//  Created by uiskim on 2023/02/12.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    var delegate: CustomDiffableDataSourceDelegate?
    
    let nameTitle: UILabel = {
        let label = UILabel()
        label.text = "이름"
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        //MARK : - 해당 요소의 크기를 고정하고 싶을때 frame사용
        tf.frame.size.height = 22
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        //MARK : - 클리어버튼 추가(안함)
        tf.clearsOnBeginEditing = false
        return tf
    }()
    
    let ageTitle: UILabel = {
        let label = UILabel()
        label.text = "나이"
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    let ageTextField: UITextField = {
        let tf = UITextField()
        //MARK : - 해당 요소의 크기를 고정하고 싶을때 frame사용
        tf.frame.size.height = 22
        tf.borderStyle = .roundedRect
        tf.keyboardType = .numberPad
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        //MARK : - 클리어버튼 추가(안함)
        tf.clearsOnBeginEditing = false
        return tf
    }()
    
    let adressTitle: UILabel = {
        let label = UILabel()
        label.text = "주소"
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    let adressTextField: UITextField = {
        let tf = UITextField()
        //MARK : - 해당 요소의 크기를 고정하고 싶을때 frame사용
        tf.frame.size.height = 22
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        //MARK : - 클리어버튼 추가(안함)
        tf.clearsOnBeginEditing = false
        return tf
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("취소", for: .normal)
        button.tintColor = .red
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func cancelButtonTapped() {
        dismiss(animated: true)
    }
    
    lazy var appendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("추가", for: .normal)
        button.tintColor = .blue
        button.addTarget(self, action: #selector(appendButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func appendButtonTapped() {
        if checkTextField(name: nameTextField.text, age: ageTextField.text, adress: adressTextField.text) {
            delegate?.addPerson(person: .init(name: nameTextField.text!, age: Int(ageTextField.text!)!, address: adressTextField.text!))
            dismiss(animated: true)
        } else {
            showAlert()
        }
    }
    
    private func checkTextField(name: String?, age: String?, adress: String?) -> Bool {
        guard let name = name, let adress = adress, let age = age else { return false }
        return name.isEmpty || adress.isEmpty || age.isEmpty ? false : true
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "다시확인해주세요", message: "메세지", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.nameTextField.becomeFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func setUI() {
        view.addsubViews(Views: nameTitle, nameTextField, ageTitle, ageTextField, adressTitle, adressTextField)
        nameTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.leading.equalToSuperview().inset(50)
            make.width.equalTo(50)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.centerY.equalTo(nameTitle.snp.centerY)
            make.leading.equalTo(nameTitle.snp.trailing).offset(30)
            make.trailing.equalToSuperview().inset(50)
        }
        
        ageTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.equalToSuperview().inset(50)
            make.width.equalTo(50)
        }
        
        ageTextField.snp.makeConstraints { make in
            make.centerY.equalTo(ageTitle.snp.centerY)
            make.leading.equalTo(nameTextField.snp.leading)
            make.trailing.equalToSuperview().inset(50)
        }
        
        adressTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(150)
            make.leading.equalToSuperview().inset(50)
            make.width.equalTo(50)
        }
        
        adressTextField.snp.makeConstraints { make in
            make.centerY.equalTo(adressTitle.snp.centerY)
            make.leading.equalTo(nameTextField.snp.leading)
            make.trailing.equalToSuperview().inset(50)
        }
        
        view.addsubViews(Views: cancelButton, appendButton)
        cancelButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(200)
            make.leading.equalToSuperview().inset(50)
            make.width.equalTo(100)
        }
        
        appendButton.snp.makeConstraints { make in
            make.top.equalTo(cancelButton.snp.top)
            make.trailing.equalToSuperview().inset(50)
            make.width.equalTo(100)
        }
    }
}


