import Cocoa


enum ProgrammerType {
    case FrontEnd
    case BackEnd
    case FullStack
}

enum ProgrammerLevel {
    case Juniour
    case Middle
    case Seniour
}

enum SalaryError: Error {
    case TooMuch
    case NotEnough
}

fileprivate class LocalLogger {
    
    internal static func logWarn(message: String) {
        print("WARNING: \(message)")
    }
    
    internal static func logError(message: String) {
        print("ERROR: \(message)")
    }
    
    internal static func logInfo(message: String) {
        print("INFO: \(message)")
    }
    
}

class Programmer {
    private(set) var availableLanguages: [String]
    var degree: String
    var type: ProgrammerType
    private(set)  var salary: Double
    var level: ProgrammerLevel
    
    internal init(availableLanguages: [String], degree: String, type: ProgrammerType, salary: Double, level: ProgrammerLevel) {
        self.availableLanguages = availableLanguages
        self.degree = degree
        self.type = type
        self.salary = salary
        self.level = level
    }
    
    init(degree: String, type: ProgrammerType, salary: Double, level: ProgrammerLevel) {
        self.availableLanguages = ["Swift", "Objective-C", "Java", "Kotlin", "C", "C++", "C#", "JavaScript", "TypeScript"]
        self.degree = degree
        self.type = type
        self.salary = salary
        self.level = level
    }
    
    
    func setSalary(salary newSalary: Double) throws {
        if newSalary > 250000.0 && level != .Seniour {
            LocalLogger.logWarn(message: "Salary too much for \(level) level")
            throw SalaryError.TooMuch
        } else if newSalary > 150000.0 && level == .Juniour {
            LocalLogger.logWarn(message: "Salary too much for \(level) level")
            throw SalaryError.TooMuch
        } else if newSalary <= 10000 {
            LocalLogger.logWarn(message: "Salary too low for \(level) level")
            throw SalaryError.NotEnough
        } else {
            LocalLogger.logInfo(message: "New salary: \(newSalary)")
            salary = newSalary
        }
    }
    
    func code() {
        print("I'm coding")
    }
}

extension Programmer: CustomStringConvertible {
    var description: String {
        return "Programmer: degree-\(degree), type-\(type), salary-\(salary), level-\(level), languages-\(availableLanguages) "
    }
}

class iOSProgrammer: Programmer {
    
    override init(degree: String, type: ProgrammerType, salary: Double, level: ProgrammerLevel) {
        super.init(availableLanguages: ["Swift", "Objective-C"], degree: degree, type: type, salary: salary, level: level)
    }
    
    
    override func code() {
        print("I'm coding in Swift")
    }
}


class AndroidProgrammer: Programmer {
    
    override init(degree: String, type: ProgrammerType, salary: Double, level: ProgrammerLevel) {
        super.init(availableLanguages: ["Java", "Kotlin"], degree: degree, type: type, salary: salary, level: level)
    }
    
    override func code() {
        print("I'm coding in Java")
    }
    
    func codeCrossPlatform() {
        print("I'm coding cross-platform in Kotlin")
    }
}


class PythonProgrammer: Programmer {
    
    override init(degree: String, type: ProgrammerType, salary: Double, level: ProgrammerLevel) {
        super.init(availableLanguages: ["Python"], degree: degree, type: type, salary: salary, level: level)
    }
    
    override func code() {
        print("I'm coding in Python")
    }
    
    func analyzeBigData() {
        print("I'm analyzing big data in Python")
    }
}

func solveProblem(programmer: Programmer) {
    programmer.code()
}

var programmer = Programmer(degree: "Master", type: ProgrammerType.BackEnd, salary: 100000.0, level: ProgrammerLevel.Juniour)
print(programmer)
programmer.degree = "Bachelor"
print(programmer)
do {
    try programmer.setSalary(salary: 200000)
} catch is SalaryError {
    LocalLogger.logError(message: "Not valid salary")
}
print(programmer)
solveProblem(programmer: programmer)

var iOSdeveloper = iOSProgrammer(degree: "Otus courses", type: ProgrammerType.FrontEnd, salary: 200000.0, level: ProgrammerLevel.Middle)
print(iOSdeveloper)
do {
    try iOSdeveloper.setSalary(salary: 245000.0)
} catch is SalaryError {
    LocalLogger.logError(message: "Not valid salary")
}
print(iOSdeveloper)
solveProblem(programmer: iOSdeveloper)


var androidDeveloper = AndroidProgrammer(degree: "Bootcamp", type: ProgrammerType.FullStack, salary: 300000.0, level: ProgrammerLevel.Seniour)
print(androidDeveloper)
solveProblem(programmer: androidDeveloper)
