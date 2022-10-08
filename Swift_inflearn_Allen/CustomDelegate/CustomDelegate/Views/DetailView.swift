//
//  DetailView.swift
//  CustomDelegate
//
//  Created by uiskim on 2022/10/08.
//

import UIKit
import SnapKit

class DetailView: UIView {
    
    //MARK: - 멤버 저장속성 구현
    // 멤버 데이터가 바뀌면 ===> didSet(속성감시자) 실행
    // 속성감시자도 (저장 속성을 관찰하는) 어쨌든 자체는 메서드임
    var member: Member? {
        didSet {
            guard var member = member else {
                // 멤버가 없으면 (즉, 새로운 멤버를 추가할때의 상황)
                // 멤버가 없으면 버튼을 "SAVE"라고 셋팅
                saveButton.setTitle("SAVE", for: .normal)
                // 멤버가 없으면, 타입 저장 속성의 현재 숫자 가져오기
                memberIdTextField.text = "\(Member.memberNumbers)"
                return
            }
            // 멤버가 있으면
            mainImageView.image = member.memberImage
            memberIdTextField.text = "\(member.memberId)"
            nameTextField.text = member.name
            phoneNumberTextField.text = member.phone
            addressTextField.text = member.address
            
            // 나이항목 (옵셔널 정수형)
            guard let age = member.age else {
                // 나이 항목이 없으면 빈문자열로 표시
                ageTextField.text = ""
                return
            }
            // 나이 항목이 있으면 정수 ==> 문자열 변환 표기
            ageTextField.text = "\(age)"
            
            // 나이항목의 구현
            //ageTextField.text = member.age != nil ? "\(member.age!)" : ""
        }
    }
    
    
    //MARK: - UI구현
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 75
        return imageView
    }()
    
    // 정렬을 깔끔하게 하기 위한 컨테이너뷰
    lazy var imageContainView: UIView = {
        let view = UIView()
        view.addSubview(mainImageView)
        return view
    }()
    
    let memberIdLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "멤버번호:"
        return label
    }()
    
    let memberIdTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 22
        tf.textColor = .black
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        return tf
    }()
    
    lazy var memberIdStackView: UIStackView = {
        //MARK : - stacview생성시 요소들을 넣으면서 선언하는 방법
        // lazy로선언해야하는 이유는 label이나 textfield가 선언되고나서 해야하기때문에, addsubview랑 비슷한이유
        let stview = UIStackView(arrangedSubviews: [memberIdLabel, memberIdTextField])
        stview.spacing = 5
        stview.axis = .horizontal
        //MARK : - distribtuion = .fill은 요소들 크기 그대로 두고 spacing을 동일하게, distribution = .fillequally는 요소의 크기를 강제로 동일하게 만듬
        stview.distribution = .fill
        stview.alignment = .fill
        return stview
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "이       름:"
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
    
    lazy var nameStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [nameLabel, nameTextField])
        stview.spacing = 5
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        return stview
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "나       이:"
        return label
    }()
    
    let ageTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 22
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        return tf
    }()
    
    lazy var ageStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [ageLabel, ageTextField])
        stview.spacing = 5
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        return stview
    }()
    
    let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "전화번호:"
        return label
    }()
    
    let phoneNumberTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 22
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        return tf
    }()
    
    lazy var phoneNumberStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [phoneNumberLabel, phoneNumberTextField])
        stview.spacing = 5
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        return stview
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "주       소:"
        return label
    }()
    
    let addressTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 22
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        return tf
    }()
    
    lazy var addressStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [addressLabel, addressTextField])
        stview.spacing = 5
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        return stview
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .systemBlue
        button.setTitle("UPDATE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.frame.size.height = 40
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [imageContainView, memberIdStackView, nameStackView, ageStackView, phoneNumberStackView, addressStackView, saveButton])
        stview.spacing = 10
        stview.axis = .vertical
        stview.distribution = .fill
        stview.alignment = .fill
        return stview
    }()
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        
        addSubview(stackView)
        
        mainImageView.snp.makeConstraints { make in
            make.size.equalTo(150)
            make.center.equalToSuperview()
        }
        
        imageContainView.snp.makeConstraints { make in
            make.height.equalTo(180)
        }
        
        memberIdLabel.snp.makeConstraints { make in
            make.width.equalTo(70)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.width.equalTo(70)
        }
        
        ageLabel.snp.makeConstraints { make in
            make.width.equalTo(70)
        }
        
        phoneNumberLabel.snp.makeConstraints { make in
            make.width.equalTo(70)
        }
        
        addressLabel.snp.makeConstraints { make in
            make.width.equalTo(70)
        }
        
        stackView.snp.makeConstraints { make in
            //MARK : - safeArea고려하는방법 safeAreaLayoutGuide를 사용한ㄷ
            make.top.equalTo(safeAreaLayoutGuide).offset(10)
            //MARK : - 여러방향 (top left, bottom right)가 섞여있는경우 inset을 사용한다
            make.left.right.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
        }
        
    }
}
