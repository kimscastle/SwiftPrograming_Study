//
//  ViewController.swift
//  ArticleRecommendationApp
//
//  Created by uiskim on 2023/06/13.
//

import UIKit

import SnapKit

final class ViewController: UIViewController {
    
    private var viewModel: BaseViewModel
    
    private let suggestionLabel: UILabel = {
        let label = UILabel()
        label.text = "의성님을 위한 추천 아티클"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8.0
        layout.itemSize = .init(width: 170, height: 100)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        return layout
    }()
    
    private lazy var suggestionArticleCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    private let myArticleTableView = UITableView()
    
    init(viewModel: BaseViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setViews()
        setLayout()
        setTableView()
        setCollectionView()
        setBind()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ArticleTableViewCell.dequeueReuseCell(tableView: tableView, input: viewModel.data[indexPath.row])
        cell.selectionStyle = .none
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "저장한 아티클"
    }
}

extension ViewController: ArticleLikeDelegate {
    func changeArticleLike(sender: UIButton, isLike: Bool) {
        guard let indexPath = myArticleTableView.indexPathForRow(at: sender.convert(CGPoint.zero, to: myArticleTableView)) else { return }
        var selectedData = viewModel.data[indexPath.row]
        selectedData.articelLike = isLike
        viewModel.storeUserLikeDate(key: selectedData.articelName, value: selectedData.articelLike ? 1.0 : 0.0)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.suggestionArticleList.isEmpty ? collectionView.setEmptyView(title: "데이터가부족합니다", message: "관심있는 아티클에 좋아요를 눌러보세요!") : collectionView.restore()
        return viewModel.suggestionArticleList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = SuggestionArticleCollectionViewCell.dequeueReuseCell(collectionView: collectionView, indexPath: indexPath, input: viewModel.suggestionArticleList[indexPath.row])
        return cell
    }
}

private extension ViewController {
    func setUI() {
        view.backgroundColor = .white
    }
    
    func setViews() {
        view.addsubViews(suggestionLabel, suggestionArticleCollectionView, myArticleTableView)
    }
    
    func setLayout() {
        suggestionLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.equalToSuperview().inset(20)
            make.bottom.equalTo(suggestionArticleCollectionView.snp.top)
        }
        suggestionArticleCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(140)
        }
        myArticleTableView.snp.makeConstraints { make in
            make.top.equalTo(suggestionArticleCollectionView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setTableView() {
        myArticleTableView.rowHeight = 70
        myArticleTableView.dataSource = self
        ArticleTableViewCell.register(tableview: myArticleTableView)
    }
    
    func setCollectionView() {
        SuggestionArticleCollectionViewCell.register(collectionView: suggestionArticleCollectionView)
        suggestionArticleCollectionView.dataSource = self
    }
    
    func setBind() {
        viewModel.reloadData = {
            self.suggestionArticleCollectionView.reloadData()
        }
    }
}
