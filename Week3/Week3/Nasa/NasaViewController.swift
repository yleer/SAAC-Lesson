//
//  NasaViewController.swift
//  Week3
//
//  Created by Yundong Lee on 2021/12/22.
//

import UIKit

class NasaViewController: BaseViewContoller {
    
    let imageView = UIImageView()
    let label = UILabel()
    var buffer: Data?{
        didSet{
            let result = Double(buffer?.count ?? 0) / total
            label.text = "\(result * 100)/100"
        }
    }
    var session: URLSession!
    
    var total: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buffer = Data()
        request()
    }
    
    override func configure() {
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFill
        label.textAlignment = .center
        label.backgroundColor = .white
    }
    
    override func setUpConstraints() {
        view.addSubview(imageView)
        view.addSubview(label)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(100)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        session.finishTasksAndInvalidate() // 테스크 끝나고 리소스 정리.
        session.invalidateAndCancel() //리소스 정리, 실행중인 테스크 있어도 그냥 정리
    }
    
    
    func request() {
        let url = URL(string: "https://apod.nasa.gov/apod/image/2112/WinterSolsticeMW_Seip_2980.jpg")!
        
        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = false
        
        
//        session = URLSession(configuration: configuration, delegate: self, delegateQueue: .main)
        
        session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
        
        
        session.dataTask(with: url).resume()
        
        
        
        
        
//        URLSession(configuration: configuration).dataTask(with: url).resume()
        
        // 핸들러는 큰 데이터 너무 느림. -> 다른 방법 델리게이트
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            print(data)
//            print(response)
//        }.resume()
    }
    
}


extension NasaViewController: URLSessionDataDelegate {
    
    // 서버에서 최초로 응답을 받은 경우 호출(해더에 대한 값, 상태코드 확인 가능)
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse) async -> URLSession.ResponseDisposition {
        
        if let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) {
            total = Double(response.value(forHTTPHeaderField: "Content-Length")!)!
            return .allow
        }else{
            return .cancel
        }
    }
    
    // 데이터 응답에 있어서 계속 호출 됨. 서버에서 데이터 받을떄마다 반복적으로 호출 됨.
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        buffer?.append(data)
    }

    // 응답 완료시 -> 성공이면 error는 nil
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let error = error {
            print(error)
        }else{
            print("sueccess")
            
            // buffer가 다 왔을때 -> 이미지로 변환
            guard let buffer = buffer else {
                print("bffuer error")
                return
            }
            
            let image = UIImage(data: buffer)
            imageView.image = image
        }
    }
}
