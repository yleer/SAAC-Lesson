//
//  SeachViewController.swift
//  Week6
//
//  Created by Yundong Lee on 2021/11/01.
//

import UIKit
import RealmSwift
import Zip
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchResultTableView.reloadData()
        
    }
    
    // 다큐먼트 폴더 경로 -> 이미지 찾기 -> UIimage -> UIimageView
    func loadImageFromDocumentDirectory(imageName: String) -> UIImage?{
        
        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
        
        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        
        let path = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
        if let dirctoryPath = path.first{
            let imageUrl = URL(fileURLWithPath: dirctoryPath).appendingPathComponent(imageName)
            return UIImage(contentsOfFile: imageUrl.path)
        }
        
        return nil
    }
    
    func deleteImageFromDirectory(imageName: String){
        // 1. 이미지 저장할 경로: 다큐먼트 경로(.documentDirectory) - FileManger가 관리
        // 샌드박스때문에 계속 위치가 바껴서 아래와 같이 경로 얻어옴.
        // ex) /user/ios/wee6app/
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        // 2. 이미지 파일 이름
        // ex) /user/ios/wee6app/image.jpg
        let imageUrl = documentDirectory.appendingPathComponent(imageName)
        
        // 3. 이미지 저장: 동일한 경로에 저장하게 될 경우, 덮어쓰기 됨
        // 3-1. 이미지 경로 확인.
        if FileManager.default.fileExists(atPath: imageUrl.path){
            // 3-2 기존 경로에 있는 이미지 삭제.
            do{
                try FileManager.default.removeItem(at: imageUrl)
                print("이미지 삭제됨.")
            } catch{
                print("이미지 삭제 못했습니다.")
            }
        }
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
        cell.diaryImage.image = loadImageFromDocumentDirectory(imageName: "\(row._id).jpg")
        cell.diaryImage.layer.cornerRadius = 10
        cell.diaryImage.contentMode = .scaleToFill
        cell.contentLabel.text = row.diaryContent
        cell.dateLabel.text = "\(row.createdDate)"
        
                
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        try! localRealm.write{
            // Realm에서만 삭제한거임. -> 이미지 url에 찾아가 이미지도 직접 삭제해야됨.
            deleteImageFromDirectory(imageName: "\(tasks[indexPath.row]._id).jpg")
            localRealm.delete(tasks[indexPath.row])
            
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let taskToUpdate = tasks[indexPath.row]
        
        
        let sb = UIStoryboard(name: "Search", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        
        vc.tmpDate = "\(taskToUpdate.createdDate)"
        vc.tmpTitle = taskToUpdate.diaryTitle
        vc.tmpContet = taskToUpdate.diaryContent
        vc.tmpDiary = loadImageFromDocumentDirectory(imageName: "\(tasks[indexPath.row]).jpg")
    
        
        navigationController?.pushViewController(vc, animated: true)
        
        // 1 레코드에 대한 수정
//        try! localRealm.write{
//            taskToUpdate.diaryTitle = "title edited"
//            taskToUpdate.diaryContent = "new content"
//            tableView.reloadData()
//        }
        
        // 2 일괄 수정
//        try! localRealm.write{
//            tasks.setValue(Date(), forKey: "createdDate")
//            tableView.reloadData()
//        }
        
        // 3 수정 pk 기준 수정할때 (권장 x)
//        try! localRealm.write{
//            let update = UserDiary(value: ["_id" : taskToUpdate._id, "diaryTitle": taskToUpdate.diaryTitle])
//            localRealm.add(update, update: .modified)
//            tableView.reloadData()
//        }
        
        // 4
//        try! localRealm.write{
//            localRealm.create(UserDiary.self, value: ["_id" : taskToUpdate._id, "diaryTitle": taskToUpdate.diaryTitle], update: .modified)
//        } 
        
    }
    
    
}

