//
//  CarouselViewController.swift
//  ExInfiniteCarousel
//
//  Created by uiskim on 2023/04/26.
//

import UIKit


enum Metric {
    static let collectionViewHeight = UIScreen.main.bounds.width * 230 / 151
    static let cellWidth = UIScreen.main.bounds.width
}


class CarouselView: UIView {
    
    enum ScrollType {
        case normal
        case last
        case none
    }
    
    var carouselTimer: Timer?
    
    private var items: [TvingPoster] = TvingPoster.dummy()
    private var initalItemCount: Int = 0
    private var carouselItemCount: Int = 0
    private let initalPage = Metric.cellWidth


    private lazy var carouselView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: .makeCaruselFlowLayout)
        view.isScrollEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.contentInset = .zero
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isPagingEnabled = true
        return view
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.pageIndicatorTintColor = .gray
        pageControl.numberOfPages = items.count
        pageControl.currentPage = 0
        if #available(iOS 14.0, *) {
          pageControl.backgroundStyle = .minimal
          pageControl.allowsContinuousInteraction = false
        }
        pageControl.preferredIndicatorImage = UIImage(named: "pageIndicator_default")
        
        return pageControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setHierarchy()
        setUI()
        setDelegate()
        setCarouselProperty()
        activateTimer(4)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        carouselView.move(to: initalPage)
        pageControl.subviews.forEach {
            $0.transform = CGAffineTransform(scaleX: 2/3, y: 2/3)
        }
    }
}


extension CarouselView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else { return CollectionViewCell()}
        cell.item = items[indexPath.item]
        return cell
    }
}

extension CarouselView: UICollectionViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        initalizeTimer(interval: 4)
        
        let nextPage = Metric.cellWidth * Double(carouselItemCount - 2)
        let initalPage = Metric.cellWidth
        
        let checkScrollType: (UIScrollView) -> ScrollType = { i in
            if i.contentOffset.x == 0 { return .normal }
            if i.contentOffset.x == Double(self.carouselItemCount - 1) * Metric.cellWidth { return .last }
            return .none
        }

        let scroll: (ScrollType) -> Void = { type in
            if type == .last { scrollView.move(to: initalPage) }
            if type == .normal { scrollView.move(to: nextPage) }
        }
        
        scroll(checkScrollType(scrollView))
        
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.maxX) - 1
        
    }
    
    func initalizeTimer(interval: Double) {
        invalidateTimer()
        activateTimer(interval)
    }
}

private extension CarouselView {
    
    func setHierarchy() {
        backgroundColor = .white
        addSubview(carouselView)
        addSubview(pageControl)
    }
    
    func setUI() {
        carouselView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        carouselView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        carouselView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        carouselView.heightAnchor.constraint(equalToConstant: Metric.collectionViewHeight).isActive = true
        
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.bottomAnchor.constraint(equalTo: carouselView.bottomAnchor, constant: -20).isActive = true
        pageControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -60).isActive = true
        pageControl.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setDelegate() {
        carouselView.dataSource = self
        carouselView.delegate = self
    }
    
    func setCarouselProperty() {
        initalItemCount = items.count
        items.makeInfinityCarouselArray()
        carouselItemCount = items.count
    }
    

    
    func activateTimer(_ interval: Double) {
        carouselTimer = Timer.addCarouselTimerAction(timeInterval: interval) {
            self.slidePageAutometically(from: self.carouselView, range: self.initalItemCount)
        }
    }
    
    func slidePageAutometically(from view: UICollectionView, range pageCount: Int?) {
        guard let pageCount else { return }
        var currentItem = self.initalCellIndexPath().item
        currentItem += 1
        
        let changeInitalPage = { i in
            view.scroll(to: i, animation: true)
            if i == pageCount + 1 { DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { view.scroll(to: 1) } }
            self.pageControl.currentPage = (i - 1) % self.initalItemCount
        }
        
        let scrollCompletion: (Int) -> ((Int) -> Void) -> Void = { i in
            return { action in
                action(i)
            }
        }
        
        scrollCompletion(currentItem)(changeInitalPage)
    }
    
    func initalCellIndexPath() -> IndexPath {
        return carouselView.indexPathsForVisibleItems[0]
    }
    
    func scrollCompletion(_ item: Int, completion: (Int) -> Void) {
        completion(item)
    }
    
    func invalidateTimer() {
        carouselTimer?.invalidate()
    }
}

struct TvingPoster {
    let posterImage: UIImage?
    let title: String
    let content: String
}

extension TvingPoster {
    static func dummy() -> [TvingPoster] {
        return [
            .init(posterImage: .one,
                  title: "최강야구",
                  content: "사상 최강 야구팀이 생겼다!\n야구 강팀이 펼치는 양보없는 대결"),
            .init(posterImage: .two,
                  title: "패밀리",
                  content: "본격 가족사수 첩보 코미디 시작!\n평범한가족의 아슬아슬한 이중생활"),
            .init(posterImage: .three,
                  title: "래빗홀",
                  content: "개인주의는 기본, 사사로운감정은 환영\n100프로사심기반 여행프로젝트"),
            .init(posterImage: .four,
                  title: "아워게임",
                  content: "LG Twins의 그 험난했던 2022시즌!\n오직티빙에서만 볼수있는 이야기")
        ]
    }
}
