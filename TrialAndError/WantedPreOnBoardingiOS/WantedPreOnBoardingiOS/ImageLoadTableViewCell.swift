//
//  ImageLoadTableViewCell.swift
//  WantedPreOnBoardingiOS
//
//  Created by uiskim on 2023/02/20.
//

import UIKit
import SnapKit

class ImageLoadTableViewCell: UITableViewCell, CellReuseProtocol {
    
    var imageUrl: String?
    
    let imageLoadView = UIImageView()
    
    lazy var imageLoadButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Load", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(imageLoadButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func imageLoadButtonTapped() {
        loadImage()
    }
    
    func loadImage() {
        self.imageLoadView.image = UIImage(systemName: "flame.fill")
        guard let urlString = imageUrl, let url = URL(string: urlString) else { return }
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.imageLoadView.image = UIImage(data: data)
            }
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentView.addSubview(imageLoadView)
        imageLoadView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(50)
            make.size.equalTo(50)
        }
        contentView.addSubview(imageLoadButton)
        imageLoadButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(50)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
}
