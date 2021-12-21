//
//  UITableViewCellRepresentable.swift
//  Week3
//
//  Created by Yundong Lee on 2021/12/21.
//

import Foundation
import UIKit

protocol TableViewCellRepresentable{
    var numberOfSection: Int {get}
    var numberOfRowsInSection: Int {get}
    var heightOfRowAt: CGFloat {get}
    func cellForRowAt(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    
}
