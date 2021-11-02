//
//  UILabel + extension.swift
//  SaacWeek5
//
//  Created by Yundong Lee on 2021/10/29.
//

import Foundation
import UIKit

extension UILabel{
    func setBorderStyle(){
        self.backgroundColor = .blue
        self.clipsToBounds = true
        self.layer.borderWidth = 3
    }
}
