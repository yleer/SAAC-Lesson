//
//  RealmModel.swift
//  Week6
//
//  Created by Yundong Lee on 2021/11/02.
//

import Foundation
import RealmSwift


// UserDiary - 테이블 이름
// persisted - col name
class UserDiary: Object {
    
    convenience init(title: String, content: String?, createdDate: Date, registerDate: Date) {
        self.init()
        self.diaryTitle = title
        self.diaryContent = content
        self.createdDate = createdDate
        self.registerDate = registerDate
        self.favorite = false
    }
    
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var diaryTitle: String
    @Persisted var favorite: Bool
    @Persisted var diaryContent: String?
    @Persisted var createdDate = Date()
    @Persisted var registerDate = Date()
}


