import Cocoa
/*
Optional 변수란 “아무 값도 들어 있지 않은(nil 값)” 혹은 “어떠한 값”이 저장되어 있는 변수이다. 반대로 ? 없이 선언되는 일반 변수는 항상 값을 가지고 있는 것
String? 변수와 String 변수는 다른 자료형이며 서로 호환되지 않는다.

 //MARK: ❤️옵셔널 푸는 방법
Optional Unwrapping: Optional Type의 값을 Non-Optional Type의 값으로
변환할 때 사용

1.강제추출(Forced Unwrapping):!를 이용해서 옵셔널을 강제 해제
값이 없는 nil일 경우에도 옵셔널을 해제하려고 해서

자칫 잘못 사용하다간 큰 문제를 발생 시킬 수 있다


2.Optional Binding
:if let
        -표현식이 nil인지 평가하여 간단한 피드백을 줄 때
        f 구문 안에서만 사용 가능
        (else 구문 및 밖에서 사용 불가)
        - 단순히 옵셔널 처리 값에 대한 피드백만 주고 싶을 때
 - 값 있으면 이렇게 처리하고 nil 이면 저렇게 처리해!
 guard let
        
        표현식이 nil인지 평가하여
        nil일 경우 함수 실행을 종료시킬 때
        guard 구문 밖에서만 사용 가능
        (else 구문에서 사용 불가)
        - 옵셔널 처리 값이 nil인 경우 무조건 함수의 실행을 종료 시킬 때
 값 없니? 그럼 내 함수에서 나가
        
사용방법
1. if let name: Type: Optional{}
2. while let name: Type: Optional{}
3. guard let name: Type: Optional else{}
*/

//MARK: ❤️ 1 if let
//1
var favoriteMovie: String? = nil  //String = "해리포터"라면 옵셔널이 아닌 if letunwrap 을 사용
favoriteMovie = "The Life of Brian"
if let movie = favoriteMovie {
    print("Your favorite movie is \(movie).")
} else {
    print("You don't have a favorite movie.")
}

//2
let song: String? = "Shake it Off"
if let unwrappedSong = song { //바인딩
    print("The name has \(unwrappedSong.count) letters.")
}

let tableHeight: Int? = 100
//if tableHeight > 85.0 { 안됌
if tableHeight ?? 60 > 85 {
    print("The table is too high.")
}
//var score: Int = nil 아닌 var score?: Int = nil
let userAge: Int? = 38
if let age = userAge {
    print("You are \(age) years old.")
}



var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

//MARK: ❤️ 2 guard

func double(number: Int?) -> Int? {
    guard let number = number else {
        return nil
    }
    return number * 2
}

//MARK: ❤️ 3 nil 병합으로 옵션을 언래핑하는 방법
//옵션과 함께 nil 병합
//Nil 병합은 하나가 아닌 두 개의 물음표를 사용
//??뒤에는 빈문자 nil이 아닌 명확한 값

let lightsaberColor: String? = "green"
let color = lightsaberColor ?? "blue" //?? nil 안됌

var userOptedIn: Bool? = nil
var optedIn = userOptedIn ?? false

//MARK: ❤️ 4 옵셔널 체이닝을 사용하여 여러 옵셔널을 처리하는 방법
let songs: [String]? = [String]()
let finalSong = songs?.last?.uppercased()

let shoppingList = ["eggs", "tomatoes", "grapes"]
let firstItem = shoppingList.first?.appending(" are on my shopping list")


let capitals = ["Scotland": "Edinburgh", "Wales": "Cardiff"]
let scottishCapital = capitals["Scotland"]?.uppercased()

let favoriteColors = ["Paul": "Red", "Charlotte": "Pink"]
let charlotteColor = favoriteColors["Charlotte"]?.lowercased()

let racers = ["Hamilton", "Verstappen", "Vettel"]
let winnerWasVE = racers.first?.hasPrefix("Ve")

//MARK: ❤️ 5 옵션으로 함수 실패를 처리하는 방법
//사용 시 try발생할 수 있는 모든 오류를 포착
//오류를 발생시키는 함수는 throws로 표시
//try? with if let
//try!하고 호출 시 오류가 발생하면 코드가 충돌

//checkpoint
func randomNum(nums: [Int]?) -> Int {
    return nums?.randomElement() ?? Int.random(in: 1...100)
}
print(randomNum(nums: [1,2,3,4]))
print(randomNum(nums: nil))
