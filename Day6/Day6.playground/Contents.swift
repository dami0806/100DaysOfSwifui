import Cocoa

//for
//let family = ["아빠","엄마","오빠","다미","유미"]
//for people in family {
//    print("\(people)is my family")
//}
for i in 1...10 {
    for j in 1..<10{
    print("\(i) x \(j) = \(i*j)")
    }
    
}
//횟수사용을 위해 변수가 필요 없을때
var lyric = "I Love "
for _ in 1...5{
    lyric += " You! "
}
print(lyric)

//while 조건이 거짓이 될 때까지

let Random_num = Int.random(in: 1...1000)

var roll = 0
while roll != 20{
    roll = Int.random(in: 1...20)
    print("number is \(roll)")

}
print("End!!")


//중단 및 계속
//파일명찾기
let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }

    print("Found picture: \(filename)")
}

//공배수 구하기
let number1 = 7
let number2 = 32
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)

        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)
/*
 목표는 1에서 100까지 반복하는 것이며, 각 숫자에 대해 다음을 수행합니다.

 3의 배수이면 "Fizz"를 출력합니다.
 5의 배수이면 "Buzz"를 출력합니다.
 3 과 5 의 배수이면 "FizzBuzz"를 출력합니다.
 그렇지 않으면 번호를 인쇄하십시오.

 */
for i in 1...100 {
    if i.isMultiple(of: 3){
        print("\(i) : Fizz")
    }
    else if i.isMultiple(of: 5){
        print("\(i) : Buzz")
    }
    else if i.isMultiple(of: 3) && i.isMultiple(of: 5){
        print("\(i) : FizzBuzz")
    }
    else {
        print("\(i)")
    }
}






