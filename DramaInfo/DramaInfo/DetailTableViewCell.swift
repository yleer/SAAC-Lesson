//
//  DetailTableViewCell.swift
//  DramaInfo
//
//  Created by Yundong Lee on 2021/12/21.
//

import UIKit
import SnapKit

class DetailTableViewCell: UITableViewCell {
    static let id = "DetailTableViewCell"
    
    let imageViewz = UIImageView()
    let title = UILabel()
    let date = UILabel()
    let content = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    func setConstraints() {
        
        self.addSubview(imageViewz)
        self.addSubview(title)
        self.addSubview(date)
        self.addSubview(content)
        
        content.numberOfLines = 0
        
        imageViewz.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading)
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.width.equalTo(70)
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(imageViewz.snp.trailing)
        }
        
        date.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom)
            make.leading.equalTo(imageViewz.snp.trailing)
        }
        
        content.snp.makeConstraints { make in
            make.top.equalTo(date.snp.bottom)
            make.leading.equalTo(imageViewz.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


