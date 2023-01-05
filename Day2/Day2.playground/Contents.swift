import Cocoa

//MARK: 1)Bool로 true,false을 저장하는 방법

//MARK: ! vs toggle()

//!        : 출력만
//toggle() : 저장    =>let X var O
// pinkCat = !pinkCat로 변수에 저장까지 하는게 pinkCat.toggle() 와 같음

let goodDog = true
var pinkCat = true
//print(!goodDog)
//print(goodDog) // ==>저장 안됌
////goodDog.toggle() ->let 상수이기에 변형안됨 error

//print(!pinkCat)
//print(pinkCat). ==>초기로 돌아옴
//pinkCat.toggle()
//print(pinkCat) ==>반대로 저장됨



//MARK: + vs \()
//+ 는 같은 타입끼리가능. 숫자는 합
//\(어떤타입이든) 다른 타입과 가능
var cat = "Tom"
var catAge = 10
var mouse = "Jerry"
var mouseAge = 11
print(cat + mouse) //문자열끼리
print(catAge + mouseAge) //정수끼리
print("cat인\(cat) + mouse인\(mouse) 나이합은 \(catAge + mouseAge)")
print("5*5 = \(5*5)")

//MARK: 3)1Day 2Day 정리
// 1. let: 상수 var: 변수
// 2. .count .uppercased() .hasprefix() .hassuffix() 120.isMutiple(of: 3)
// 3. 문자열이 여러 줄에 걸쳐 표시되도록 하려면 시작과 끝에 큰따옴표 3개를 사용
// 4. 10진수는 부동소수점으로, 값이 100% 정확하지는 않습니다. 돈같은 정밀도가 필요한 경우에는 사용하면 안 됩니다.
// 5. 변수를 직접 수정 하는 특수 복합 대입 연산자와 함께 +, -, *, 와 같은 내장 산술 연산자가 많이 있습니다./+=
// 6. !연산자 .toggle()로 참 거짓 반대로 표현, toggle()은 값 저장까지
// 7. 문자열 연결을 사용하면 효율적인 방식으로 문자열에 상수와 변수를 배치

//MARK: CheckPoint- 1
//1. let  celsius 사용
//2. 섭씨는 일반적으로 소수점으로 저장되므로 반드시 확인하고 .0로 생성하십시오.
//3. 우리는 *곱셈과 /나눗셈에 사용합니다.
//4. \(someVariable)사용
//5. Option+Shift+8을 사용하여 각도 기호 °를 얻을 수 있습니다. 이것은 25°F와 같은 것을 쓸 수 있음을 의미합니다.

let celsius = 25.0
let fahrenheit = celsius * 9 / 5 + 32
print("Celsisus: \(celsius)°  Fahrenheit: \(fahrenheit)° ")
      
