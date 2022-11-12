//
//  ViewController.swift
//  combine_textfield_tutorial
//
//  Created by Jeff Jeong on 2020/10/13.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var passwordConfirmTextField: UITextField!
    @IBOutlet var myBtn: UIButton!
    
    var viewModel : MyViewModel!
    
    private var mySubscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel = MyViewModel()
        
        
    }


}
