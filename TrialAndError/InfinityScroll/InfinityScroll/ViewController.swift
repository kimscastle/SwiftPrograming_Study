//
//  ViewController.swift
//  InfinityScroll
//
//  Created by uiskim on 2023/09/26.
//

import UIKit

import SnapKit

protocol MovieService {
    func getMovieData(page: Int) async throws -> [MovieAppData]
}

final class ViewController: UIViewController {
    
    private let manager: MovieService
    
    private var movieData: [MovieAppData] = []
    private var page = 1
    private var isFethcing = false
    
    private let movieTableView = UITableView()
    
    init(manager: MovieService) {
        self.manager = manager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "MovieTableViewCell")
        movieTableView.dataSource = self
        movieTableView.delegate = self
        
        view.addSubview(movieTableView)
        movieTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getMovieData(page: page)
    }
    
    func getMovieData(page: Int) {
        Task {
            do {
                isFethcing = true
                try await Task.sleep(nanoseconds: 1_000_000_000)
                let data = try await manager.getMovieData(page: 1)
                movieData.append(contentsOf: data)
                print("\(page)완료")
                movieTableView.reloadData()
                isFethcing = false
            } catch {
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell else { return MovieTableViewCell() }
        cell.data = movieData[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if movieTableView.contentOffset.y > (movieTableView.contentSize.height - movieTableView.bounds.size.height) {
            if !isFethcing {
                print("✨✨✨✨개선버전2✨✨✨✨✨")
                print("✅✅✅✅✅✅✅✅✅맨 아래에 도달✅✅✅✅✅✅✅✅✅")
                page += 1
                print("✅✅✅✅✅✅✅✅✅\(page)✅✅✅✅✅✅✅✅✅✅")
                getMovieData(page: page)
            }
        }
    }
}
