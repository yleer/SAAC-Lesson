//
//  SecondViewController.swift
//  Week7
//
//  Created by Yundong Lee on 2021/11/10.
//

import UIKit

class SecondViewController: UIViewController {
    
    var textSpace = ""

    @IBOutlet weak var textView: UITextView!
    
    var buttonActionHandler: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.text = textSpace
    }
    
    
    @IBAction func notiButtonClicked(_ sender: UIButton) {
        NotificationCenter.default.post(
            name: NSNotification.Name(rawValue: "firstNotification"),
            object: nil,
            userInfo: ["myText" : textView.text!]
        )
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        NotificationCenter.default.post(
            name: NSNotification.Name(rawValue: "firstNotification"),
            object: nil,
            userInfo: ["myText" : textView.text!]
        )
        buttonActionHandler?()

        guard let presentVc = self.presentingViewController else { return }
        
        
        self.dismiss(animated: true) {
            
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "PopUpViewController") as? PopUpViewController else { return }
            
            presentVc.present(vc, animated: true, completion: nil)
            print("화면 이동")
        }
    }
    
}
