//
//  PapagoViewController.swift
//  SaacWeek5
//
//  Created by Yundong Lee on 2021/10/26.
//

import UIKit
import Network

import Alamofire
import SwiftyJSON


class PapagoViewController: UIViewController {
    
    @IBOutlet weak var source: UITextView!
    @IBOutlet weak var target: UITextView!
    var translatedText : String = ""{
        didSet{
            target.text = translatedText
        }
    }
    
    
    let networkMonitor = NWPathMonitor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkMonitor.pathUpdateHandler = { path in
            if path.status == .satisfied{
                print("good network")
                
                if path.usesInterfaceType(.cellular){
                    print("cellular network")
                }else if path.usesInterfaceType(.wifi){
                    print("wifi network")
                }
                else{
                print("other network")
                }
            }else{
                print("bad network")
            }
            
        }
        networkMonitor.start(queue: DispatchQueue.global())
        
    }
    
    @IBAction func translateButton(_ sender: UIButton) {
        
        TranslateAPIManager.shared.fetchData(text: source.text!) { code, json in
            switch code{
            case 200:
                print("성공")
                self.translatedText = json["message"]["result"]["translatedText"].stringValue
            case 400:
                print("에러")
                let value = json["errorMessage"].stringValue
                self.translatedText = value
            default:
                print("오류")
            }
            
        }
        
        
    }
    

}
