//
//  SquareButton.swift
//  Week12Xibs
//
//  Created by Yundong Lee on 2021/12/13.
//
import UIKit

class SquareButton: UIView {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
        loadUI()
    }
    
    func loadView() {
        
        
        // view , view2 같음
//        let view2 = Bundle.main.loadNibNamed("SquareButton", owner: self, options: nil)?.first as! UIView
        let view = UINib(nibName: "SquareButton", bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
        
        view.frame = bounds
        view.layer.cornerRadius = 20
        view.backgroundColor = .green
        
        self.addSubview(view)
    }
    
    func loadUI() {
        label.font = .boldSystemFont(ofSize: 25)
        label.text = "마이페이지"
        imageView.image = UIImage(systemName: "star.fill")
        
    }
    
}
