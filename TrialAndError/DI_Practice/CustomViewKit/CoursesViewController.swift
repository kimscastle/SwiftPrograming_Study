//
//  CoursesViewController.swift
//  CustomViewKit
//
//  Created by uiskim on 2023/05/10.
//

import UIKit

public protocol DataFetchable {
    func fetchCoures<T: Codable>(returnType: T.Type, completion: @escaping(T) -> Void)
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

        dataFetchable.fetchCoures(returnType: [Course].self) { models in
            self.courses = models
            DispatchQueue.main.async {
                self.tableView.reloadData()
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
