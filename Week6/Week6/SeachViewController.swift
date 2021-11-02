//
//  SeachViewController.swift
//  Week6
//
//  Created by Yundong Lee on 2021/11/01.
//

import UIKit
import RealmSwift
class SeachViewController: UIViewController {

    
    let localRealm = try! Realm()
    var tasks: Results<UserDiary>!
    @IBOutlet weak var searchResultTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchResultTableView.delegate = self
        searchResultTableView.dataSource = self
        
        // Get all tasks in the realm
        tasks = localRealm.objects(UserDiary.self)
        print(tasks)

    }
}

extension SeachViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell else {return UITableViewCell()}
        
        let row = tasks[indexPath.row]
        
        
        cell.titleLabel.text = row.diaryTitle
        cell.diaryImage.image = UIImage(named: "1")
        cell.diaryImage.layer.cornerRadius = 10
        cell.diaryImage.contentMode = .scaleToFill
        cell.contentLabel.text = row.diaryContent
        
                
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
    
    
}

