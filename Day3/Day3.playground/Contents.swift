import Cocoa

//Arrays, dictionaries, sets, and enums


/*--------------------------------------------------------------*/
//MARK: 1)arrays에 정렬된 데이터를 저장하는 방법
//같은 type저장
//🍓1. 초기화
var scores = Array<Int>()
var names = Array<String>()

var scores1 = [Int]()
var names1 = [String]()

var scores2 = [3,4]
var names2 = ["Dami", "Yumi"]

//🍓2. 값 수정: 추가,삭제,전체삭제

print(scores2)
scores2.append(5) //5추가
print(scores2)
scores2.remove(at: 0) // 0번째 삭제
print(scores2)
scores2.removeAll()//전체삭제
print(scores2.count)

//🍓3. 값 순서대로, 반대로 출력
names2.reverse()
print(names2) //반대

names2.sort()
print(names2)   //정렬


/*--------------------------------------------------------------*/
//MARK: 2) dictionaries에서 데이터를 저장하고 찾는 방법
//🍓1. 초기화
//[키: 값, 키1:값1, :키2:값2]
var dic = [String: String]()
var birth = [String: Int]()
let bool = [String: Bool]()
let olympics = [Int: String]()


var dic1 = ["키1" : "값1", "키2": "값2"]
var birth1 = ["다미": 1999, "유미" : 2004]
let olympics1 = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]

//print 할때 키 값이 없을경우 error =>deault:지정한다(type에따라)
print(dic["키5", default: "못찾음"]) //value:String
print(birth1["다미5", default:3]) //value : Int
print(olympics1[2012, default: "Unknown"])

//🍓2. 값 추가, 수정 (키값 존재=> 값 수정, 키없으면=> 키 추가후 값 추가)
dic1["키1"] = "값0" // 키1 의 값1=>값0
dic1["key3"] = "value3" //key3 란 키값을 추가해서
print(dic1)

// 인데스로 검색안됌. 키값으로 검색⭐️
let prices = ["Milk": 1, "Pepsi": 2]
//print(prices[0])

/*--------------------------------------------------------------*/

//MARK: 3)sets에서 빠른 데이터 조회하는 방법 //중복시 자동 중복제거
//array와 비교
//append():  마지막에 값 추가(순서존재)
//insert(at:)으로 at순서에(순서존재)
var numArray = [Int]()
var numSet = Set<Int>()

numArray = [1,2,3,4]
numArray.append(5)
numArray.insert(6, at: 0)
print(numArray)

//insert 무작위로 저장
//append X
//insert():무작위 추가
numSet.insert(1)
numSet.insert(2)
numSet.insert(3)
print(numSet)

//set, array 초기값 넣기비교⭐️
var set = Set([1,2,3,3])
var array = [1,2,3,4]
print(set.count)

var people = Set<String>()
people.insert("Denzel Washington")
people.insert("Tom Cruise")
people.insert("Nicolas Cage")
people.insert("Samuel L Jackson")
print(people)
print(people.contains("Tom Cruise"))


//중복이 안되서 정확하고, 인덱스가 없어서 찾는 속도빠르다.
/*--------------------------------------------------------------*/
//MARK: 4)enum 만들고 사용방법
//열거형으로 저장하는 때: 수가 고정된 데이터들을 정확히 사용할때
enum Weekday {
//    case monday
//    case tuesday
//    case wednesday
//    case thursday
//    case friday
    case monday, tuesday, wednesday, thursday, friday
    
}
var day = Weekday.monday
day = Weekday.tuesday
day = .friday


