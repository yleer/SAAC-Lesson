//
//  UITableviewCell + extension.swift
//  Week3
//
//  Created by Yundong Lee on 2021/12/21.
//

import UIKit


protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension UITableViewCell: ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
