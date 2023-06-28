//
//  CircleViewController.swift
//  LionLab
//
//  Created by 김민재 on 2023/06/27.
//

import UIKit

import SnapKit

import KakaoSDKAuth
import KakaoSDKUser

final class CircleViewController: UIViewController {
    
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backgroundImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let kakaoLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("카카오로그인하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }

    private func setLayout() {
        
        view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        view.addSubview(kakaoLoginButton)
        kakaoLoginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(80)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        kakaoLoginButton.addTarget(self, action: #selector(kakaoLoginButtonTapped), for: .touchUpInside)
    }


    @objc func kakaoLoginButtonTapped() {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { oAuthToken, error in
                guard error == nil else { return }
                print("loginWithKakaoSucces")
                guard let oAuthToken = oAuthToken else { return }
                print(oAuthToken.accessToken)
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { oAuthToken, error in
                guard error == nil else { return }
                print("loginWithNoKakaoSucces")
                guard let oAuthToken = oAuthToken else { return }
                print(oAuthToken.accessToken)
                let nextVC = ArticleViewController()
                self.navigationController?.pushViewController(nextVC, animated: true)
            }
        }
    }
}
