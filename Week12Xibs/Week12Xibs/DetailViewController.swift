//
//  DetailViewController.swift
//  Week12Xibs
//
//  Created by Yundong Lee on 2021/12/13.
//

import UIKit

class DetailViewController: UIViewController {

    let bannerView = BannerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        bannerView.frame = CGRect(x: 30, y: 100, width: 100, height: 200)
        view.addSubview(bannerView)
    }
}



// requrid init, override init
