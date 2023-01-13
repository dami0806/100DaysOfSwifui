import Cocoa

//MARK: ❤️ 1.구조체 생성
struct User {
    var name = "Anonymous"
    var age: Int
}
let twostraws = User(name: "Paul", age: 38)


//MARK: ❤️ 2 구조체 안에 계산속성 ⭐️계산 속성에는 항상 명시적 형식
struct Sports {
    var name: String
    var isOlympicSport: Bool

    var olympicStatus: String { //‼️계산 속성: 타입 명확히
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}
let chessBoxing = Sports(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

struct Wine {
    var age: Int
    var isVintage: Bool
    var price: Int {
        if isVintage {
            return age + 20
        } else {
            return age + 5
        }
    }
}
let malbec = Wine(age: 2, isVintage: true)
print(malbec.price)


struct Medicine {
    var amount: Int
    var frequency: Int
    var dosage: String {
        return "Take \(amount) pills \(frequency) times a day."
    }
}




struct Swordfighter {
    var name: String
    var introduction: String {
        return "Hello, my name is \(name)."
    }
}
let inigo = Swordfighter(name: "Inigo Montoya")


//MARK: ❤️3 .Property observers 속성 관찰자 didSet willset ⭐️속성관찰자는 항상 var
// 속성 변경 전후에 코드를 실행   시간 경과에 따라 진행 상황을 조정
//didSet{ 위의 변수가 이안에 들어가서 변화를 볼수 있음}

//willSet:변경하기 전 상태
//didSet: 변경하고난 후 상태
struct StepCounter {
    var steps: Int {
        didSet {
            print("You've walked \(steps) steps - good job!")
        }
    }
}

struct Person {
    var clothes: String {
        didSet {
            print("I'm changing to \(clothes)")
        }
    }
}
struct FuzzyClock {
    var hour: Int {
        didSet {
            if hour < 12 {
                print("It's morning")
            } else if hour < 18 {
                print("It's the afternoon")
            } else {
                print("It's the evening.")
            }
        }
    }
}
struct Child {
    var name: String
    var age: Int {
        didSet {
            print("Happy birthday, \(name)!")
        }
    }
}

struct Dogs {
    var age:Int{
    didSet {
            let dogAge = age * 7
            print("I'm now \(dogAge) in dog years.")
        }
    }
    
}

struct Game {
    var score: Int {
        didSet {
            print("Your score is now \(score).")
        }
    }
}

//MARK: ❤️ 4.구조체 내부에 함수사용   (함수는 구조체안의 속성 사용가능)

struct Singer {
    var signatureSong: String
    func sing() {
        print("Who wants to hear \(signatureSong)?")
    }
}

struct Venue {
    var name: String
    var maximumCapacity: Int
    func makeBooking(for people: Int) {
        if people > maximumCapacity {
            print("Sorry, we can only accommodate \(maximumCapacity).")
        } else {
            print("\(name) is all yours!")
        }
    }
}
struct Users {
    var name: String
    var street: String
    var city: String
    var postalCode: String
    func printAddress() -> String {
        return """
        \(name)
        \(street)
        \(city)
        \(postalCode)
        """
    }
}



//MARK: ❤️ 5.메서드 내에서 속성을 변경 하려면 mutating
//요청하지 않는 한 속성을 변경하는 메서드를 작성할 수 없다
//mutating func 함수명(:){속성변화}
struct Diary {
    var entries: String
    mutating func add(entry: String) {
        entries += "\(entry)"
    }
}

struct Surgeon {
    var operationsPerformed = 0
    mutating func operate(on patient: String) {
        print("Nurse, hand me the scalpel!")
        operationsPerformed += 1
    }
}
struct BankAccount {
    var balance: Int
    mutating func donateToCharity(amount: Int) {
        balance -= amount
    }
}
struct Switch {
    var isOn: Bool
    mutating func toggle() {
        if isOn {
            isOn == false
        } else {
            isOn == true
        }
    }
}

//❤️MARK: 6 이니셜라이저는 사용할 새 구조체 인스턴스를 준비하도록 설계된 특수 메서드
//⭐️ 정의된 순서대로 각 프로퍼티를 받아들이는 초기화 memberwise initializer

/*
멤버와이즈 이니셜라이저란?
 저장 프로퍼티에 초기값을 지정하는 방법은 두 가지이다.

 1) 프로퍼티를 정의할 때 프로퍼티 기본값 (default value)를 할당한다.
 2) 이니셜라이저를 실행하여 초기값 (initial value)을 할당한다.
 이니셜라이저 (Initializer)를 직접 정의하면, 초기화 과정을 원하는 대로 구현
 사용자 정의 이니셜라이저를 생성하면, 기존의 기본 이니셜라이저 (init())는 사용할 수 없다. (별도로 구현필요)
 
 
*/

struct InBody {
    var height: Double = 170.0
    var weight: Double = 70.0
}
let dami: InBody = InBody(height: 180, weight: 80) // 멤버와이즈 이니셜라이저를 사용
let yumi: InBody = InBody() // 기본 이니셜라이저를 사용
let damdam: InBody = InBody(height: 160) // 기본값이 있는 저장 프로퍼티는 필요한 매개변수만 사용하여 초기화 가능
let sunny: InBody = InBody(weight: 80)


//사용자 정의 이니셜라이저를 정의하면, 기본 이니셜라이저 및 멤버와이즈 이니셜라이저를 사용할 수 없다.
struct Player1 {
    let name: String
    let number: Int
}
let player1 = Player1(name: "Megan R", number: 15)

struct Player2 {
    let name: String
    let number: Int

    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
}

/*⭐️1.func없다
  ⭐️2.새 Player인스턴스가 생성되지만 초기화 프로그램은 명시적으로 반환 유형을 가지지 않습니다. ⭐️항상 자신이 속한 데이터 유형을 반환
*/

//var일때만 remove..변형가능
//❤️ 5.문자열의 속성,메소드
// count hasPrefix() uppercased() sort()

//❤️ 6.배열
//count append() firstIndex()인텍스 번호 sorted() remove(at: 0)
let cardGames = ["Poker", "Blackjack", "Whist"]
cardGames.firstIndex(of: "Whist") == 2
