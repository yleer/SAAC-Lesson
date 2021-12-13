//
//  BannerView.swift
//  Week12Xibs
//
//  Created by Yundong Lee on 2021/12/13.
//

import UIKit

class BannerView: UIView {
    
    
    let mainLabel = UILabel()
    let descriptionLabel = UILabel()
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadLayout()
    }
    
    // 실패 가능한 이니셜라이져.
    // NSCoder - xib, nib (스토리보드) 관련됨. 코드로 ui 작성시 관련 없음
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadLayout() {
        mainLabel.font = .boldSystemFont(ofSize: 15)
        mainLabel.textColor = .green
        mainLabel.text = "내일 주식이 오를까요?"
        
        descriptionLabel.font = .systemFont(ofSize: 15)
        descriptionLabel.textColor = .green
        descriptionLabel.text = "맞으면 500원"
        
        mainLabel.frame = CGRect(x: 30, y: 30, width: UIScreen.main.bounds.width - 130, height: 40)
        descriptionLabel.frame = CGRect(x: 30, y: 80, width: UIScreen.main.bounds.width - 130, height: 30)
        
        self.addSubview(mainLabel)
        self.addSubview(descriptionLabel)
        
    }
}
