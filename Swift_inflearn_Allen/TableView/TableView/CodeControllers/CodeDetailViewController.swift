//
//  CodeDetailViewController.swift
//  TableView
//
//  Created by uiskim on 2022/10/07.
//

import UIKit

class CodeDetailViewController: UIViewController {
    
    var data: Movie?
    
    var stackView = DetailView()
    
    override func loadView() {
        view = stackView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setData()
    }

    func setData() {
        stackView.movieImage.image = data?.movieImage
        stackView.movieNameLabel.text = data?.movieName
        stackView.descriptionLabel.text = data?.movieDescription
    }

}
