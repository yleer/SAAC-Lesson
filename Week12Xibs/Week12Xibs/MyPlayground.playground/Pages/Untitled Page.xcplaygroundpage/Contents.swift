import UIKit


let json = """
{
"quote_content": "Wherever you go, no matter what the weather, always bring your own sunshine.",
"author_name": "Anthony J. D'Angelo"

}
"""

// swiftyJson -> json["author"].stringValue

struct Quote: Decodable {
    var quote: String
    var author: String
    var wrong: String?
    
    
    
    enum CodingKeys: String, CodingKey{
        case quote = "quote_content"
        case author = "author_name"
    }
    
}


// String(json) -> Data
guard let result = json.data(using: .utf8) else { fatalError("error") }
print(result)

let decoder = JSONDecoder()
//decoder.keyDecodingStrategy = .convertFromSnakeCase

// Data -> Quote
do{
    let value = try decoder.decode(Quote.self, from: result)
    print(value)
    print(value.author)
    print(value.quote)
}catch{
    print(error)
}

// 전략 1. 옵셔녈로 받기
// 전략 2. keyDecodingStrategy
// 전략 3. coding key


let json2 = """
{
"quote_content": "Wherever you go, no matter what the weather, always bring your own sunshine.",
"author_name": "Anthony J. D'Angelo"

}
"""





// Meta-Type

// string 타입은 String.type
let name = "yler"
type(of: name)

// quote: 인스턴스에 대한 타입, Quote: 구조체 타입은 뭐야? Quote.type
let quote = Quote(quote: "명언 명언", author: "요시")
type(of: quote)

struct User {
    var name = "고래밥"
    static let identifier = 1234567
    
}



//인스턴스의 프로퍼티와 타입 프로퍼티의 차이
let user = User()
user.name // 접근 가능
//use.identifier // 접근 불가능
type(of: user)
type(of: user).identifier


// 3다 같음
User.identifier
User.self.identifier
type(of: user).identifier
