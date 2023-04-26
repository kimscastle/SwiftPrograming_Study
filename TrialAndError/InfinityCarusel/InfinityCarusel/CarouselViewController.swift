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


class CarouselViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHierarchy()
        setUI()
        setDelegate()
        setCarouselProperty()
        activateTimer(2)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        carouselView.move(to: initalPage)
        pageControl.subviews.forEach {
            $0.transform = CGAffineTransform(scaleX: 2/3, y: 2/3)
        }
    }
}


extension CarouselViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else { return CollectionViewCell()}
        cell.item = items[indexPath.item]
        return cell
    }
}

extension CarouselViewController: UICollectionViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        
        initalizeTimer(interval: 2)
        
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
}

private extension CarouselViewController {
    
    func setHierarchy() {
        view.backgroundColor = .white
        view.addSubview(carouselView)
        view.addSubview(pageControl)
    }
    
    func setUI() {
        carouselView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        carouselView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        carouselView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        carouselView.heightAnchor.constraint(equalToConstant: Metric.collectionViewHeight).isActive = true
        
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.bottomAnchor.constraint(equalTo: carouselView.bottomAnchor, constant: -20).isActive = true
        pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -60).isActive = true
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
    
    func initalizeTimer(interval: Double) {
        invalidateTimer()
        activateTimer(interval)
    }
    
    func activateTimer(_ interval: Double) {
        carouselTimer = Timer.addCarouselTimerAction(timeInterval: 2) {
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
