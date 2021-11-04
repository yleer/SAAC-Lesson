//
//  DetailViewController.swift
//  Week6
//
//  Created by Yundong Lee on 2021/11/04.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var diaryImage: UIImageView!
    
    var tmpTitle: String?
    var tmpDate: String?
    var tmpContet: String?
    var tmpDiary: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = tmpTitle
        dateLabel.text = tmpDate
        contentLabel.text = tmpContet
        diaryImage.image = tmpDiary

    }
    



}
