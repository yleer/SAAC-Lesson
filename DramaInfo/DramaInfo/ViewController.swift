//
//  ViewController.swift
//  DramaInfo
//
//  Created by Yundong Lee on 2021/12/21.
//

import UIKit
import SnapKit
import Kingfisher

class ViewController: UIViewController {
    
    let searchBar = UISearchBar()
    var apiService = APIService()
    var data: TvShowsData?
    let imageBaseUrlString = "https://image.tmdb.org/t/p/original"
    
    let tvCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(DramaPosterCell.self, forCellWithReuseIdentifier: "DramaPosterCell")
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        setConstraints()
        
        apiService.requestFromUrl(completion: { data in
            self.data = data
            print(data)
            DispatchQueue.main.async {
                self.tvCollectionView.reloadData()
            }
        })
    
    }
    
    func configureViews() {
        view.backgroundColor = .white
        tvCollectionView.delegate = self
        tvCollectionView.dataSource = self
    }
    
    func setConstraints() {
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.trailing.equalTo(view.snp.trailing)
        }
        view.addSubview(tvCollectionView)
        tvCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
    }


}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data?.results.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DramaPosterCell", for: indexPath) as? DramaPosterCell else {
            let cel = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            return cel
            
        }
        let item = data?.results[indexPath.item]
        
    
        if let a = item?.posterPath{
            let imageUrlString = imageBaseUrlString + a
            let url = URL(string: imageUrlString)
            cell.imageView.kf.setImage(with: url)
        }
    
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = DetailViewController()
        vc.tvId = data?.results[indexPath.item].id
        vc.name = data?.results[indexPath.item].name
        
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 3  - 10, height: view.frame.width / 3 * 1.5)
    }
}
