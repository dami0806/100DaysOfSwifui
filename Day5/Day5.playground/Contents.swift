import Cocoa
//MARK: 1)조건이 참인지 거짓에 따름
if true {
    print("true")
}
else {
    print("false")
}

//빈칸인지 확인 = "" 또는 .isEmpty사용: Bool
var username = "dami"
if username.isEmpty {
    username = "Anonymous"
}

//MARK: 2)여러 조건을 확인하는 방법
// || &&를 넣은 조건문

enum Whether {
    case Sunny,Rainy,Snow,Cloudy,Foggy,Misty,Clear
}

let today = Whether.Clear

if today == .Sunny || today == .Clear {
    print("화창한 날씨!")
} else if today == .Snow || today == .Rainy {
    print("우산챙겨!")
} else if today == .Cloudy {
    print("구름이 꼈어!")
} else {
    print("촉촉한 날씨")
}
//MARK: 3)switch 문
switch today {
case .Sunny:
    print("화창한 날씨!")
    fallthrough
case .Rainy:
    print("우산챙겨!")
    fallthrough
case .Snow:
    print("눈이내려요")
    fallthrough
default:
    print("안개끼거나 맑겠지")
}

//MARK: 4) 삼항 조건 연산자를 사용하는 방법
let age = 18
let canVote = age >= 18 ? "참일때 여기" : "거짓은 여기"
