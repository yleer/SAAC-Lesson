//
//  APIService.swift
//  DramaInfo
//
//  Created by Yundong Lee on 2021/12/21.
//

import Foundation

class APIService {
    let sourceUrl = URL(string: "https://api.themoviedb.org/3/search/tv?api_key=6e61b7685e790bc1f3aaed7f5dcdb479&language=KR&page=1&query=dog&include_adult=false")!
    
    
    func requestFromUrl(completion: @escaping (TvShowsData?) -> Void) {
        URLSession.shared.dataTask(with: sourceUrl) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let response = response as?  HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("error")
                return
            }
            if let data = data, let castData = try? JSONDecoder().decode(TvShowsData.self, from: data) {
                print("good")
                completion(castData)
                return
            }
            
            completion(nil)
        }.resume()
    }
    
    func detailRequest(id: Int, completion: @escaping (DetailData?) -> Void) {
        
        let url = URL(string: "https://api.themoviedb.org/3/tv/\(id)?api_key=6e61b7685e790bc1f3aaed7f5dcdb479&language=en-US")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let response = response as?  HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("error")
                return
            }
            if let data = data, let castData = try? JSONDecoder().decode(DetailData.self, from: data) {
                print("goodaa")
                completion(castData)
                return
            }
            
            completion(nil)
        }.resume()
    }
    
}
