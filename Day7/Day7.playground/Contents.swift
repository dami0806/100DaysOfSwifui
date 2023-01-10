import Cocoa



/*
 // MARK: -
 
 [List] and (Tuple)
 [Set] and [Dictionary]
*/
//MARK: 1. 한 줄의 코드가 포함된 경우에만  return 없이 작동

//func pythagoras(a: Double, b: Double) -> Double {
//   /* let input = a * a + b * b
//    let root = sqrt(input)
//    return root*/.  //⭐️=>한줄로 줄인후 return 제거가능
//    sqrt(a * a + b * b)
//}
//
//let c = pythagoras(a: 3, b: 4)
//print(c)
////return a=b 는 a=b대입, return 없으면 bool값

//MARK: 2. dictionary [key:value]
//func getUser() -> [String] {
//    ["Taylor", "Swift"]
//}
//
//let user = getUser()
//print("Name: \(user[0]) \(user[1])")
//

//튜플
//func getUser2() -> (firstName: String, lastName: String) {
//    (firstName: "Taylor", lastName: "Swift")
//}
//
//let user2 = getUser2()
//print("Name: \(user2.firstName) \(user2.lastName)")





//MARK: 3.  튜플 (수정안되는 배열)
//❤️ 1.튜플을 반환하는 경우 이름을 이미 알고 있으므로  return를 사용할 필요가 없다
//func getUser() -> (firstName: String, lastName: String) {
//    ("Taylor", "Swift")
//}
// ❤️ 2. 요소에 이름없이 0부터 시작하는 숫자 인덱스를 사용하여 튜플의 요소에 액세스할 수 있습니다.

//func getUser() -> (String, String) {
//    ("Taylor", "Swift")
//}
//
//let user = getUser()
//print("Name: \(user.0) \(user.1)")

//❤️ 3. 반환하는 경우 튜플을 개별 값으로 분리가능
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}
//
//let user = getUser()
//let firstName = user.firstName
//let lastName = user.lastName
//
//print("Name: \(firstName) \(lastName)")

//❤️ 4.모든 값이 필요하지 않은 경우 를 사용 _하여 Swift에 튜플의 해당 부분을 무시
//let (firstName, _) = getUser()
//print("Name: \(firstName)")




//⭐️외부이름 내부이름 순서

// 1)❤️ (outName inName) -> 함수내에서 Int, 호출할때 outName 사용
// 2)❤️(Name) -> 내부 외부 다 Name 사용
// 3)❤️( _ inName) -> 외부에서 이름없이 바로 호출

//1)
//func printTimesTables(outName InName: Int) {
//    for i in 1...12 {
//        print("\(i) x \(InName) is \(i * InName)")
//    }
//}
//
//printTimesTables(outName: 5)

//2)
//func printTimesTables(_ InName: Int) {
//    for i in 1...12 {
//        print("\(i) x \(InName) is \(i * InName)")
//    }
//}
//
//printTimesTables(InName: 5)
//printTimesTables(5) //외부 _로 생각되어 호출 가능

//3)
//func printTimesTables(InOutName: Int) {
//    for i in 1...12 {
//        print("\(i) x \(InOutName) is \(i * InOutName)")
//    }
//}
//
//printTimesTables(InOutName: 5)

//😀MARK: 1 함수에서 argument를 1개만 사용시 같은거 사용
//😀MARK: 2 함수에서 argument를 2개 사용시 각각 사용
//😀MARK: 3 함수에서 argument를 2개 사용시 호출에 _있으면 _는 생략

//🍄1 person 1개 day 1개씨
func greet1(person: String, day: String) -> String {
 return "Hello \(person), today is \(day)."
}
greet1(person: "Bob", day: "Tuesday") //공통 arg label선언
//🍄2.내부에서 person, day 사용. 외부에선 name _ 사용
func greet2(name person: String, _ day: String) -> String {
 return "Hello \(person), today is \(day)."
}
greet2(name:"Bob","Tuesday")
//🍄3. 정리 내부 I, got, it    외부: _ Ye _
func okay(_ I: String, Ye got: String, _ it: String) -> String {
 return "Are \(I) \(got) \(it)?"
}
print(okay("Dami",Ye: "understand", "func"))

