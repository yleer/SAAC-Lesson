//: [Previous](@previous)

import Foundation



struct Person: Codable {
    var name: String
    var age: Int
    var homePage: String
}


let me = Person(
    name: "yleer",
    age: 20,
    homePage: "https://yleer-dev.tistory.com/"
)

let enconder = JSONEncoder()

enconder.outputFormatting = .prettyPrinted
//
//do {
//    let jsonData = try enconder.encode(me)
//    guard let jsonString = String(data: jsonData, encoding: .utf8) else { fatalError()}
//    print(jsonString)
//}
//catch{
//    print(error)
//}

let json =
"""
{
    "name":"yleer",
    "age":20,
    "homePage":"https://yleer-dev.tistory.com/"

}
"""

guard let jsonData = json.data(using: .utf8) else {fatalError()}
let personData = try JSONDecoder().decode(Person.self, from: jsonData)


print(json)
print(a)

