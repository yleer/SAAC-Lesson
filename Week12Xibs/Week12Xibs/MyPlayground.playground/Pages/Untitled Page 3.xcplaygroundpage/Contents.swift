//: [Previous](@previous)

import Foundation


struct User: Encodable {
    var name: String
    var signUpDate: Date
    var age: Int
}

    

let users = [
    User(name: "big", signUpDate: Date(), age: 23),
    User(name: "yle", signUpDate: Date(timeIntervalSinceNow: -84600), age: 25)
]


dump(users)

let enconder = JSONEncoder()

enconder.outputFormatting = .prettyPrinted
//enconder.outputFormatting = .sortedKeys

enconder.dateEncodingStrategy = .iso8601
do {
    let jsonData = try enconder.encode(users)
    guard let jsonString = String(data: jsonData, encoding: .utf8) else { fatalError()
        //
    }
    print(jsonString) // json
    // 나중엔 json -> zip 파일도 해보자 -> 외부
}
catch{
    print(error)
}
