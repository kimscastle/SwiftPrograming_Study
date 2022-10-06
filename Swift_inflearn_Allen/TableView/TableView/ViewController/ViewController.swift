//
//  ViewController.swift
//  TableView
//
//  Created by uiskim on 2022/10/06.
//

import UIKit

class ViewController: UIViewController {
    
    var movies: [Movie] = [
        Movie(movieImage: UIImage(named: "batman.png"), movieName: "배트맨", movieDescription: "배트맨이 출현하는 영화"),
        Movie(movieImage: UIImage(named: "captain.png"), movieName: "캡틴 아메리카", movieDescription: "캡틴 아메리카의 기원. 캡틴 아메리카는 어떻게 탄생하게 되었을까?"),
        Movie(movieImage: UIImage(named: "ironman.png"), movieName: "아이언맨", movieDescription: "토니 스타크가 출현, 아이언맨이 탄생하게된 계기가 재미있는 영화"),
        Movie(movieImage: UIImage(named: "thor.png"), movieName: "토르", movieDescription: "아스가르드의 후계자 토르가 지구에 오게되는 스토리"),
        Movie(movieImage: UIImage(named: "hulk.png"), movieName: "헐크", movieDescription: "브루스 배너 박사의 실험을 통해 헐크가 탄생하게 되는 영화"),
        Movie(movieImage: UIImage(named: "spiderman.png"), movieName: "스파이더맨", movieDescription: "피터 파커 학생에서 스파이더맨이 되는 과정을 담은 스토리"),
        Movie(movieImage: UIImage(named: "blackpanther.png"), movieName: "블랙펜서", movieDescription: "와칸다의 왕위 계승자 티찰과 블랙펜서가 되다."),
        Movie(movieImage: UIImage(named: "doctorstrange.png"), movieName: "닥터스트레인지", movieDescription: "외과의사 닥터 스트레인지가, 히어로가 되는 과정을 담은 영화"),
        Movie(movieImage: UIImage(named: "guardians.png"), movieName: "가디언즈 오브 갤럭시", movieDescription: "빌런 타노스에 맞서서 세상을 지키려는 가오겔 멤버들")
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 120
        // Do any additional setup after loading the view.
    }


}

//MARK : - tableView를 사용할때는 무조건 tableViewDataSource 프로토콜을 채택해야한다
// DataSource도 delegate pattern이다(이름만 다름)
// 테이블 뷰의 구성을 설정할 수 있음(몇개의 cell로 만들건지, cell의 구성은 어떻게할건지)
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    // 몇번째 행의 cell은 어떻게 나타낼거야?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //MARK : - cell자체가 일반적인(범용적인 타입)타입이기때문에 cell에는 아직 mainImageView가 없다 -> 다운캐스팅 해줘야함
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviewCell", for: indexPath) as! MovieCell
        //cell.mainImageView.image = movies[indexPath.row].movieImage
        //cell.movieNameLabel.text = movies[indexPath.row].movieName
        //cell.descriptionLabel.text = movies[indexPath.row].movieDescription
        cell.congifure(movies[indexPath.row])
        
        return cell
    }
}

