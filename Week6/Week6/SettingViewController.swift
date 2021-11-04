//
//  SettingViewController.swift
//  Week6
//
//  Created by Yundong Lee on 2021/11/04.
//

/*
 백업하기
 - 사용자의 아이폰 저장 용량 확인.
    - 부족 -> 백업 불가능 안내
- 백업 진행
    - 아무 데이터도 없을 시 백업할 데이터 없다고 안내
    - Realm, folder등 데이터 존재 확인.
    - Progress bar + UI 인터렉션 금지 하기. (백업 진행 시.)
- zip
    - 백업 완료 시점에
    - Progress bar + UI 해제
- 공유화면
 */


/*
 복구하기
 - 사용자 아이폰 공간 확인.
 - 파일 앱
    - zip 파일
    - zip 선택
 - zip -> unzip
    - 백업 파일 이름 확인
    - 압축해제
        - 백업 파일 확인: 폴더, 폴더 안 내용 이름들 확인.
        - 정상적인 파일 확인.
 - 백업 당시 데이터랑 지금 현재 데이터 어떻게 결합할지 확인.
 - 백업 데이터 선택
 - 백업 파일 확인
 - 정상적인 파일인가 확인
 
 
 */

import UIKit
import MobileCoreServices
import Zip

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // 다큐먼트 폴더 위치 가져오기.
    @IBAction func activityVCbuttonClicked(_ sender: UIButton) {
        presentActivityViewController()
    }
    
    func documentDirectoryPath() -> String? {
        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
        
        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let path = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
        
        if let directoryPath = path.first{
            return directoryPath
        }else{
            return nil
        }
    }
    
    @IBAction func restoreButtonClicked(_ sender: UIButton) {
        
        // 복구 1. 파일 앱 열기
        let documentPicker = UIDocumentPickerViewController(documentTypes: [kUTTypeArchive as String], in: .import)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
        
        self.present(documentPicker, animated: true, completion: nil)
        
        
        
    }
    // 7 공유
    func presentActivityViewController() {
        // 압축 파일 경로 가져오기
        let fileName = (documentDirectoryPath()! as NSString).appendingPathComponent("archive.zip")
        let fileUrl = URL(fileURLWithPath: fileName)
        
        let vc = UIActivityViewController(activityItems: [fileUrl], applicationActivities: [])
        
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func backUpButtonClicked(_ sender: UIButton) {
        // 4. 백업할 파일에 대한 url 배열
        var urlPaths = [URL]()
 
        // 1. 폴더 위치 확인 (/user/app/ios/appname)
        if let path = documentDirectoryPath(){
            // 2. 백업하고자 하는 파일 url 확인.
            // 이미지 같은 경우 백업 편의성을 위해 폴더에 담는게 좋음.
            let realm = (path as NSString).appendingPathComponent("default.realm")
            
            if FileManager.default.fileExists(atPath: realm){
                // 5. URL 배열에 백업 파일 url 추가
                urlPaths.append(URL(string: realm)!)
            }else{
                print("백업할 파일이 없습니다. ")
            }
            
            // 2. 백업하고자 하는 파일 확인.
        }
        
        //3.  배열에 대한 압축 파일 만들기.
        do {
            let zipFilePath = try Zip.quickZipFiles(urlPaths, fileName: "archive") // Zip
            print("압축경로 \(zipFilePath)")
            presentActivityViewController()
        }
        catch {
          print("Something went wrong")
        }
    }
    
}

extension SettingViewController: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        
        // 복구 2. 선택한 파일의 경로를 가져와야함
        guard let selectedFileUrl = urls.first else { return }
        
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let sandBoxFileUrl = directory.appendingPathComponent(selectedFileUrl.lastPathComponent)
        
        // 복구 3. 압축 해제
        
        
        if FileManager.default.fileExists(atPath: sandBoxFileUrl.path){
            // 기존에 복구하고자 하는 zip파일을 다큐멘트에서 가지고 있는 경우, 도큐먼트에 위치한 곳에 unzip하면 됨.
            do{
                let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                let fileUrl = documentDirectory.appendingPathComponent("archive.zip")
                try Zip.unzipFile(fileUrl, destination: documentDirectory, overwrite: true, password: nil, progress: { progress in
                    print(progress)
                }, fileOutputHandler: { unzippedFile in
                    print(unzippedFile)
                })
            }catch{
                print("not good ")
            }
            
        }else{
            // 파일 앱의 zip -> 다큐먼트에 복사.
            do{
                try FileManager.default.copyItem(at: selectedFileUrl, to: sandBoxFileUrl)
                let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                let fileUrl = documentDirectory.appendingPathComponent("archive.zip")
                try Zip.unzipFile(fileUrl, destination: documentDirectory, overwrite: true, password: nil, progress: { progress in
                    print(progress)
                }, fileOutputHandler: { unzippedFile in
                    print(unzippedFile)
                })
            }catch{
                print("error")
            }
        }
    }
}
