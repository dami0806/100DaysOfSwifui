import Cocoa

//Type annotations

/*Swift는 어떤 유형을 사용해야 하는지 파악할 수 없습니다.
Swift가 기본값과 다른 유형을 사용하기를 원합니다.
아직 값을 할당하고 싶지 않습니다.
*/
//MARK: 1. Type annotations 사용 방법

var String_type: String = "A"
var Int_type: Int = 12
var Bool_type: Bool = true
var Array_type: [String] = ["a","r"]
var Dic_type : [String:String] = ["id":"dami", "password":"123"]
var Set_type:Set<String> = Set(["s","e","t"])

//빈배열 나타내기
var BlankArray1:[String] = [String]()
var BlankArray2:[String] = []


//타입을 지정해야 타입을 명확히나타냄.
var doub_type:Double = 0
var doub = 0 //🍓Int type


/*
 다음과 같은 것을 사용하여 문자열 배열을 생성하여 시작해야 합니다.
 let albums = ["Red", "Fearless"]
 를 사용하여 배열의 항목 수를 읽을 수 있습니다 albums.count.
 count세트에도 존재합니다.
 다음을 사용하여 배열에서 집합을 만들 수 있습니다.Set(someArray)
 세트에는 중복이 포함되지 않습니다.
*/

let Week = ["Monday", "Tuesday", "Wednesday", "Thursday" ,"Friday"," Saturday"," Sunday"," Sunday"]
let numberOfWeek = Week.count
print(numberOfWeek)

let uniqueUsers = Set(Week)
print(uniqueUsers)
