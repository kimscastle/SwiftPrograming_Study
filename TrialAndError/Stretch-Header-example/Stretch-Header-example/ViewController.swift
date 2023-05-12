import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        self.setTableViewConfig()
    }
    
    private func setLayout() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setTableViewConfig() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let headerView = TableViewHeader()
        headerView.bindData(imagePath: "https://www.hackingwithswift.com/uploads/swift-evolution-7.jpg")
        
        self.tableView.tableHeaderView = headerView
        self.tableView.register(CustomTVC.self,
                                forCellReuseIdentifier: CustomTVC.identifier)
        self.tableView.tableHeaderView?.frame = .init(origin: .zero,
                                                      size: .init(width: UIScreen.main.bounds.width,
                                                                  height: 300))
    }

    private let tableView = UITableView(frame: .zero, style: .plain).then {
        $0.contentInsetAdjustmentBehavior = .never
    }

}
extension ViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            if let headerView = self.tableView.tableHeaderView as? TableViewHeader {
                headerView.setResizeView(scrollView.contentOffset.y)
            }
        }
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTVC.identifier) as? CustomTVC else {return UITableViewCell()}
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

