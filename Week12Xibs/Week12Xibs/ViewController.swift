//
//  ViewController.swift
//  Week12Xibs
//
//  Created by Yundong Lee on 2021/12/13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstButtonView: SquareButton!
    @IBOutlet weak var secondButtonView: SquareButton!
    @IBOutlet weak var thirdButtonView: SquareButton!
    
    let redView: UIView = UIView()
    let greenView: UIView = UIView()
    let blueView: UIView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstButtonView.label.text = "first"
        secondButtonView.label.text = "second"
        thirdButtonView.label.text = "third"
        
        view.addSubview(redView)
        view.addSubview(greenView)
        view.addSubview(blueView)
        
        redView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        greenView.frame = CGRect(x: 200, y: 100, width: 100, height: 100)
        blueView.frame = CGRect(x: 300, y: 100, width: 100, height: 100)
        
        redView.backgroundColor = .red
        greenView.backgroundColor = .green
        blueView.backgroundColor = .blue
        
        
        
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        
        present(DetailViewController(), animated: true, completion: nil)
        
    }
    
}

