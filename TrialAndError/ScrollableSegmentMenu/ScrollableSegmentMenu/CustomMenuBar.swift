//
//  CustomMenuBar.swift
//  ScrollableSegmentMenu
//
//  Created by uiskim on 2023/04/30.
//

import UIKit

protocol MenuItemDelegate: AnyObject {
    func menuView(didSelectItemAt indexPath: IndexPath)
}

class CustomMenuBar: UIView {
    
    var isSelected: Int? {
        didSet {
            guard let isSelected else { return }
            collectionView.selectItem(at: IndexPath(item: isSelected, section: 0), animated: true, scrollPosition: .centeredHorizontally)
            guard let cell = collectionView.cellForItem(at: IndexPath(item: isSelected, section: 0)) as? MenuCollectionViewCell else { return }
            
            underLine.snp.remakeConstraints { make in
                make.bottom.equalTo(collectionView.snp.bottom)
                make.leading.equalTo(cell.snp.leading).offset(5)
                make.trailing.equalTo(cell.snp.trailing).offset(-5)
                make.height.equalTo(3)
                
            }
            UIView.animate(withDuration: 0.3) {
                self.layoutIfNeeded()
            }
        }
    }
    
    weak var delegate: MenuItemDelegate?
    
    private let labels = PageType.allCases.map{$0.rawValue}
    
    private var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private var underLine: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        
        addSubview(collectionView)
        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.cellId)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        addSubview(underLine)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func draw(_ rect: CGRect) {
        self.isSelected = 0
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}

extension CustomMenuBar: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return labels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.cellId, for: indexPath) as? MenuCollectionViewCell else { return MenuCollectionViewCell()}
        cell.title = labels[indexPath.item]

        return cell
    }
    
    
}

extension CustomMenuBar: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? MenuCollectionViewCell else { return }
        delegate?.menuView(didSelectItemAt: indexPath)
    }
}

extension CustomMenuBar: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: labels[indexPath.row].calcuateWidth(addPadding: 9), height: collectionView.frame.height)
    }
}
