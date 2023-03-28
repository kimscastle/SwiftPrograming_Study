//
//  SymbolRollerViewController.swift
//  Part1_SymbolRoller
//
//  Created by uiskim on 2023/03/28.
//

import UIKit

class SymbolRollerViewController: UIViewController {
    
    let symbols = ["sun.min", "moon", "cloud", "wind", "snowflake"]
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reload()
    }
    
    private func reload() {
        let symbol = symbols.randomElement()!
        imageView.image = UIImage(systemName: symbol)
        label.text = symbol
    }
    

    @IBAction func buttonTapped(_ sender: UIButton) {
        reload()
    }
}
