//
//  DetailViewController.swift
//  CustomDelegate
//
//  Created by uiskim on 2022/10/08.
//

import UIKit
//MARK : - PhotoImagePicker 구현
import PhotosUI

final class DetailViewController: UIViewController {
    
    var detailView = DetailView()
    
    //MARK : - MemberDelegate를 채택한 녀석(ViewController)가 대리자가 될수있다 라고 선언
    weak var delegate: MemberDelegate?
    
//    var member: Member?
    
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        setUpData()
        setUpButtonAction()
        setUpGestures()
    }
    
    //MARK : - 한번더 전달해줘야함
//    private func setUpData() {
//        detailView.member = self.member
//    }
    
    //MARK : - UIView에있는 버튼은 ViewController에서 지정해줘야한다
    func setUpButtonAction() {
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    func setUpGestures() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(touchImageView))
        detailView.mainImageView.addGestureRecognizer(gesture)
        
        // defalt가 false이므로 true로 바꿔줘야함
        detailView.mainImageView.isUserInteractionEnabled = true
    }
    
    @objc func touchImageView() {
        print("이미지뷰 터치")
        setupImagePicker()
    }
    
    /// 이미지 Picker 기본설정 함수
    func setupImagePicker() {
        var configuration = PHPickerConfiguration()
        //무한대로 이미지를 가지올 수 있다는 뜻
        configuration.selectionLimit = 0
        configuration.filter = .any(of: [.images, .videos])
        // 기본설정을 가지고, 피커뷰컨트롤러 생성
        let picker = PHPickerViewController(configuration: configuration)
        // 피커뷰 컨트롤러의 대리자 설정
        picker.delegate = self
        // 피커뷰 띄우기
        self.present(picker, animated: true, completion: nil)
    }
    
    @objc func saveButtonTapped() {
        print("버튼이 눌림")
        
        if detailView.member == nil {
            
            // 입력이 안되어 있다면.. (일반적으로) 빈문자열로 저장
            let name = detailView.nameTextField.text ?? ""
            let age = Int(detailView.ageTextField.text ?? "")
            let phoneNumber = detailView.phoneNumberTextField.text ?? ""
            let address = detailView.addressTextField.text ?? ""
            
            // 새로운 멤버 (구조체) 생성
            var newMember =
            Member(name: name, age: age, phone: phoneNumber, address: address)
            newMember.memberImage = detailView.mainImageView.image
            
            // 1) 델리게이트 방식이 아닌 구현⭐️
//            let index = navigationController!.viewControllers.count - 2
            // 전 화면에 접근하기 위함
//            let vc = navigationController?.viewControllers[index] as! ViewController
            // 전 화면의 모델에 접근해서 멤버를 추가
//            vc.memberListManager.makeNewMember(newMember)
            
            // 2) 델리게이트 방식으로 구현⭐️
            delegate?.addNewMember(newMember)
            
        } else {
            guard var member = detailView.member else { return }
            //MARK : - 1.유저데이터가 업데이트 되어야함 2.이전뷰로 넘어가야함
            member.memberImage = detailView.mainImageView.image
            let memberId = Int(detailView.memberIdTextField.text!) ?? 0
            member.name = detailView.nameTextField.text
            member.phone = detailView.phoneNumberTextField.text
            member.address = detailView.addressTextField.text
                
            //MARK : - 현재 viewcontroller의 갯수는 2개
    //        let index = navigationController!.viewControllers.count - 2
    //        let beforeVC = navigationController?.viewControllers[index] as! ViewController
    //        beforeVC.memberListManager.updateMemberInfo(index: memberId, member)
    //        navigationController?.popViewController(animated: true)
            
            //MARK : - 어떤 함수인지는 모르겟는데 대리자가 설정한 내용으로 실행해줘 라는 뜻
            delegate?.update(index: memberId, member)
        }
        navigationController?.popViewController(animated: true)
    }
}

//MARK : - DetailViewController를 거치지 않고 바로 DetailView의 member로 접근하는방법
//    @objc func saveButtonTapped() {
//        //navigationController?.popViewController(animated: true)
//        print("버튼이 눌림")
//
//        guard var member = detailView.member else {return}
//
//        //MARK : - 1.유저데이터가 업데이트 되어야함 2.이전뷰로 넘어가야함
//        member.memberImage = detailView.mainImageView.image
//        let memberId = Int(detailView.memberIdTextField.text!) ?? 0
//        member.name = detailView.nameTextField.text
//        member.phone = detailView.phoneNumberTextField.text
//        member.address = detailView.addressTextField.text
//
//        //MARK : - 현재 viewcontroller의 갯수는 2개
//        let index = navigationController!.viewControllers.count - 2
//        let beforeVC = navigationController?.viewControllers[index] as! ViewController
//
//        beforeVC.memberListManager.updateMemberInfo(index: memberId, member)
//
//        navigationController?.popViewController(animated: true)
//    }


//MARK : - 사진첩에 접근해서 사진을 고를수있는 delegate protocol채택
extension DetailViewController: PHPickerViewControllerDelegate {
    
    /// 사진이 선택된 후 호출되는 메서드
    /// - Parameters:
    ///   - picker: 내 폰의 사진을 볼수있는 ViewController
    ///   - results: 선택된 사진들
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        // 피커뷰 dismiss
        picker.dismiss(animated: true)
        
        let itemProvider = results.first?.itemProvider
        
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { [weak self] (image, error) in
                DispatchQueue.main.async {
                    // 이미지뷰에 표시
                    //MARK : - 사용할때마다 변경✅
                    self?.detailView.mainImageView.image = image as? UIImage
                }
            }
        } else {
            print("이미지 못 불러왔음!!!!")
        }
    }
}
