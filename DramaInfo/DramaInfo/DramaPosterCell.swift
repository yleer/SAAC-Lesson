//
//  DramaPosterCell.swift
//  DramaInfo
//
//  Created by Yundong Lee on 2021/12/21.
//


import UIKit
import SnapKit
class DramaPosterCell: UICollectionViewCell {
    static let id = "DramaPosterCell"
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("hello")
        addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
