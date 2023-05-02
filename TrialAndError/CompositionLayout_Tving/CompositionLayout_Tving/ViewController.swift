//
//  ViewController.swift
//  ScrollableSegmentMenu
//
//  Created by uiskim on 2023/04/30.
//

import UIKit

import SnapKit

@frozen
enum PageType: String, CaseIterable {
    case home = "홈"
    case realTime = "ㅁ실시간"
    case tvProgram = "TV프로그램"
    case movie = "영화"
    case prarmount = "파라마운트+"
    case kid = "키즈"
    
    var viewController: UIViewController {
        switch self {
        case .home:
            return TotalViewController()
        case .realTime:
            return RealTimeViewController()
        case .tvProgram:
            return TvProgramViewController()
        case .movie:
            return MovieViewController()
        case .prarmount:
            return ParamountViewController()
        case .kid:
            return KidViewController()
        }
    }
}

class ViewController: UIViewController {
    private var currentPage: Int = 0 {
        didSet {
            changeViewController(before: oldValue, after: currentPage)
        }
    }
    
    private lazy var pageViewController: UIPageViewController = {
        let viewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        return viewController
    }()
    
    private var dataSourceViewController: [UIViewController] = []
    
    private var menu = CustomMenuBar()

    let button1: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "flame"), for: .normal)
        return button
    }()
    
    let button2: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "flame"), for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
        setPageViewController()
        tvingNavigationBar(.white, left: [UIImageView(image: UIImage(named: "TvingLogo"))], right: [button1,button2], spacing: 10)
        
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        currentPage = 0
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

private extension ViewController {
    func setUI() {
        view.backgroundColor = .black
    }
    
    func setHierarchy() {
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        view.addSubview(menu)
    }
    
    func setLayout() {
        pageViewController.view.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(-90)
            make.leading.trailing.bottom.equalToSuperview()
        }
        pageViewController.didMove(toParent: self)
        menu.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(15)
            make.height.equalTo(60)
        }
    }
    
    func setDelegate() {
        pageViewController.dataSource = self
        pageViewController.delegate = self
        menu.delegate = self
    }
    
    func setPageViewController() {
        dataSourceViewController = PageType.allCases.map{$0.viewController}
        print(dataSourceViewController)
    }
    
    func changeViewController(before beforeIndex: Int, after newIndex: Int) {
        let direction: UIPageViewController.NavigationDirection = beforeIndex < newIndex ? .forward : .reverse
        pageViewController.setViewControllers([dataSourceViewController[currentPage]], direction: direction, animated: true, completion: nil)
        menu.isSelected = newIndex
    }
}

extension ViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = dataSourceViewController.firstIndex(of: viewController) else { return nil }
        let nextIndex = currentIndex + 1
        guard nextIndex != dataSourceViewController.count else { return nil }
        return dataSourceViewController[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = dataSourceViewController.firstIndex(of: viewController) else { return nil }
        let previousIndex = currentIndex - 1
        guard previousIndex >= 0 else { return nil }
        return dataSourceViewController[previousIndex]
    }
}

extension ViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let currentVC = pageViewController.viewControllers?.first,
              let currentIndex = dataSourceViewController.firstIndex(of: currentVC) else { return }
        currentPage = currentIndex
    }
}

extension ViewController: MenuItemDelegate {
    func menuView(didSelectItemAt indexPath: IndexPath) {
        currentPage = indexPath.row
    }
}


extension UIViewController {
    func tvingNavigationBar(_ tintColor: UIColor?, left leftItems: [some UIView], right rightItems: [some UIView], spacing: CGFloat) {
        typealias MakeStackViewClosure<T: UIView> = ([T], CGFloat) -> UIStackView
        let makeStackView: MakeStackViewClosure = { views, spacing in
            return {
                let stackView = UIStackView(arrangedSubviews: views)
                stackView.distribution = .equalSpacing
                stackView.axis = .horizontal
                stackView.alignment = .center
                stackView.spacing = spacing
                return stackView
            }()
        }
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.navigationController?.navigationBar.tintColor = tintColor
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: makeStackView(rightItems, spacing))
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: makeStackView(leftItems, spacing))
        
    }
}
