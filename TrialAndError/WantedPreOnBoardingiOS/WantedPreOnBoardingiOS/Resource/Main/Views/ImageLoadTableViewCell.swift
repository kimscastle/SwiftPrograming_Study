//
//  ImageLoadTableViewCell.swift
//  WantedPreOnBoardingiOS
//
//  Created by uiskim on 2023/02/20.
//

import UIKit
import SnapKit

final class ImageLoadTableViewCell: UITableViewCell, CellReuseProtocol {
    
    var imageUrl: String?
    
    let imageLoadView = UIImageView()
    
    lazy var imageLoadButton: UIButton = {
        let button = UIButton(type: .system)
        button.createCustomButton(title: "Load", cornerRadius: 10)
        button.addTarget(self, action: #selector(imageLoadButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var progressBar: UIProgressView = {
        let progressBar = UIProgressView(progressViewStyle: .bar)
        progressBar.makeCustomProgress(cornerRadius: ProgressSize.progressRoundCorner, progress: 0.5)
        return progressBar
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        imageLoadView.image = UIImage.makeSFImage(imageString: CustomImage.defaultImage, size: CustomImage.imageSize)
        imageLoadView.contentMode = .scaleAspectFit
        contentView.addSubview(imageLoadView)
        imageLoadView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(50)
            make.height.equalTo(80)
            make.width.equalTo(100)
        }
        
        contentView.addSubview(imageLoadButton)
        imageLoadButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(20)
            make.width.equalTo(80)
            make.height.equalTo(50)
        }
        
        contentView.addSubview(progressBar)
        progressBar.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(imageLoadView.snp.right).offset(10)
            make.right.equalTo(imageLoadButton.snp.left).offset(-10)
            make.height.equalTo(ProgressSize.progressHeight)
        }
    }
    
    @objc func imageLoadButtonTapped() {
        loadImage()
    }
    
    func loadImage() {
        self.imageLoadView.image = UIImage.makeSFImage(imageString: CustomImage.defaultImage, size: CustomImage.imageSize)
        guard let urlString = imageUrl, let url = URL(string: urlString) else { return }
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.imageLoadView.image = UIImage(data: data)
            }
        }
    }
}
