//
//  MovieCell.swift
//  TableView
//
//  Created by uiskim on 2022/10/06.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func congifure(_ movie: Movie) {
        mainImageView.image = movie.movieImage
        movieNameLabel.text = movie.movieName
        descriptionLabel.text = movie.movieDescription
    }

}
