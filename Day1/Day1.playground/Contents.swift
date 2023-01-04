import Cocoa

//MARK: - 1)변수와 상수를 만드는 방법
//var :내용변경o 타입변경x
//let: 내용변경x 타입변경x

//MARK: - 2)문자열을 만드는 방법
let name = "Dami"
let filename = "paris.jpg"
let quote = "This is \"quoteTest\" line."
let multipleLines = """
                    Use
                    3개 큰따옴표
                    in swift
                    줄이 구분이 되서 "인용문사용도" 가능
                    """ //앞 뒤로 한줄에 """만 있어야 한다


// .count : 변수 또는 상수 뒤에 써서 공백포함 문자열의 길이
let nameLength = name.count
// .uppercased() : 대문자 문자열로 변형
let nameCapital = name.uppercased()
// hasPrefix(): 시작하는 일부 문자열확인
// hasSuffix(): 끝나는 일부 문자열 확인 (파일타입파악시 유용)
let startFilename:Bool = filename.hasPrefix("par")
let endFilename:Bool = filename.hasSuffix(".jpg")


print(multipleLines) // """사용시 줄 바꿈으로 String내용인식 "란 문자사용가능
print(nameLength)
print(nameCapital)
print(startFilename)
print(endFilename)


//MARK: - 3)정수를 저장하는 방법
// 큰 숫자일때_를 사용해서 자릿수 구분(_무시됨)
let reallyBig = 100___000_000
var counter = 10
//.isMultiple(of: 확인원하는 배수숫자Int)
let check_muliple:Bool = counter.isMultiple(of: 3)
print(check_muliple)
print(120.isMultiple(of: 3))


//MARK: - 4)십진수를 저장하는 방법
//var :선언 시 값을 변경할 수 있지만 유형은 변경할 수 없다.
//double 과 Int는 연산 불가
//타입
var myInt = 1
var myDouble = 1.0
var myDouble1 = 1.2
var myNum = myInt + Int(myDouble)
var myNum1 = myInt + Int(myDouble1)
print(myNum1)

//CGFloat: 부동 소수점 스칼라 값

