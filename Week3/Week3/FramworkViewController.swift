//
//  FramworkViewController.swift
//  Week3
//
//  Created by Yundong Lee on 2021/12/23.
//


import UIKit
import SeSSACFramework

class FramworkViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let sesac = SesSACOpen()
        sesac.presentWebViewController(url: "https://naver.com", transitionStyle: .push, vc: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let open = SesSACOpen()
//        open.openName
        let pub = SeSACPublic()
        pub.publicName = "Sasd"
        
    }
}
