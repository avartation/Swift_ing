class City {
    public let name: String
    public let area: Int
    public let population: Int
    public let foundationYear: String
    public let timeZone: String
    public init(name: String, area: Int, population: Int, founded: String, timeZone: String) {
        self.name = name
        self.area = area
        self.population = population
        self.foundationYear = founded
        self.timeZone = timeZone 
    }
    public func describe() {
        print(name + " City")
        print("area        : \(area) km^2")
        print("population  : \(population)")
        print("founded in  : \(foundationYear)")
        print("time zone   : \(timeZone)", terminator: "\n\n")
    }
}

class Yerevan: City {
    private init() {
        super.init(name: "Yerevan", area: 223, population: 1060138, founded: "782 BC", timeZone: "UTC+4")
    }

    private static let uniqueInstance = Yerevan()
    public static func getInstance() -> Yerevan {
        return uniqueInstance
    }
}

class NewYork: City {
    private init() {
        super.init(name: "New York", area: 789, population: 8538000, founded: "1624 AC", timeZone: "UTC-5")
    }

    private static let uniqueInstance = NewYork()
    public static func getInstance() -> NewYork {
        return uniqueInstance
    }
}



let YC = Yerevan.describe()
let NYC = NewYork.describe()

YC.describe()
NYC.describe()
