//
//  ViewController.swift
//  TableView
//
//  Created by uiskim on 2022/10/06.
//

import UIKit

class ViewController: UIViewController {
    
    //var movies: [Movie] = []
    
    var movieDataManager = DataManager()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 120
        // Do any additional setup after loading the view.
        
        //MARK : - 데이터를 받아옴
        movieDataManager.makeMovieData()
        //movies = movieDataManager.getMovieData()
        
        //MARK : - storyboard면 register과정이 필요없지만 codebase라면 register과정이 ✅필수적✅이다
        //tableView.register(<#T##nib: UINib?##UINib?#>, forCellReuseIdentifier: <#T##String#>)
    }
}

//MARK : - tableView를 사용할때는 무조건 tableViewDataSource 프로토콜을 채택해야한다
// DataSource도 delegate pattern이다(이름만 다름)
// 테이블 뷰의 구성을 설정할 수 있음(몇개의 cell로 만들건지, cell의 구성은 어떻게할건지)
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return movies.count
        return movieDataManager.getMovieData().count
    }
    
    // 몇번째 행의 cell은 어떻게 나타낼거야?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //MARK : - cell자체가 일반적인(범용적인 타입)타입이기때문에 cell에는 아직 mainImageView가 없다 -> 다운캐스팅 해줘야함
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviewCell", for: indexPath) as! MovieCell
        //cell.mainImageView.image = movies[indexPath.row].movieImage
        //cell.movieNameLabel.text = movies[indexPath.row].movieName
        //cell.descriptionLabel.text = movies[indexPath.row].movieDescription
        let movies = movieDataManager.getMovieData()
        cell.congifure(movies[indexPath.row])
        // cell을 눌러도 아무 반응이 없게 만들어주는 메서드
        cell.selectionStyle = .none
        
        return cell
    }
}

