//
//  ViewController.swift
//  LottiePractice
//
//  Created by uiskim on 2022/10/14.
//

import Combine
import UIKit

import SnapKit
import Lottie

final class ViewController: UIViewController {
    
    var viewModel = HomeViewModel()
    
    lazy var animationView: LottieAnimationView = {
        let lottie = LottieAnimationView.init(name: "HomeLottie")
        lottie.frame = self.view.bounds
        lottie.center = self.view.center
        lottie.contentMode = .scaleAspectFill
        // 애니메이션의 속도를 조절
        lottie.animationSpeed = 0.5
        // 애니메이션의 loop를 조절
        //MARK : - .playOner: 한번만 실행, .repeat(Int): Int번 실행후 종료, .autoReverse: 실행->거꾸로실행 무한반복
        lottie.loopMode = .loop
        // 애니메이션을 시작함 특정한 상태에서 멈추고 싶으면 .stop()
        
        //MARK : - 애니메이션을 특정 프레임만큼만 실행하고 싶을떄
        //lottie.play(fromFrame: 시작프레임, toFrame: 끝프레임)
        // 프레임갯수를 알 수 있는 방법
        // lottie.animation?.endFrame
        lottie.play()
        return lottie
    }()
    
    private let myProfileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ProfileImage")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        return imageView
    }()
    
    private let otherPlanets: [UIImageView] = [
        UIImageView(image: UIImage(named: "PodingPlanet")),
        UIImageView(image: UIImage(named: "WodyPlanet")),
        UIImageView(image: UIImage(named: "YouthPlanet"))
    ]
    
    private let otherProfileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ProfileImage")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        label.textColor = .white
        label.attributedText = String.makeAtrributedString(name: "카리나",
                                                           appendString: " 와 함께",
                                                           changeAppendStringSize: 15,
                                                           changeAppendStringWieght: .regular,
                                                           changeAppendStringColor: .white)
        return label
    }()
    
    private let ddayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "D+273"
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, ddayLabel])
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.alignment = .fill
        return stackView
    }()
    
    private lazy var profileStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: viewModel.isSingled ? [myProfileImage, otherProfileImage] : [myProfileImage])
        stackView.spacing = -10
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    private let alarmButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "AlarmImage"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let constellationCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 80, left: 20, bottom: 20, right: 20)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ConstellationCollectionViewCell.self, forCellWithReuseIdentifier: ConstellationCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private let myPlanetImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "MyPlanetImage")
        return imageView
    }()

    /// View Model과 bind 합니다.
    private func bind() {
        // input
        
        // output
        
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        

        view.addSubview(animationView)
        
        
        setUI()
        bind()
    }
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self.view)
        let screenHeight = UIScreen.main.bounds.height
        if gesture.state == .began {
            print("Began")
        } else if gesture.state == .changed {
            UIView.animate(withDuration: 0.8) {
                self.constellationCollectionView.alpha = 0
                
                let scale = CGAffineTransform(scaleX: 0.5, y: 0.5).translatedBy(x: 0, y: -screenHeight)
                print(translation.y)
                self.myPlanetImage.transform = scale
            }
        } else if gesture.state == .ended {
            if translation.y > -screenHeight/5 {
                UIView.animate(withDuration: 0.5) {
                    self.myPlanetImage.transform = .identity
                    self.constellationCollectionView.alpha = 1
                }
            } else {
                self.constellationCollectionView.isHidden = true
                self.myPlanetImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(myPlanetImageTappedAfterSmaller)))
                self.animationView.stop()
            }
        }
    }
    
    @objc func myPlanetImageTappedAfterSmaller() {
        UIView.animate(withDuration: 0.5) {
            self.constellationCollectionView.isHidden = false
            self.constellationCollectionView.alpha = 1
            self.myPlanetImage.transform = .identity
            self.animationView.play()
        }
    }
}

// MARK: - UI
extension ViewController {
    private func setUI() {
        setAttributes()
        setConstraints()
        
        view.backgroundColor = .clear
        myPlanetImage.isUserInteractionEnabled = true
        myPlanetImage.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture)))
    }
    
    /// Attributes를 설정합니다.
    private func setAttributes() {
        view.addSubview(labelStackView)
        view.addSubview(profileStackView)
        view.addSubview(alarmButton)
        view.addSubview(myPlanetImage)
        view.addSubview(constellationCollectionView)

        constellationCollectionView.dataSource = self
        constellationCollectionView.delegate = self
    }

    /// 화면에 그려질 View들을 추가하고 SnapKit을 사용하여 Constraints를 설정합니다.
    private func setConstraints() {
        myProfileImage.snp.makeConstraints { make in
            make.size.equalTo(50)
        }
        
        otherProfileImage.snp.makeConstraints { make in
            make.size.equalTo(50)
        }
        
        profileStackView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(60)
            make.height.equalTo(50)
        }
        
        labelStackView.snp.makeConstraints { make in
            make.left.equalTo(profileStackView.snp.right).offset(10)
            make.height.equalTo(50)
            make.centerY.equalTo(profileStackView.snp.centerY)
        }
        
        alarmButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(20)
            make.width.equalTo(19)
            make.height.equalTo(22)
            make.centerY.equalTo(labelStackView.snp.centerY)
        }
        
        constellationCollectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(labelStackView.snp.bottom)
            make.bottom.equalTo(myPlanetImage.snp.top)
        }
        
        myPlanetImage.snp.makeConstraints { make in
            let bounds = UIScreen.main.bounds
            make.centerY.equalTo(view.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(bounds.width * 1.2)
            make.height.equalTo(bounds.width * 1.2)
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.constellations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConstellationCollectionViewCell.identifier, for: indexPath) as? ConstellationCollectionViewCell else { return UICollectionViewCell() }
        cell.constellationImage.image = viewModel.constellations[indexPath.row]
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let tmpLabel : UIImageView = UIImageView()
        tmpLabel.image = viewModel.constellations[indexPath.row]
        return CGSize(width: tmpLabel.intrinsicContentSize.width / 5, height: 100)
    }
}

extension String {
    /// 특정글자의 font와 textColor를 바꿀수 있는 메서드
    /// - Parameters:
    ///   - name: 바뀌지 않는 문자열
    ///   - appendString: 바꾸고싶은 문자열
    ///   - changeAppendStringSize: 바꾸고싶은 문자열의 fontSize
    ///   - changeAppendStringWieght: 바꾸고싶은 문자열의 fontWeight
    ///   - changeAppendStringColor: 바꾸고 싶은 문자열의 fontColor
    /// - Returns: UILabel속성이라면 .text가 아니라 .attributedText로 받아야함
    static func makeAtrributedString(name: String,
                                     appendString: String,
                                     changeAppendStringSize: CGFloat,
                                     changeAppendStringWieght: UIFont.Weight,
                                     changeAppendStringColor: UIColor) -> NSMutableAttributedString {
        let profileString = name + appendString
        let attributedQuote = NSMutableAttributedString(string: profileString)
        attributedQuote.addAttribute(.foregroundColor, value: changeAppendStringColor, range: (profileString as NSString).range(of: appendString))
        attributedQuote.addAttribute(.font, value: UIFont.systemFont(ofSize: changeAppendStringSize, weight: .regular), range: (profileString as NSString).range(of: appendString))
        return attributedQuote
    }
}
