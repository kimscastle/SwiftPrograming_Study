//
//  ViewModel.swift
//  ArticleRecommendationApp
//
//  Created by uiskim on 2023/06/14.
//

import UIKit

import CoreML

protocol BaseViewModel: ViewModelInput, ViewModelOutput {}
//typealias BaseViewModel = ViewModelInput & ViewModelOutput

protocol ViewModelInput {
    func storeUserLikeDate(key: String, value: Double)
}

protocol ViewModelOutput {
    var reloadData: (() -> Void)? { get set }
    var suggestionArticleList: [String] { get set }
    var data: [Article] { get set }
}

final class ViewModel: BaseViewModel {
    
    var reloadData: (() -> Void)?

    var data: [Article] = [
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
    
    var suggestionArticleList: [String] = [] {
        didSet {
            self.reloadData?()
        }
    }
    
    func storeUserLikeDate(key: String, value: Double) {
        self.recommenationData[key] = value
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
    
    private var recommendationModel: ArticleRecommendationModel = {
        do {
            let config = MLModelConfiguration()
            return try ArticleRecommendationModel(configuration: config)
        } catch {
            fatalError("추천모델을 찾지 못했습니다")
        }
    }()
}

