import Cocoa
//복습필요한 부분
//MARK: ❤️ 1 함수의 오류 처리
// 1.어떤 오류가 발생할 수 있는지 정의
// 2.오류를 던질 수 있는 함수를 작성
// 3. 호출하고 문제를 처리

//1.오류 정의
enum PasswordError: Error {
    case short, obvious
}
//2 함수 작성
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 10 {
        return "OK"
    } else {
        return "Good"
    }
}

// 3. do를 사용하여 함수를  try 호출해서 발생하는 오류를 포착하여 던지는 함수를 호출
let string = "12345"

do {
    let result = try checkPassword(string)
    print("Rating: \(result)")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

//MARK: ❤️2 프로토콜
//프로토콜 확장은 전체 프로토콜을 확장하여 계산된 속성 및 메서드 구현을 추가하므로 해당 프로토콜을 준수하는 모든 유형이 이를 가져옵니다.
//필요한 기능을 구현하여 데이터 유형을 프로토콜에 맞게
//protocol Vehicle {
//    func estimateTime(for distance: Int) -> Int
//    func travel(distance: Int)
//}
//struct Car: Vehicle {
//    func estimateTime(for distance: Int) -> Int {
//        distance / 50
//    }
//
//    func travel(distance: Int) {
//        print("I'm driving \(distance)km.")
//    }
//}
//1.get는 상수 또는 계산된 속성
//2.get set는 getter,setter가 있는 변수 또는 계산된 속성
protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

let name = "Car"
var currentPassengers = 1


//MARK: ❤️3 프로토콜 확장: 전체 프로토콜을 확장하여 계산된 속성 및 메서드 구현을 추가
//메서드 나열 후 -> 프로토콜 확장 내부에 메서드기본 구현을 추가

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}
let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}



//MARK: ❤️ 4 옵셔널과 옵셔널 풀기
//옵셔널에 값이 있으면 중괄호 안에 코드를 실행하고, 옵셔널에 값이 없으면 코드를 실행 한다


//🍓1.if let
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}


//🍓2.guard let
//guard let number = number else {
//       print("Missing input")
//       return
//   }
//
//   print("\(number) x \(number) is \(number * number)")


//🍓3. nil 병합 연산자:옵셔널을 언래핑 하고 옵셔널이 비어 있으면 기본값
let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

//MARK: ❤️ 5 후행 클로저
//ex ) T"로 시작하는 이름만 포함하도록 배열을 필터링
let team = ["Gloria", "Suzanne", "Tiffany", "Tasha"]

let onlyT = team.filter({ (name: String) -> Bool in
    return name.hasPrefix("T") //한줄일땐 return 제거
})
//let onlyT = team.filter {
//$0.hasPrefix("T")
//} 같은 구문(특수 구문 사용)
print(onlyT)
