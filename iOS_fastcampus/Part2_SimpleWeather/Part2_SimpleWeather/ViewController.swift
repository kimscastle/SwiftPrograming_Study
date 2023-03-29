//
//  ViewController.swift
//  Part2_SimpleWeather
//
//  Created by uiskim on 2023/03/28.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var changeButton: UIButton!
    
    let citys = ["Seoul", "Tokyo", "LA", "Seattle"]
    let weathers = ["cloud.fill", "sun.max.fill", "wind", "cloud.sun.rain.fill"]
    let temperatures = ["23°", "32°", "-5°"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
