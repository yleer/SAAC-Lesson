//
//  AsyncViewController.swift
//  SaacWeek5
//
//  Created by Yundong Lee on 2021/10/29.
//

import UIKit

class AsyncViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let calender = Calendar.current
        let tomorrow = calender.date(byAdding: .day, value: 1, to: Date())
        
    }
    
    let url = "https://images.pexels.com/photos/2246476/pexels-photo-2246476.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260"
    
    @IBAction func requestButtonClicked(_ sender: UIButton) {
        
        DispatchQueue.global().async {
            if let url = URL(string: self.url), let data = try? Data(contentsOf: url), let image = UIImage(data: data){
                
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
                
                
                
            }
        }
        
        
        
        
    }
    


}
