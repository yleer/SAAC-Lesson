//
//  ViewController.swift
//  StretchyHeader
//
//  Created by Yundong Lee on 2021/12/20.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let tableView: UITableView = {
       let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        view.backgroundColor = .green
        tableView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
        }
        print("df")
//
        let header = StretchyHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 300))
        header.imageView.image = UIImage(named: "1")
        
        tableView.tableHeaderView = header
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .green
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = tableView.tableHeaderView as? StretchyHeaderView else {return}
        header.scrollViewDidScroll(scrollView: tableView)
    }
}

