//: [Previous](@previous)

import Foundation

func checkDateFormat(text: String) -> Bool {
    let format = DateFormatter()
    format.dateFormat = "yyyyMMdd"
    
    return format.date(from: text) == nil ? false : true
}

func validateUserInput(text: String) -> Bool {
    guard !(text.isEmpty) else {
        print("empty string")
        return false
    }
    
    // 사용자 입력이 숫자로 변환가능한지
    guard Int(text) != nil else{
        print("not a number")
        return false
    }
    
    // 사용자 입력이 숫자고 -> 날자 포멧인지
    guard checkDateFormat(text: text) else{
        print("not a date format")
        return false
    }
    
    
    return true
}

//if validateUserInput(text: "20200201"){
//    print("good")
//}else{
//    print("bad")
//}


// 오류 처리 패턴
// 컴파일러가 오류 타입 인지
enum ValidationError: Int, Error {
    case emptyString = 401
    case invalidInt = 402
    case invalidDate = 403
}


func validateUserInputError(text: String) throws -> Bool {
    guard !(text.isEmpty) else {
        throw ValidationError.emptyString
    }
    
    // 사용자 입력이 숫자로 변환가능한지
    guard Int(text) != nil else{
        throw ValidationError.invalidInt
    }
    
    // 사용자 입력이 숫자고 -> 날자 포멧인지
    guard checkDateFormat(text: text) else{
        throw ValidationError.invalidDate
    }
    
    return true
}


do{
   let result =  try validateUserInputError(text: "20209101")
    print("성공")
}catch ValidationError.emptyString{
    print("값이 비어 있습니다.")
}catch ValidationError.invalidInt{
    print("숫자가 아닙니다.")
}catch ValidationError.invalidDate{
    print("날짜가 아닙니다.", ValidationError.invalidDate.rawValue)
}


// 위 아래와 동일,.

do{
   let result =  try validateUserInputError(text: "20209101")
    print("성공")
}catch {
    switch error{
    case ValidationError.emptyString: print("empty string")
    case ValidationError.invalidInt: print("not a int")
    case ValidationError.invalidDate: print("not a date")
    }
}


let result1 = try! validateUserInputError(text: "20201011")
let result2 = try? validateUserInputError(text: "dafs")
