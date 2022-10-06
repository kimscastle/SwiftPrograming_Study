//
//  DetailViewController.swift
//  TableView
//
//  Created by uiskim on 2022/10/06.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var movieNameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var movieData: Movie?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()

    }
    
    func setUI() {
        mainImageView.image = movieData?.movieImage
        movieNameLabel.text = movieData?.movieName
        descriptionLabel.text = movieData?.movieDescription
    }

}
