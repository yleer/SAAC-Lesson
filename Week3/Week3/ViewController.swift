//
//  ViewController.swift
//  Week3
//
//  Created by Yundong Lee on 2021/12/21.
//

import UIKit
import SnapKit


enum ApiError: String, Error {
    case unknownError = "alert_error_unknown"
    case serverError = "alert_error_zz"
}

extension ApiError: LocalizedError {
    var errorDescription: String? {
        return NSLocalizedString(self.rawValue, comment: "")
        
    }
}


class ViewController: UIViewController {
    
    var tableView = UITableView()
    var apiService = ApiService()
    var castData: Cast?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        print(UITableViewCell.reuseIdentifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.reuseIdentifier)

        apiService.requestCast { cast in
            self.castData = cast
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseIdentifier, for: indexPath)
        cell.textLabel?.text = castData?.peopleListResult.peopleList[indexPath.row].peopleNm
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        (castData?.peopleListResult.peopleList.count) ?? 0
    }
    
    
}
