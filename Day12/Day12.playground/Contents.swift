import Cocoa

//MARK: ❤️1.클래스와 구조체 차이

//구조체                                 💛예시에서 차이점: mutating로 메소드안 값 변경, init(X) 참조된 값 안바뀜,
//struct UserData {
//    var name: String
//    var age: Int
//    mutating func updateUser(_ name: String, _ age: Int) { //구조체는 메서드안에서 속성변경 안돼서 mutating 필수
//        self.name = name
//        self.age = age
//
//        print("이름 : \(name), 나이 : \(age)")
//    }
//
//}
//
//var shark = UserData(name: "상어", age: 16)
//print("이름 : \(shark.name), 나이 : \(shark.age)")
//// 이름 : 상어, 나이 : 16
//var candy = shark // ->값 복사후         ⭐️실제로는 대입할때 복사가 이루어지지 않고
//candy.name = "캔디" //->값을 바꿔도           값을 바꿀때(수정할때) 값이 복사가 된다.  =>  copy-on-write
//candy.age = 30
//print("이름 : \(shark.name), 나이 : \(shark.age)") //->shark 속성은 그대로. 변경안됨
//// 이름 : 상어, 나이 : 16
//print("이름 : \(candy.name), 나이 : \(candy.age)")
//// 이름 : 캔디, 나이 : 30
//shark.updateUser("띠용", 33)
//// 이름 : 띠용, 나이 : 33
//
////클래스
//class Phone {
//    var name: String
//    var color: String
//    // struct와 달리 class는 이니셜라이즈를 지정해야합니다.
//    init(name: String, color: String) { //  💛차이점 struct와 달리 class는 이니셜라이즈를 지정
//        self.name = name
//        self.color = color
//    }
//    func updatePhone(name: String, color: String) {   // 💛차이점 class는 method안에서 property 변경이 가능하기 때문에 mutating을 붙이지 않아도 됩
//        self.name = name
//        self.color = color
//        print("폰 : \(name), 색상 : \(color)")
//    }
//}
//
//let iPhone8 = Phone(name: "iPhone8", color: "red")
//print("폰 : \(iPhone8.name), 색상 : \(iPhone8.color)")
//// 폰 : iPhone8, 색상 : red
//var iPhoneXs = iPhone8
//iPhoneXs.name = "iPhoneXs"
//iPhoneXs.color = "grey"    //reference type =>   💛차이점 iPhone8에 대한 속성도 함께 변형
//print("폰 : \(iPhone8.name), 색상 : \(iPhone8.color)")
//// 폰 : iPhoneXs, 색상 : grey
//print("폰 : \(iPhoneXs.name), 색상 : \(iPhoneXs.color)")
//// 폰 : iPhoneXs, 색상 : grey
//iPhoneXs.updatePhone(name: "iPhoneX", color: "black")
//// 폰 : iPhoneX, 색상 : black


//MARK: ❤️2.
//오버라이드 (override)
//: 슈퍼클래스로부터 상속받은 메서드, 프로퍼티들을 재정의


//class Name { //슈퍼 클래스
//    var name = "Song"
//    func myName() {
//        print("my name is \(name)")
//    }
//}
//let song : Name = Name()
//song.myName()


////my name is Song and your name is Kim 로 메서드 변경
//class ourName : Name {  //하위 클래스
//    var yourName = "Kim"
//    override func myName() {
//        print("my name is \(name) and your name is \(yourName)")
//    }
//}
//
//let song2 : ourName = ourName()
//song2.myName()

//재정의 하기 전의 메서드는 접근도 접근하기 위해 super()사용=> 부모메소드와 추가된 자식 orride메서드 모두 사용가능

//my name is Song
//my name is Song and your name is Kim
//class ourName : Name {  //하위 클래스
//    var yourName = "Kim"
//
//    override func myName() {
//        super.myName()
//        print("my name is \(name) and your name is \(yourName)")
//    }
//}
//
//let song2 : ourName = ourName()
//song2.myName()

//상속 막기위해서는 final 사용
//class Name { //슈퍼 클래스
//    var name = "Song"
//    final func myName() {
//        print("my name is \(name)")
//    }
//}
//
//class ourName : Name {  //하위 클래스
//    var yourName = "Kim"
//    override func myName() { //final 메소드라서 override안됌
//        print("my name is \(name) and your name is \(yourName)")
//    } //에러
//}


//MARK: ❤️3.클래스에 대한 이니셜라이저를 추가
//클래스에 대한 멤버 단위 초기화를 자동으로 생성하지않음
//=>사용자가 직접 추가
class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

//오류 =>슈퍼 클래스에 자체 초기화 프로그램을 실행하도록 요청필요
//class Car: Vehicle {
//    let isConvertible: Bool
//
//    init(isConvertible: Bool) {
//        self.isConvertible = isConvertible
//    }
//}


class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}





//MARK: ❤️4.deinit() 클래스에서만 사용.  뒤에()없음

/*
 class Job {
     deinit {
         print("I quit!")
     }
 }
 Job의 인스턴스 가 파괴 될 때 메시지를 인쇄
 
 
 
 
 */
//MARK: ❤️5. 객체복사
//구조체를 복사할 때 원본과 복사본은 고유한 속성을 가진 서로 다른 것


struct User {
    var username = "Anonymous"
}
var user1 = User()
var user2 = user1

user2.username = "Taylor"
print(user1.username)
print(user2.username)   //Anony, Taylor => ⭐️구조체는 원본 영향미치지 않음
//사본 간에 데이터를 공유 안함
//⭐️사본을 변경해도 원본도 조정되지 않았기 때문에 "Anonymous"와 "Taylor"가 인쇄
 


//클래스는 공유함
//class User {
//    var username = "Anonymous"
//}
//var user1 = User()
//var user2 = user1
//
//user2.username = "Taylor"   둘다  Taylor  => ⭐️클래스는 원본과 복사본정보공유
//⭐️사본을 변경해도 원본도 조정되었기 때문에 "Taylor"와 "Taylor"가 인쇄=> 새 인스턴스를 생성해서 안전하게 복사본 가져야함

//class User {
//    var username = "Anonymous"
//
//    func copy() -> User {
//        let user = User()
//        user.username = username
//        return user
//    }
//}






//구조체 - mutating사용, 클래스는 아님
//letㅡ올 mutating사용한 구조체 접근 못함
//class var,let
class Light {
    var onState = false
    func toggle() {
        if onState {
            onState = false
        } else {
            onState = true
        }
        print("Click")
    }
}
let light = Light()
light.toggle()

//mutating이므로 var로 접근
struct Code {
    var numberOfBugs = 100
    mutating func fixBug() {
        numberOfBugs += 3
    }
}
var code = Code()
code.fixBug()


/*
 class    (인스턴스 변경, 프로퍼티 변경)ox
 
            (인스턴스 생성)
 프로퍼티 선언)
            let   var
        let  x,x   o,x
        var  x,o   o,o

 
 struct
            (인스턴스 생성)
프로퍼티 선언)
                 let   var
            let  x,x   o,x
            var x,❕x  o,o


상수 인스턴스, 상수 속성 – 항상 같은 이름을 가진 동일한 사용자        x,x
상수 인스턴스, 변수 속성 – 항상 동일한 사용자를 가리킴o 이름 변경o     x,o
변수 인스턴스, 상수 속성 – 다른 사용자를 가리킴o      이름변경x      o,x
변수 인스턴스, 변수 속성 – 다른 사용자를 가리킴o      이름변경o      o,o
 */
 //class 의 var-var

//체크포인트
class Animal {
    let legs: Int
    init(legs: Int){
        self.legs = legs
    }
}

class Dog: Animal {
    override init(legs: Int) {
        super.init(legs:legs)
    }
    func speak() {
        print("I am a barking dog")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs:legs)
    }
    func speak() {
        print("I am a speaking cat")
    }
}

class Corgi: Dog {
    override init(legs: Int) {
        super.init(legs:legs)
    }
    override func speak() {
        print("I am a barking Corgi")
    }
}

class Poodle: Dog {
    override init(legs: Int) {
        super.init(legs:legs)
    }
    override func speak() {
        print("I am a barking Poodle")
    }
}

class Persian: Cat {
    override init(legs: Int, isTame: Bool) {
        super.init(legs:legs, isTame: isTame)
    }
    override func speak() {
        print("I am a speaking Persian")
    }
}

class Lion: Cat {
    override init(legs: Int, isTame: Bool) {
        super.init(legs:legs, isTame: isTame)
    }
    override func speak() {
        print("I am a speaking Lion")
    }
}

var dog = Dog(legs: 4)
var corgi = Corgi(legs: 4)
var persian = Persian(legs: 4, isTame: false)
var lion = Lion(legs: 4, isTame: true)
dog.speak()
corgi.speak()
persian.speak()
lion.speak()
