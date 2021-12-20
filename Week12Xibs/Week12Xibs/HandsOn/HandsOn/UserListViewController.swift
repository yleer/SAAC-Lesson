//
//  UserListViewController.swift
//  HandsonProject
//
//  Created by Yundong Lee on 2021/11/08.
//

import UIKit

class UserListViewController: UIViewController {
    
    
    @IBOutlet weak var usersTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        usersTableView.delegate = self
        usersTableView.dataSource = self

        
//        AF.request(url, method: .get).validate().responseJSON { response in
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
//                print("JSON: \(json)")
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
}


extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as? UserTableViewCell else { return UITableViewCell() }
        
        // MARK: cell init things.
        cell.userStatusLabel.text = "오늘의 뉴스"
        cell.userNameLabel.text = "오늘의 특별한 장소를 소개합니다"

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ChattingViewController") as? ChattingViewController else { return }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
}
