//
//  StretchyHeader.swift
//  StretchyHeader
//
//  Created by Yundong Lee on 2021/12/21.
//


import UIKit
import SnapKit

class StretchyHeaderView: UIView {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "1")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .blue
        
        return imageView
    }()
    
    var imageViewHeight = NSLayoutConstraint()
    var imageViewBottom = NSLayoutConstraint()
    var containerView = UIView()
    var containerViewHieght = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createView()
        setViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createView() {
        addSubview(containerView)
        containerView.addSubview(imageView)
    }
    
    // snp로 바꾸자.
    func setViewConstraints() {

        containerView.snp.makeConstraints { make in
            make.width.equalTo(self.snp.width)
            make.centerX.equalTo(self.snp.centerX)
            make.height.equalTo(self.snp.height)
        }

        imageView.snp.makeConstraints { make in
            make.width.equalTo(containerView.snp.width)
            make.height.equalTo(containerView.snp.height)
            make.bottom.equalTo(containerView.snp.bottom)
        }


//        containerViewHieght = containerView.heightAnchor.constraint(equalTo: self.heightAnchor)
//        imageViewBottom = imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
//        imageViewHeight = imageView.heightAnchor.constraint(equalTo: containerView.heightAnchor)

    }
    public func scrollViewDidScroll(scrollView: UIScrollView) {
//        containerViewHieght.constant = scrollView.contentInset.top
//        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
//        containerView.clipsToBounds = offsetY <= 0
//
//
//        imageViewBottom.constant = offsetY >= 0 ? 0 : -offsetY / 2
//        imageViewHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
        
        imageView.snp.
        
        let heightConstant = scrollView.contentInset.top
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        containerView.clipsToBounds = offsetY <= 0
        
        print(imageView.snp.bottom)
        imageView.snp.makeConstraints { make in
            make.bottom.equalTo(containerView.snp.bottom).offset(offsetY >= 0 ? 0 : -offsetY / 2)
            make.height.equalTo(containerView.snp.height).offset(max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top))
        }
    }
    
}
