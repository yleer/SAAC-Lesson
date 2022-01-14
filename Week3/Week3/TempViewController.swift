//
//  TempViewController.swift
//  Week3
//
//  Created by Yundong Lee on 2021/12/24.
//

import UIKit

// shift + control + 클릭
// option + command + [ or ]
// 자동완성 칸 크기 설정 가능
// control + cmd + up -- 인터페이스 확인 가능
// control + i - 정리

class TempViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
    
    class User{
        
        internal init(name: String, age: Int) {
            self.name = name
            self.age = age
        }
        
        var name: String
        var age: Int
        
    }
}
