//
//  ViewController.swift
//  Week7
//
//  Created by Yundong Lee on 2021/11/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(firstNotification(notification:)), name: NSNotification.Name(rawValue: "firstNotification"), object: nil)
    }
    
    @objc func firstNotification(notification: NSNotification) {
        print("not")
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        guard let vc =  self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as?  SecondViewController else { return }
        
        vc.buttonActionHandler = {
            self.textView.text = vc.textView.text
        }
        vc.textSpace = textView.text
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func notificationButtonClicked(_ sender: UIButton) {
        NotificationCenter.default.post(
            name: NSNotification.Name(rawValue: "firstNotification"),
            object: nil,
            userInfo: ["myText" : textView.text!]
        )
        
        guard let vc =  self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as?  SecondViewController else { return }
        self.present(vc, animated: true, completion: nil)
        
        
    }
}



extension NSNotification.Name {
    static let myNotification = "myNotification"
}
