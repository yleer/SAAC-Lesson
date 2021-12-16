//
//  DetailViewController.swift
//  Week12Xibs
//
//  Created by Yundong Lee on 2021/12/13.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {

    let titleLabel = UILabel()
    let customInfoLabel = UILabel()
    let activationButton = MainActivateButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setTitleConstraints()
        setCusromInfoConstraints()
        setActivationButtonConstraint()
    }
    
    
    func setActivationButtonConstraint() {
        
        view.addSubview(activationButton)
        activationButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activationButton.widthAnchor.constraint(equalToConstant: 300),
            activationButton.heightAnchor.constraint(equalToConstant: 50),
            activationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        
        
        
    }
    
    func setCusromInfoConstraints() {
        customInfoLabel.text = "맞춤 정보를 알려드려요."
        customInfoLabel.backgroundColor = .gray
        customInfoLabel.textAlignment = .center
        
        customInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(customInfoLabel)
        
        NSLayoutConstraint(item: customInfoLabel, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        
        NSLayoutConstraint(item: customInfoLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 40).isActive = true
        
        NSLayoutConstraint(item: customInfoLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -40).isActive = true
        
        NSLayoutConstraint(item: customInfoLabel, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0, constant: 40).isActive = true

        NSLayoutConstraint(item: customInfoLabel, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.7, constant: 0).isActive = true
        
        
    }
    
    func setTitleConstraints() {
        titleLabel.text = "관심 있는 회사\n3개를 선택해주세요."
        titleLabel.backgroundColor = .gray
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        
        NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 40).isActive = true
        
        NSLayoutConstraint(item: titleLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -40).isActive = true
        
        NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.2, constant: 0).isActive = true
        
    }
}
