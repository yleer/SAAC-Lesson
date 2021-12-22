//
//  SignViewModel.swift
//  Week3
//
//  Created by Yundong Lee on 2021/12/22.
//

import Foundation
import UIKit

class SingViewModel {
    var navigationTitle = "nav title"
    var buttonTitle = "button title"
    
    func didTapButton(completion: @escaping () -> Void){
        completion()
    }
    
    var text: String = ""{
        didSet{
            
            let count = text.count
            let value = count >= 100 ? "작성할 수 없습니다." : "\(count)/100"
            let color = count >= 100 ? UIColor.red : UIColor.black
            
            listener?(value, color)
        }
    }
    
    var listener: ((String, UIColor) -> Void)?
    
    func bind(listener: @escaping (String, UIColor) -> Void) {
        self.listener = listener
    }
}


