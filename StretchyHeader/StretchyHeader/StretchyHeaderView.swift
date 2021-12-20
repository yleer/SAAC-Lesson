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
        imageView.backgroundColor = .green
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
        containerView.backgroundColor = .gray
        self.backgroundColor = .green
        imageView.backgroundColor = .black
        imageView.image = UIImage(named: "1")
    }
    
    // snp로 바꾸자.
    func setViewConstraints() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: containerView.widthAnchor),
            centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            heightAnchor.constraint(equalTo: containerView.heightAnchor)
            
            ])
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        containerViewHieght = containerView.heightAnchor.constraint(equalTo: self.heightAnchor)
        containerViewHieght.isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageViewBottom = imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        imageViewBottom.isActive = true
        imageViewHeight = imageView.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        imageViewHeight.isActive = true
    }
    
    // snp로 바꾸자.
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        containerViewHieght.constant = scrollView.contentInset.top
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        containerView.clipsToBounds = offsetY <= 0
        
        imageViewBottom.constant = offsetY >= 0 ? 0 : -offsetY / 2
        imageViewHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
        
        
    }
    
}
