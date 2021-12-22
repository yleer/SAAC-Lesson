//
//  BaseViewContoller.swift
//  Week3
//
//  Created by Yundong Lee on 2021/12/22.
//

import UIKit

class BaseViewContoller: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setUpConstraints()
    }
    
    
    func configure() {
        view.backgroundColor = .cyan
    }
    
    func setUpConstraints() {
        
    }
    
}
