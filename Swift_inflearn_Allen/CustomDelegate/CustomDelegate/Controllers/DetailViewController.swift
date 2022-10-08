//
//  DetailViewController.swift
//  CustomDelegate
//
//  Created by uiskim on 2022/10/08.
//

import UIKit

final class DetailViewController: UIViewController {
    
    var detailView = DetailView()
    
//    var member: Member?
    
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtonAction()
        setUpData()
    }
    
    //MARK : - 한번더 전달해줘야함
    private func setUpData() {
//        detailView.member = self.member
    }
    
    //MARK : - UIView에있는 버튼은 ViewController에서 지정해줘야한다
    func setUpButtonAction() {
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc func saveButtonTapped() {
        //navigationController?.popViewController(animated: true)
        print("버튼이 눌림")
    }
}
