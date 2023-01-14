import Cocoa
 
/*1)초기화 init()
1.init(){} : 자동 호출되는 생성자
 2.designated initializer: 모든 프로퍼티를 다 초기화
 클래스나 구조체 enum...=> 모든 프로퍼티는 초기화가 되어야 한다.
 if 프로터디생성때 초기화x ->init에서 다 초기화 해야함
*/

//MARK: ❤️1)초기화 init()
struct Experiment {
    var cost = 0 //이미 초기화
        //init(){}생략
}
let money = Experiment(cost: 3)

struct Tree {
    var type: String
    var hasFruit: Bool
    init() { //type hasFruit 다 초기화
        type = "Cherry"
        hasFruit = true
    }
}
let cherryTree = Tree()

struct Message {
    var from: String
    var to: String
    var content: String
    init() {
        from = "Unknown"
        to = "Unknown"
        content = "Yo"
    }
}
let message = Message()


struct Cabinet {
    var height: Double = 10
    var width: Double
    var area: Double
    init (itemWidth: Double) { //width, area만 반드시 초기화 height은 선택
        width = itemWidth
        area = height * width
    }
}
let drawers = Cabinet(itemWidth: 1.0)




// MARK: ❤️2) self : 속성과 같은 매개변수 이름을 가졌을때 속성 가리킴
//1
class Dam{
    var age: Int = 10
    var weight:Int = 20
    
init(yourAge:Int,yourWeight:Int){//모든속성이 있어야함 age, weight
    self.age = yourAge
    self.weight = yourWeight
    }
} //deisignated initializer  init()사라짐
var dami: Dam = Dam(yourAge: 20, yourWeight: 30)//Dam() 못씀
//2
struct Kitchen {
    var utensils: String
    init(utensils: String) {
        self.utensils = utensils
    }
}

//3
struct Cottage {
    var rooms: Int
    var rating = 5 //초기화 되있음
    init(rooms: Int) {
        self.rooms = rooms //rooms는 초기화해야만 하고 rating은 굳이
    }
}
let bailbrookHouse = Cottage(rooms: 4)




//MARK: ❤️3)class func, static func
//class와 static 둘 다 타입 프로퍼티로 만드는 키워드
//func이란 키워드 앞에 static 혹은 class가 붙은 메서드를 타입 메서드
//차이점:"class는 오버라이딩이 가능한데, static은 오버라이딩이 불가능하다는 것"
//오버라이딩: 슈퍼 클래스(부모)에 선언된 메소드와 같은 이름, 같은 리턴 타입, 같은 매개 변수 리스트를 갖는 메소드를
    //서브 클래스에서 재작성하는 것     ->오버라이딩안됀다? ->덮어쓰는게아니라 만든거->부모꺼 따로, 자식꺼 따로존재 ->super붙여서 부모 호출가능

class Ha {
    static func sayHello() { // 인스턴스와는 전~혀 상관 없는 사이 => "Sodeul"이라는 "Type"에만 연관되어 있는
        print("Hello")
    }
    class func sayBye() {  // 인스턴스와는 전~혀 상관 없는 사이
        print("Bye")
    }
}
Ha.sayHello()
Ha.sayBye()
//인스턴스 메서드가 아니기 때문에, 인스턴스를 생성할 필요 1도 없고,오로지 내가 속해있는 Type의 이름인 Sodeul만 알면, Sodeul에 대고 메서드를 호출

//class Sodeul {
//    static func sayHello() {
//        print("Hello")
//    }
//}
//
//class SodeulSodeul: Sodeul {
//    override static func sayHello() {    //오버라이딩안돼서 에러
//    }
//}

class Hi {
   class func sayBye() {
        print("Bye")
    }
}
 
class SodeulSodeul: Hi {
    override class func sayBye() {
    }
}

struct Person {
    static var population = 0
    var name: String
    init(personName: String) {
        name = personName
        //population += 1 안됌 일반메서드 내 정적속성 참조안됌
        Person.population += 1
    }
}



class Animal{
    static var nums = 0
    init(){
        Animal.nums += 1
    }
}
let dog = Animal()
Animal.nums//1
let cat = Animal()
Animal.nums //2


struct Pokemon {
    static var numberCaught = 0
    var name: String
    static func catchPokemon() {
        print("Caught!")
        Pokemon.numberCaught += 1
    }
}
struct Raffle {
    static var ticketsUsed = 0
    var name: String
    var tickets: Int
    init(name: String, tickets: Int) {
        self.name = name
        self.tickets = tickets
        Raffle.ticketsUsed += tickets
    }
}


//MARK: ❤️ 4) 엑세스제어
//private 사용시 멤버단위 초기화 안됨 init()없음. 사용하고싶으면 직접 init()생성해야함
struct Book{
    var title:String = "타이틀없음"
    private var name : String = "이름없음" //외부에서 변경못함
    mutating func setName(to newName: String){
        self.name = newName
    } //여기서 private 변수변경가능
    
}
var book = Book()
book.title = "부활"
book.setName(to: "셰익스피어")



struct Person2 {
    private var socialSecurityNumber: String
    init(ssn: String) {
        socialSecurityNumber = ssn
    }
}
let sarah = Person2(ssn: "555-55-5555")

struct Contributors {
    private var name = "Anonymous"
}
let paul = Contributors()


/*
 체크포인트 6
 모델, 좌석 수, 현재 기어를 포함하여 자동차에 대한 정보를 저장하는 구조체를 만든 다음
 기어를 위 또는 아래로 변경하는 메서드를 추가합니다.
 자동차의 모델과 좌석 수는 일단 생산되면 변경안됨.
 현재 기어는 분명히 변경 되므로 변수로
 기어를 위 또는 아래로 변경하면 이러한 변경이 가능해야 합니다. 예를 들어 기어 0은 없으며 최대 10개의 기어가 모든 차량은 아니지만 대부분을 커버해야 한다고 가정하는 것이 안전합니다.
 액세스 제어 를 사용하는 경우 private자체 이니셜라이저를 만들어야 할 수도 있습니다. ( private여기서 최선의 선택입니까? 직접 시도해보고 어떻게 생각하는지 확인하십시오!)
 mutating속성을 변경하는 메서드에 키워드 를 사용하는 것을 잊지 마세요 !
 \
 */
struct Car {
    enum Gears {
        case g1,g2,g3,g4,g5,g6,g7,g8,g9
        //case l1, l2, l3, l4
    }
    private let model: String
    private let numSeats: Int
    private var currGear: Gears = Gears.g1
    
    init(model: String, numSeats: Int) {
        self.model = model
        self.numSeats = numSeats
    }
    
    mutating func changeGearUp() {
        switch self.currGear {
        case Gears.g1:
            self.currGear = Gears.g2
        case Gears.g2:
            self.currGear = Gears.g3
        case Gears.g3:
            self.currGear = Gears.g4
        case Gears.g4:
            self.currGear = Gears.g5
        case Gears.g5:
            self.currGear = Gears.g6
        case Gears.g6:
            self.currGear = Gears.g7
        case Gears.g7:
            self.currGear = Gears.g8
        case Gears.g8:
            self.currGear = Gears.g9
        default:
            print("Can't Gearup")
            return
        }
        print(self.currGear)
    }
    mutating func changeGearDown() {
        switch self.currGear {
        case Gears.g2:
            self.currGear = Gears.g1
        case Gears.g3:
            self.currGear = Gears.g2
        case Gears.g4:
            self.currGear = Gears.g3
        case Gears.g5:
            self.currGear = Gears.g4
        case Gears.g6:
            self.currGear = Gears.g5
        case Gears.g7:
            self.currGear = Gears.g6
        case Gears.g8:
            self.currGear = Gears.g7
        case Gears.g9:
            self.currGear = Gears.g8
        default:
            print("Can't GearDown")
            return
        }
        print(self.currGear)
    
    }
    
}



var car = Car(model: "HynDea", numSeats: 3)
print(car)
car.changeGearDown()
car.changeGearUp()
car.changeGearUp()
car.changeGearDown()
car.changeGearDown()
car.changeGearDown()



 

