import UIKit

class User {
    var name: String = ""
    var age: Int = 5
}

struct UserStruct {
    var name: String
    var age: Int
}

extension UserStruct {
    init(age: Int) {
        self.age = age
        self.name = "guest"
    }
}

// 인스턴스 - 저장 프로퍼티는 다 초기화 되어 있어야 하다.   lazy는 예외
// struct는 기본 초기화 구문 줘서 딱히 새로운 init 필요 없음. (merberwise init)

// struct에 사용자 정의 init 정의하면 기본 초기화 구문 사용 불가. -> 사용자 정의 init을 extension에
// 추가해두면 기본 init도 사용 가능하다.


// class는 기본 초기화 구문 없어서 Init 정의 해야 됨.

let a = User()



// 아래 두 코드 동일함. 둘다 초기화 하는거임. 위에꺼는 초기화 구문 그냥 생략한것.
let color = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.3)
let color2 = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.3)



// Convience init

class Coffee {
    
    // Desginated init
    init(shot: Int, size: String, menu: String) {
        self.shot = shot
        self.size = size
        self.menu = menu
    }
    
    // 기본 (2, tall)
    convenience init(value: String) {
        self.init(shot: 2, size: "보통", menu: value)
        
    }
    
    let shot: Int
    let size: String
    let menu: String
}


let c = Coffee(shot: 2, size: "크게", menu: "아아")
let c2 = Coffee(value: "sdasd")


extension UIColor {
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
}

let customColor = UIColor(red: 122, green: 123, blue: 205)


// 프로토콜 - 프로퍼티, 메서드, 초기화 구문
protocol Jack {
    // getter, setter -> 확인
    func welcome()
    init() // 프로토콜 안에 init 있으면 required init으로 구현.
}

//class Hello: Jack {
//
//    required init() {
//    }
//
//    func welcome() {
//        print("hello ")
//    }
//}
//
//class HelloBrother: Hello{
//    required init() {
//
//    }
//}

class Hello {
    init() {
        print("hello")
    }
}

class HelloBrother: Hello, Jack {
    func welcome() {
        
    }
    
    required override init() {
        super.init()
        print("hello brother")

    }
}

//let k = HelloBrother()


// 초기화 구문 델리게이션

class A {
    var value: Int
    
    init() {
        self.value = 20
    }
}

class B: A {
    override init() {
        super.init()
        print("B")
    }
}

class C: B {
    override init() {
        super.init()
        
    }
    
    deinit{
        print("deinit")
    }
}


var test: C? = C()
test = nil
