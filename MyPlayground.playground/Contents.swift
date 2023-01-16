import Cocoa

//checkpoin 8
protocol Building {
    var numRoom: Int { get }
    var cost: Int { get set }
    var agentName: String { get set }
    func summary()
}

extension Building {
    func summary() {
        print("The building has \(numRoom) rooms, costs \(cost) dollars, and is handled by agent \(agentName)")
    }
}

struct House: Building {
    var numRoom: Int = 4
    var cost: Int = 0
    var agentName: String
}

struct Office: Building {
    var numRoom: Int = 20
    var cost: Int = 10000
    var agentName: String
}

var house = House(agentName: "John")
house.summary()
var office = Office(agentName: "Mary")
office.summary()
