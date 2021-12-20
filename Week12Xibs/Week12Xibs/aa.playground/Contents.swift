//import UIKit
//
//

import Foundation
////let str = " Pintween Rocks!!! "
////
////let startingIndex = str.startIndex
////let endingIndex = str.endIndex
////
////let firstLetterIndex = str.index(after: startingIndex)
////let tmp = str.index(before: endingIndex)
////let lastLetterIndex = str.index(before: tmp)
////
////let result = str[firstLetterIndex...lastLetterIndex]
////print(result)
//
////
////let greeting = "Pintween, Rocks!"
////
////let index = greeting.firstIndex(of: ",")
////let result = greeting[..<index!]
////print(result)
//
//
////for element in PintweenPOIList{
////    // 각 배열의 원소가 element
////}
//
//
//
//var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//
//if let value = airports["DUB"]{
//    print(value)
//}
//
//
//
////  위 Dictionary에서 DUB을 key로 Value를 꺼내는 코드를 작성해 주세요 *
//
//
////Q8. Swift에는 C나 Object-C에 없는 Optional이라는 코딩 방식이 있습니다.
//var name: String? = nil
////a. 위 String에서 if statement를 활용하여 value가 있다면 출력하고 없다면 error message를 출력하는 코드를 작성해 주세요.
////
////b. 만약 value가 항상 있다고 확신하여 강제하는 경우 코드를 작성해 주세요. 그리고 단점을 적어 주세요.
////
////c. optional value name에 대해 guard .. 방식으로 처리하는 코드를 작성해 주세요. 이 경우는 어떤 목적으로 사용되나요?
//
////if name != nil{
////    print(name!)
////}else{
////    print("There's no name.")
////}
//
////print(name!)
//// 이 경우 name의 값이 nil일 경우, unexpectedly found nil이라는 에러를 발생시킨다.
//// 그렇기 때문에 옵셔널 값이 확실하게 nil이 아닐 경우에만 강제해제 연산을 사용해야 한다.
//
//
//func optionUnwrapping() {
//    guard let nameValue = name else{
//        print("There's no name.")
//        return
//    }
//    print(nameValue)
//}
//
//optionUnwrapping()
//
//func SSOCheck(email: String, …, ssoName: String, completion: @escaping SSOResult) {… }
//
//Pintween의 실제 Swift 코드의 일부분입니다. @escaping은 어떤 경우에 사용하는지 적어 주세요
//Swift에서 enum은 다른 언어(e.g. C 언어 등)보다 확장된 개념입니다.
//다른 언어의 class type 처럼 확장되게 사용할 수 있어 아주 편리합니다.
// Swift enum으로 PintweenAPIError라는 type을 만들고 Switch String으로 errorMessage를
//return하는 enum class 코드를 작성해 주세요 *

//
//enum PintweenAPIError: String {
//    case calculationError
//    case zeroDivisionError
//}
//
//let error = PintweenAPIError.calculationError
//
//
//switch error{
//case .calculationError:
//    print("calculationError")
//case .zeroDivisionError:
//    print("zeroDivisionError")
//
//default:
//    print("some error")
//}

//protocol LivingThings{
//    func introduceSelf()
//}
//class people: LivingThings {
//    func introduceSelf() {
//        print("Hello my name is \(name) and I am \(age) old.")
//    }
//
//    var name: String
//    var age: Int
//    var major: String
//    var country: String
//
//    init(){
//        name = "yle"
//        age = 24
//        major = "Computer Engineering"
//        country = "Korea"
//    }
//}
//
//
//let person = people()
//person.introduceSelf()


