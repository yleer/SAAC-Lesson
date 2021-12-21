//
//  DetailViewController.swift
//  DramaInfo
//
//  Created by Yundong Lee on 2021/12/21.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    let tableView = UITableView()
    let imageBaseUrlString = "https://image.tmdb.org/t/p/original"
    var tvId: Int?
    var name: String?
    var dataz: DetailData?
    
    let apiService = APIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "DetailTableViewCell")
        
        
        print(tvId!)
        apiService.detailRequest(id: tvId!) { data in
            print(data)
            self.dataz = data
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as? DetailTableViewCell else {return UITableViewCell()}
        
        let row = dataz?.seasons[indexPath.row]
        
        if let a = row?.posterPath{
            let imageUrlString = imageBaseUrlString + a
            let url = URL(string: imageUrlString)
            cell.imageViewz.kf.setImage(with: url)
        }
        cell.title.text = row?.name
        cell.content.text = row?.overview
        cell.date.text = row?.airDate
//        cell.content.text = "Asdfsdfsdf"
        
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataz?.seasons.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
}
