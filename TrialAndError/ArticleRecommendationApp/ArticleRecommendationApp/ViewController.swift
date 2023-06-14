//
//  ViewController.swift
//  ArticleRecommendationApp
//
//  Created by uiskim on 2023/06/13.
//

import UIKit

import SnapKit

final class ViewController: UIViewController {
    
    private var recommendationModel = ArticleRecommendationModel()
    
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
    
    private var recommenationData: [String : Double] = [:] {
        didSet {
            dump(recommenationData)
            let input = ArticleRecommendationModelInput(items: recommenationData, k: 5)
            guard let unwrappedResults = try? recommendationModel.prediction(input: input) else {
                fatalError("Could not get results back!")
            }
            let results = unwrappedResults.recommendations.enumerated().map { "\($0.offset+1)순위추천 : \($0.element)" }
            dump(results)
        }
    }
    
    private let myArticleTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        myArticleTableView.rowHeight = 70
        myArticleTableView.dataSource = self
        ArticleTableViewCell.register(tableview: myArticleTableView)
        view.addSubview(myArticleTableView)
        myArticleTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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
}

extension ViewController: ArticleLikeDelegate {
    func changeArticleLike(sender: UIButton, isLike: Bool) {
        guard let indexPath = myArticleTableView.indexPathForRow(at: sender.convert(CGPoint.zero, to: myArticleTableView)) else { return }
        data[indexPath.row].articelLike = isLike
        recommenationData[data[indexPath.row].articelName] = data[indexPath.row].articelLike ? 1.0 : 0.0
        
    }
}
