//
//  SnapDetailViewController.swift
//  Week12Xibs
//
//  Created by Yundong Lee on 2021/12/14.
//

import UIKit
import SnapKit

class SnapDetailViewController: UIViewController {
    
    var activationButton: MainActivateButton = {
       let button = MainActivateButton()
        button.setTitle("asdf", for: .normal)
        
        button.addTarget(self, action: #selector(activationButtonClicked), for: .touchUpInside)
        
        return button
    }()
    
    var box1: SquareButton = {
        let view = SquareButton()
        view.label.text = "toss"
        view.imageView.image = UIImage(systemName: "star")
        return view
    }()
    var box2: SquareButton = {
        let view = SquareButton()
        view.label.text = "biss"
        view.imageView.image = UIImage(systemName: "pencil")
        return view
    }()
    var box3: SquareButton = {
        let view = SquareButton()
        view.label.text = "apd"
        view.imageView.image = UIImage(systemName: "ball")
        return view
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 12
        stack.alignment = .fill
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    // 익명 함수
    let moneyLabel: UILabel = {
       
        let label = UILabel()
        label.backgroundColor = .yellow
        label.text = "10000원"
   
        return label
    }()
    let descripitonLabel = UILabel()
    
    let redView = UIView()
    let blueView = UIView()
        
    @objc func activationButtonClicked() {
        // xib 로 만들어진 vc
        let vc = SettingViewController(nibName: "SettingViewController", bundle: nil)
        
//        let vc = DetailViewController() // 코드로만 만들어진 vc : nib 없음 (xib 아니라)
        vc.name = "yleer"
        navigationController?.pushViewController(vc, animated: true)
//        present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Stack view
        view.addSubview(stackView)
        stackView.addArrangedSubview(box1)
        stackView.addArrangedSubview(box2)
        stackView.addArrangedSubview(box3)
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalTo(view)
            make.width.equalTo(view.snp.width).multipliedBy(0.9)
            make.height.equalTo(80)
            
        }
        
        
        box1.alpha = 0
        box2.alpha = 0
        box3.alpha = 0
        
        
        UIView.animate(withDuration: 1) {
            self.box1.alpha = 1
            self.box2.alpha = 1
            self.box3.alpha = 1
        }
        
        view.backgroundColor = .white
        
        [activationButton, moneyLabel, descripitonLabel, redView].forEach {
            view.addSubview($0)
        }
        
    
        moneyLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
            make.width.equalTo(300)
            make.height.equalTo(100)
            
        }
        
        
        activationButton.backgroundColor = .lightGray
        activationButton.snp.makeConstraints {
            $0.leadingMargin.equalTo(view)
            $0.trailingMargin.equalTo(view)
            $0.bottom.equalTo(view)
            $0.height.equalTo(view).multipliedBy(0.1)
        }
        
        
        redView.backgroundColor = .red
        redView.snp.makeConstraints { make in
//            make.top.equalTo(view)
//            make.bottom.equalTo(view)
//            make.leading.equalTo(view)
//            make.trailing.equalTo(view)
            
//            make.edges.equalTo(view)
            make.edges.equalToSuperview().inset(100)
            
        }
        redView.snp.updateConstraints { make in
            make.bottom.equalTo(-500)
        }
        
        
        
        redView.addSubview(blueView)
        blueView.backgroundColor = .blue
        blueView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(50)
        }
    }
    
    
    
    
}
