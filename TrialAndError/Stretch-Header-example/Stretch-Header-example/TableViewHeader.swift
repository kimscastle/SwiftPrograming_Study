import UIKit
import Foundation
import Then
import SnapKit
import Kingfisher

class TableViewHeader: UITableViewHeaderFooterView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setLayout()
    }
    
    internal func bindData(imagePath: String) {
        guard let url = URL(string: imagePath) else {return}
        self.imageView.kf.setImage(with: url)
    }
    
    private func setLayout() {
        self.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(300)
        }
    }
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    func setResizeView(_ yValue: CGFloat) {
            self.imageView.snp.remakeConstraints {
                $0.top.equalToSuperview().inset(yValue)
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(300-yValue)
            }
        }
}

