//
//  RealmQuery.swift
//  Week6
//
//  Created by Yundong Lee on 2021/11/05.
//

import UIKit
import RealmSwift


extension UIViewController {
    func fetch(text: String)  -> Results<UserDiary>!{
        let localRealm = try! Realm()
        let search = localRealm.objects(UserDiary.self).filter("diaryTitle CONTAINS[c] '\(text)' OR content CONTAINS[c] '\(text)'")
        
        return search
    }
    
    func getAllDiaryCountFromUserDiary() -> Int {
        let localRealm = try! Realm()
        
        
        return localRealm.objects(UserDiary.self).count
        
    }
}
