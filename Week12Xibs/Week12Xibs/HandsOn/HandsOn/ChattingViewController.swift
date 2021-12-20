//
//  ChattingViewController.swift
//  HandsonProject
//
//  Created by Yundong Lee on 2021/11/08.
//

import UIKit
import Alamofire

class ChattingViewController: UIViewController {

    var newsTitle = "제목"
    
    @IBOutlet weak var newsContent: UILabel!
    override func viewDidLayoutSubviews() {
        newsContent.sizeToFit()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = newsTitle
        
//        AF.request(url, method: .get).validate().responseJSON { response in
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
//                print("JSON: \(json)")
//            case .failure(let error):
//                print(error)
//            }
//        }
        

    }
    @IBAction func reportButtonClicked(_ sender: UIBarButtonItem) {
    }
    
    // MARK: only show this button when the owner of the news is seeing.
    @IBAction func barButton(_ sender: UIBarButtonItem) {
    }
}
