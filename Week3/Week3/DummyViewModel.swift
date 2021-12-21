//
//  DummyData.swift
//  Week3
//
//  Created by Yundong Lee on 2021/12/21.
//

import UIKit

class DummyViewModel {
    var data = Array(repeating: "안녕", count: 100)
}


extension DummyViewModel: TableViewCellRepresentable {
    var numberOfSection: Int {
        1
    }
    
    var heightOfRowAt: CGFloat {
        50
    }
    
    func cellForRowAt(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseIdentifier, for: indexPath)
        
        cell.textLabel?.text = data[indexPath.row]
        
        return cell
    }
    
    var numberOfRowsInSection: Int {
        return data.count
    }
}
