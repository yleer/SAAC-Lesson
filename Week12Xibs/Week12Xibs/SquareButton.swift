//
//  SquareButton.swift
//  Week12Xibs
//
//  Created by Yundong Lee on 2021/12/13.
//
import UIKit


// using sb
class SquareButton: TapAnimation {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
        loadUI()
    }
    
    
    // NSCoder - coding decoding의 기본 기능을 가능하게 함.
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


class TapAnimation: UIView {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
        
        DispatchQueue.main.async {
            self.alpha = 1
            UIView.animate(withDuration: 0.4) {
                self.alpha = 0.5
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
        DispatchQueue.main.async {
            self.alpha = 0.5
            UIView.animate(withDuration: 0.4) {
                self.alpha = 1
            }
        }
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
        DispatchQueue.main.async {
            self.alpha = 0.5
            UIView.animate(withDuration: 0.4) {
                self.alpha = 1
            }
        }
    }
}
