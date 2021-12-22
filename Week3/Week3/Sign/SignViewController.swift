//
//  SignViewController.swift
//  Week3
//
//  Created by Yundong Lee on 2021/12/22.
//

import UIKit

class SignViewController: BaseViewContoller {
    
    var mainView = SignView()
    var viewModel = SingViewModel()
    
    
    // vc의 루트뷰를 로드할때 호출되는 메서드
    // 새로운 뷰를 빈환하려고 할때 사용됨.
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.bind { text, color in
            self.mainView.passwordTextField.text = text
            self.mainView.passwordTextField.textColor = color
        }
    }
    
    override func configure() {
        title = viewModel.navigationTitle
        mainView.emailTextField.placeholder = "please enter email"
        mainView.emailTextField.text = viewModel.text
        mainView.signButton.addTarget(self, action: #selector(signButtonClicked), for: .touchUpInside)
        
        mainView.signButton.setTitle(viewModel.buttonTitle, for: .normal)
    }
    
    @objc func signButtonClicked() {
        print(#function)
        guard let text = mainView.passwordTextField.text else {return}
        viewModel.text = text
    }
    
    override func setUpConstraints() {
        
    }
    
}
