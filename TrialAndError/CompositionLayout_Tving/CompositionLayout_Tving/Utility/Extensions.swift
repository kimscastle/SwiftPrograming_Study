//
//  Extensions.swift
//  CompositionalLayout
//
//  Created by uiskim on 2023/05/02.
//

import UIKit

extension Array {
    mutating func makeInfinityCarouselArray() {
        self.insert(self[self.count-1], at: 0)
        self.append(self[1])
    }
}

extension Timer {
    static func addCarouselTimerAction(timeInterval: TimeInterval, _ action: @escaping () -> Void) -> Timer {
        @objc class ClosureSleeve: NSObject {
            let closure: () -> ()
            
            init(_ closure: @escaping () -> ()) {
                self.closure = closure
            }
            
            @objc func action() {
                closure()
            }
        }
        let sleeve = ClosureSleeve(action)
        let timer = Timer.scheduledTimer(timeInterval: timeInterval, target: sleeve, selector: #selector(ClosureSleeve.action), userInfo: nil, repeats: true)
        objc_setAssociatedObject(self, "\(UUID())", sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        
        return timer
    }
}

extension UICollectionView {
    func scroll(to item: Int, animation: Bool = false) {
        self.scrollToItem(at: IndexPath(item: item, section: 0), at: .centeredHorizontally, animated: animation)
    }
}

extension UICollectionViewLayout {
    static var makeCaruselFlowLayout: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: Metric.cellWidth, height: 594)
        layout.minimumLineSpacing = 0
        return layout
    }
}

extension UIControl {
    func addButtonAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping (_ sender: UIButton) -> ()) {
        @objc class ClosureSleeve: NSObject {
            let closure: (UIButton) -> ()
            
            init(_ closure: @escaping (UIButton) -> ()) {
                self.closure = closure
            }
            
            @objc func invoke(_ sender: UIButton) {
                closure(sender)
            }
        }
        
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke(_:)), for: controlEvents)
        objc_setAssociatedObject(self, "\(UUID())", sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}

extension UIScrollView {
    func move(to: Double, animation: Bool = false) {
        self.setContentOffset(.init(x: to, y: self.contentOffset.y), animated: animation)
    }
}

extension String {
    func calcuateWidth(addPadding: CGFloat) -> CGFloat {
        let label = UILabel()
        label.text = self
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.sizeToFit()
        return label.frame.width + addPadding
    }
}
