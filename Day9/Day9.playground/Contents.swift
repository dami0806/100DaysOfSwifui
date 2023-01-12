import Cocoa

//closure =>저장기능때문에 유용

// 함수를 만들어 1.변수에 할당  2.그 변수를 사용하여  함수를 호출 3.함수를 다른 함수에 매개 변수로 전달할 수있다.
//일부 기능을 단일 변수에 래핑한 다음 어딘가에 저장
//함수에서 반환하고 클로저를 다른 곳에 저장
//MARK: ❤️1.기본 클로저 형태. 함수와 차이: ()없고 =가 있다.
let driving = {
    print("I'm driving in my car")
}
driving()

let learnSwift = {
    print("Closures are like functions")
}
learnSwift()

//MARK: ❤️2.매개변수있는 클로저: 중괄호 안에 (매개변수) in

var cleanRoom = { (name: String) in
    print("I'm cleaning the \(name).")
}
cleanRoom("kitchen")

let fixCar = { (problem: String) in
    print("I fixed the \(problem).")
}

//1. 함수와 달리 클로저는 외부 매개변수 레이블을 사용할 수 없다.
//2. 외부에서 매개변수의 변수를 선언하지 않음
//var cutGrass = { (Out In: Double) in } 안됌
//rowBoat(5)만 가능 rowBoat(A:5) 안됨


//MARK: ❤️3. 값을 반환한는 클로저 함수와 달리 : 대신 ->사용
//기본
let driving_basic = { (place: String) in
    print("I'm going to \(place) in my car")
}
//값 반환
let driving_return = { (place: String) -> String in
        return("I'm going to \(place) in my car")
}
//호출
driving_basic("논현")

let message = driving_return("인천")
print(message)

//MARK: ❤️4.클로저가 매개변수로 () -> Void. 클로저의 매개변수는 없고 Void 반환
//⭐️ 클로저는 매개변수를 허용하지 않고 아무것도 반환하지 않는 클로저여야 함
let drive = { print("This is Closure")}

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action() //⭐️클로저 호출 형태주의 변수()
    print("I arrived!")
}
//함수호출
travel(action: drive)


let resignation = {print("Dear , I'm outta here!") //클로저:
}
func printDocument(contents: () -> Void) {
    print("Connecting to printer...")
    print("Sending document...")
    contents()
}
printDocument(contents: resignation)

//MARK: ❤️5. 트레일링 클로저(Trailing Closure)  =>함수명과 동일 , 함수매개변수가 있다면 트레일링클로저에도 함수처럼 사용해야함 (외부매개있으면 외부매개변수..)
func makeCake(instructions: () -> Void) {
    print("Wash hands")
    print("Collect ingredients")
    instructions()
    print("Here's your cake!")
}
makeCake {
    print("Mix egg and flour")
}


func tendGarden(activities: () -> Void) {
    print("I love gardening")
    activities()
}
tendGarden {
    print("Let's grow some roses!")
}


func assembleToy(instruction: () -> Void) {
    instruction()
    print("It's done!")
}
assembleToy {
    print("Grok the glib")
    print("Flop the flip")
    print("Click the clack")
}

//⭐️함수에 count라는 매개변수
func repeatAction(count: Int, action: () -> Void) {
    for _ in 0..<count {
        action()
    }
}
repeatAction(count: 5) {  //⭐️count라는 매개변수대이
    print("Hello, world!")
}


func goCamping(then action: () -> Void) {
    print("We're going camping!")
    action()
}
goCamping {
    print("Sing songs")
    print("Put up tent")
    print("Attempt to sleep")
}


//⭐️⭐️이걸로 보면 후행 클로저 매개변수는 외부매개변수가 따로있으면 외부매개를, 한개의 매개변수면 그 매개변수를, 없으면 생략한다.
//외부 내부 매개변수
func goOnVacation1(to destination: String, _ activities: () -> Void) {
    print("Packing bags...")
    print("Getting on plane to \(destination)...")
    activities()
    print("Time to go home!")
}
goOnVacation1(to: "Mexico") {
    print("Go sightseeing")
    print("Relax in sun")
    print("Go hiking")
}

//한개 매개변수
func goOnVacation(destination: String, _ activities: () -> Void) {
    print("Packing bags...")
    print("Getting on plane to \(destination)...")
    activities()
    print("Time to go home!")
}
goOnVacation(destination: "Mexico") {
    print("Go sightseeing")
    print("Relax in sun")
    print("Go hiking")
}

//MARK: ❤️6 트레일링 클로저(Trailing Closure)
//매개변수-> Shortand Argument Names으로 대체하고, 이 경우 Parameter Name과 in 키워드를 삭제가능


func doSomething(closure: (Int, Int, Int) -> Int) {
    closure(1, 2, 3)
}
 
//함수호출
doSomething(closure: { (a, b, c) in
    return a + b + c
})

//==>클로저의 (a, b, c) in 생략, 변수를 $숫자로
doSomething(closure: {
    return $0 + $1 + $2
})
 
//5.체크포인트

/*
 짝수인 모든 숫자를 필터링합니다.
 배열을 오름차순으로 정렬
 "7은 행운의 숫자" 형식의 문자열에 매핑합니다.
 결과 배열을 한 줄에 한 항목씩 인쇄합니다.
 */
//filter()함수를 사용하면 배열의 모든 항목에 대해 일부 코드를 실행 => $0으로 모든 항복 탐색
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
let res = luckyNumbers.filter { !$0.isMultiple(of: 2)}
    .sorted {$0 < $1}
    .map { "\($0) is a lucky number"}
for r in res {
    print(r)
}






/*
함수와 달리 클로저는 여는 중괄호 안에 매개변수를 넣습니다.
 ❌거짓
 2 var paintPicture(){
     print("Where are my watercolors?")}
 이유: 1 괄호없고 2 등호있고 어야함
 => var paintPicture = {
 이렇게 ()없고 =가 들어감
 
 3 옳바른 형식
 let learnSwift = {print("Closures are like functions")}
    learnSwift()
 
 4 let greetUser = {print("Hi there!")}
    greetUser()
 
 ❤️2.매개변수가 있는 클로저   ⭐️추가: (매개변수) in
 
 var cleanRoom = { (name: String) in
     print("I'm cleaning the \(name).")
 }
 cleanRoom("kitchen")
 
 let fixCar = { (problem: String) in
     print("I fixed the \(problem).")
 }
 ❌거짓
 var cutGrass = { (length currentLength: Double) in 안됌
   => 외부내부 못나눔 외부(length) 없음
 
 
 3.매개변수와 return  클로저의 반환타입기호: ->  ⭐️추가 : -> 타입
 var flyDrone = { (hasPermit: Bool) -> Bool in
     if hasPermit {
         print("Let's find somewhere safe!")
         return true
     }
     print("That's against the law.")
     return false
 }
 
 ❌거짓

 var buyMagazine = { (name: String) -> Int in
     let amount = 10
     print("\(name) costs \(amount)")
     return amount
 }
 buyMagazine(name: "Wired")
 ⭐️클로저를 호출할 때 매개변수 이름을 사용안함
 */

/*
 ❤️ 3.클로저를 함수 매개변수로 전달
 How to use trailing closures and shorthand syntax
 1.속기 매개변수( shorthand parameters)는 $0, $1등으로 작성됩니다.
 2.코드가 한 줄이면 작성을 건너뛸 수 있습니다.return
 3.shorthand parameters는 나열안됨
 4.자동으로 매개변수 이름에 $0, $1, 등으로 번호를 지정
 5.매개변수가 많을땐 그냥 이름쓰는게 나음

 
 
 3.다른 함수를 매개변수로 받아들이는 함수를 작성하는 방법
 클로저를 매개변수로
 1.
 //클로저 선언
 let awesomeTalk = {
     print("Here's a great talk!")
 }
 함수선언
 func deliverTalk(name: String, type: () -> Void) {
     print("My talk is called \(name)")
     type()
 }
 함수호출
 deliverTalk(name: "My Awesome Talk", type: awesomeTalk)
 
 2.
 let swanDive = {
     print("SWAN DIVE!")
 }
 func performDive(type dive: () -> Void) {
     print("I'm climbing up to the top")
     dive()
 }
 performDive(type: swanDive)
 
 3.let helicopterTravel = {
 print("Get to the chopper!")
}
func travel(by travelMeans: () -> Void) {
 print("Let's go on vacation...")
 travelMeans()
}
travel(by: helicopterTravel)
 
 4.
 var goOnBike = {
     print("I'll take my bicycle.")
 }
 func race(using vehicleType: () -> Void) {
     print("Let's race!")
     vehicleType()
 }
 5.
 var payCash = {
     print("Here's the money.")
 }
 func buyClothes(item: String, using payment: () -> Void) {
     print("I'll take this \(item).")
     payment()
 }
 buyClothes(item: "jacket", using: payCash)
 
 6.
 ❌거짓
 let resignation = { (name: String) in
     print("Dear \(name), I'm outta here!")
 }
 func printDocument(contents: () -> Void) {
     print("Connecting to printer...")
     print("Sending document...")
     contents()
 }
 printDocument(contents: resignation)
 
 printDocument()매개변수는 매개변수를 허용하지 않는 클로저
 
 7.
 ❌거짓
 let driveSafely = {
     return "I'm being a considerate driver"
 }
 func drive(using driving: () -> Void) {
     print("Let's get in the car")
     driving()
     print("We're there!")
 }
 drive(using: driveSafely)
 
 drive()그 매개변수는 매개변수를 허용하지 않고 아무것도 반환하지 않는 클로저여
 
 var learnWithUnwrap = {
     print("Hey, this is fun!")
 }
 func learnSwift(using approach: () -> Void) {
     print("I'm learning Swift")
     approach()
 }
 learnSwift(using: learnWithUnwrap)
 
 
 
 1.후행 클로저 구문을 사용할 때 마지막 매개변수 이름을 빠뜨려야 합니다
 func doTricks(_ tricks: () -> Void) {
     print("Start recording now!")
     tricks()
     print("Did you get all that?")
 }
 func tendGarden(activities: () -> Void) {
     print("I love gardening")
     activities()
 }
 2.
 tendGarden {
     print("Let's grow some roses!")
 }
 
 3.func makeCake(instructions: () -> Void) {
 print("Wash hands")
 print("Collect ingredients")
 instructions()
 print("Here's your cake!")
}
makeCake {
 print("Mix egg and flour")
}
 
 4.steps클로저가 아닌 빈 튜플
 func brewTea(steps: ()) {
     print("Get tea")
     print("Get milk")
     print("Get sugar")
     steps()
 }
 brewTea {
     print("Brew tea in teapot.")
     print("Add milk to cup")
     print("Pour tea into cup")
     print("Add sugar to taste.")
 }
 5.
 func assembleToy(instruction: () -> Void) {
     instructions()
     print("It's done!")
 }
 assembleToy {
     print("Grok the glib")
     print("Flop the flip")
     print("Click the clack")
 }
  
 7.
 func repeatAction(count: Int, action: () -> Void) {
     for _ in 0..<count {
         action()
     }
 }
 repeatAction(count: 5) {
     print("Hello, world!")
 }
 
 
 8.
 func goCamping(then action: () -> Void) {
     print("We're going camping!")
     action()
 }
 goCamping {
     print("Sing songs")
     print("Put up tent")
     print("Attempt to sleep")
 }
 9.
 func goOnVacation(to destination: String, _ activities: () -> Void) {
     print("Packing bags...")
     print("Getting on plane to \(destination)...")
     activities()
     print("Time to go home!")
 }
 goOnVacation(to: "Mexico") {
     print("Go sightseeing")
     
 
 
 */

