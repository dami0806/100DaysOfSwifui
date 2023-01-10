import Cocoa
//
////MARK: 1)파라미터에서 defualt값 유지하는 법
////❤️ 1.기본값을 지정
////end값에 12값을 넣어두면 호출생략때 오류없이 default값 나옴
//func mutilpleNum(for number: Int, end: Int = 12) {
//    for i in 1...end {
//        print("\(i) x \(number) is \(i * number)")
//    }
//}
//mutilpleNum(for: 5, end: 20)
//mutilpleNum(for: 8)
//
////❤️ 2.keepingCapacity: true // 배열요소가 지워져도 메모리 유지하기
////removeAll()->배열의 모든 항목을 제거한 다음 배열에 할당된 모든 메모리를 해제
////새 항목을 배열에 다시 추가하려고 할 수 있으므로 이전 용량을 유지하면서 항목을 제거방식 기본적으로는 keepingVapacity:false값
//var people = ["dami", "yumi", "Ray"]
//print(people.count)
//people.removeAll(keepingCapacity: true)
//print(people.count)
//
//func who(_ name: String, student: Bool = true) {
//    if student{
//        print("\(name) is a student :\(student) ")
//    } else {
//        print("\(name) is a student :\(student) ")
//    }
//}
//who("dami")
//who("Yumi",student: false)
////참
//MARK: 2)오류 발생처리 💚1 throw: 오류 던지기 💜2 try catch: 오류가 던져지는 것에 대비하여 던져진 오류를 처리(사용자에게 알리거나 다른실행)중 하나

//1Throw로 오류를 던진후 2 오류처리를 위해 호출부에서 do, try, catch문을 이용하여 작성합니다.

/*단계
1.발생할 수 있는 오류를 enum 정의
2.오류플래그 함수를 작성
3.해당 함수를 호출하고 발생할 수 있는 오류를 처리
*/

//1 enum에 오류타입명 정의
enum PasswordError: Error {
    case short, obvious
}
//2.오류가 나는 조건을 명시 : 오류 날수있는 코드를 사용자가 지정해서 오류를 지정해서 함수처럼 사용됨
//-오류가 발생할 수 있다는 것 표현 : throws를 ->전에 표시(반환 전에 오류가 발생하면, 오류객체를 반환한다는 의미)
//- 오류가 발생됐다는 표현 : throw와 오류명 집어넣기(return하는 것과 유사)
func checkPassword(_ password: String) throws -> String {
    // 오류가 나는 조건을 throws와 함께 배치
if password.count < 5 {
    throw PasswordError.short
}

if password == "123456" {
    throw PasswordError.obvious
}

if password.count < 8 {
    return "OK"
} else if password.count < 10 {
    return "Good"
} else {
    return "Excellent"
}
}

//2 do - try - catch로 접근



//⭐️형식
//1.do {try 오류 발생 가능 코드}
//catch 오류 패턴 {처리 코드}

//do절에서 오류를 던지고, catch 절에서 오류를 전달받아 예외처리를 해주는 것이다.
let string = "12345"

do {
    let result = try checkPassword(string) //호출
    print("Password rating: \(result)")
} catch {
    print("There was an error.")//에러
}
/**ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ**/
let string1 = "12345"

do {// 실행
    let result1 = try checkPassword(string1)
    print("Password rating: \(result1)")
} //특정 에러호출, 에러호출
catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}
















