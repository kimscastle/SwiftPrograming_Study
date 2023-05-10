//
//  CoursesViewController.swift
//  CustomViewKit
//
//  Created by uiskim on 2023/05/10.
//

import UIKit

public protocol DataFetchable {
    /// 데이터를 넘겨받기만 해야하는거 아닐까...? 왜냐면 애초에 APICaller라는 모듈은 독립적이어야하는데 쟤가 Course를 알고있으면 안되는거아닌가...?
    /// 그러면 여기서 받은 데이터를 가지고 Decode해주는 방식이 맞는건가...?
    /// 근데 ViewController에서 Decode를 해주는 방식 조금 어색한거같은데...?
    func fetchCourseNames(completion: @escaping(Data) -> Void)
}

struct Course: Codable {
    let name: String
}

public class CoursesViewController: UIViewController {
    
    let dataFetchable: DataFetchable
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    public init(dataFetchable: DataFetchable) {
        self.dataFetchable = dataFetchable
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var courses: [Course] = []
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .systemBackground
        dataFetchable.fetchCourseNames { [weak self] data in
            guard let model = try? JSONDecoder().decode([Course].self, from: data) else { fatalError("decode오류") }
            self?.courses = model
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension CoursesViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = courses[indexPath.row].name
        return cell
    }
}
