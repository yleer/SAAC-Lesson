//
//  DummyViewController.swift
//  Week3
//
//  Created by Yundong Lee on 2021/12/21.
//

import UIKit
import SnapKit

class DummyViewController: UIViewController {
    
    
    var tableView = UITableView()
    
    let viewModel = DummyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.reuseIdentifier)

    
    }
    
}


extension DummyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel.cellForRowAt(tableView, indexPath: indexPath)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfRowsInSection
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.heightOfRowAt
    }
    
}
