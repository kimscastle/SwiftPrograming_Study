//
//  ViewController.swift
//  ArticleRecommendationApp
//
//  Created by uiskim on 2023/06/13.
//

import UIKit
import CoreML

import SnapKit

final class ViewController: UIViewController {
    
    private var recommendationModel: ArticleRecommendationModel = {
        do {
            let config = MLModelConfiguration()
            return try ArticleRecommendationModel(configuration: config)
        } catch {
            fatalError("추천모델을 찾지 못했습니다")
        }
    }()
    
    private var data: [Article] = [
        .init(articelName: "태교하는방법", articelLike: false),
        .init(articelName: "임신1주차땐 뭘?", articelLike: false),
        .init(articelName: "임신 8주차땐 뭘?", articelLike: false),
        .init(articelName: "안전하게 외출하는법", articelLike: false),
        .init(articelName: "아내를 케어하는 방법", articelLike: false),
        .init(articelName: "아내가 음식을 못먹으면?", articelLike: false),
        .init(articelName: "스트레스관리법", articelLike: false),
        .init(articelName: "무슨음식이 좋을까요?", articelLike: false),
        .init(articelName: "무슨음식이 안좋을까요?", articelLike: false),
        .init(articelName: "남편이 해야하는 일", articelLike: false)
    ]
    
    private var suggestionArticleList: [String] = [] {
        didSet {
            suggestionArticleCollectionView.reloadData()
        }
    }
    
    private var recommenationData: [String : Double] = [:] {
        didSet {
            let input = ArticleRecommendationModelInput(items: recommenationData, k: 5)
            guard let unwrappedResults = try? recommendationModel.prediction(input: input) else {
                fatalError("Could not get results back!")
            }
            suggestionArticleList = unwrappedResults.recommendations
        }
    }
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addsubViews(suggestionLabel, suggestionArticleCollectionView, myArticleTableView)
        suggestionLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.equalToSuperview().inset(20)
            make.bottom.equalTo(suggestionArticleCollectionView.snp.top)
        }

        SuggestionArticleCollectionViewCell.register(collectionView: suggestionArticleCollectionView)
        suggestionArticleCollectionView.dataSource = self
        suggestionArticleCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(140)
        }
        myArticleTableView.rowHeight = 70
        myArticleTableView.dataSource = self
        ArticleTableViewCell.register(tableview: myArticleTableView)

        myArticleTableView.snp.makeConstraints { make in
            make.top.equalTo(suggestionArticleCollectionView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ArticleTableViewCell.dequeueReuseCell(tableView: tableView, input: data[indexPath.row])
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
        data[indexPath.row].articelLike = isLike
        recommenationData[data[indexPath.row].articelName] = data[indexPath.row].articelLike ? 1.0 : 0.0
        
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if suggestionArticleList.isEmpty {
            collectionView.setEmptyView(title: "데이터가부족합니다", message: "관심있는 아티클에 좋아요를 눌러보세요!")
        } else {
            collectionView.restore()
        }
        return suggestionArticleList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = SuggestionArticleCollectionViewCell.dequeueReuseCell(collectionView: collectionView, indexPath: indexPath, input: suggestionArticleList[indexPath.row])
        return cell
    }
}
