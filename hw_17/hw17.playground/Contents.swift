import Foundation

// Decorator
protocol Pizza {
    func getCost() -> Double
    func getDescription() -> String
}

class BasePizza : Pizza {
    
    func getCost() -> Double {
        return 300
    }
    
    func getDescription() -> String {
        return "Pizza with sauce "
    }
    
}

protocol PizzaDecorator : Pizza {
    var pizza : Pizza { get }
}

extension PizzaDecorator {
    func getCost() -> Double {
        return pizza.getCost()
    }
    
    func getDescription() -> String {
        return pizza.getDescription()
    }
}


class PepperoniDecorator : PizzaDecorator {
    var pizza : Pizza
    
    init(_ pizza : Pizza) {
        self.pizza = pizza
    }
    
    func getCost() -> Double {
        return pizza.getCost() + 300
    }
    
    func getDescription() -> String {
        return pizza.getDescription() + ", Pepperoni (salami and cheese)"
    }
}


class FourCheeseDecorator : PizzaDecorator {
    var pizza : Pizza
    
    init(_ pizza : Pizza) {
        self.pizza = pizza
    }
    
    func getCost() -> Double {
        return pizza.getCost() + 200
    }
    
    func getDescription() -> String {
        return pizza.getDescription() + ", Four cheese (mozzarella, provolone, gorgonzola, ricotta)"
    }
}


let basePizza: Pizza = BasePizza()
let fourCheese: Pizza = FourCheeseDecorator(basePizza)

let basePizza2: Pizza = BasePizza()
let pepperoniPizza: Pizza = PepperoniDecorator(basePizza2)

print(fourCheese.getDescription())
print(fourCheese.getCost())


print(pepperoniPizza.getDescription())
print(pepperoniPizza.getCost())


// Decorator

class BalanceService {
    
    func withdwaw(amount: Double, fromAccount: String) {
        print("Money withdrawn from \(fromAccount)")
    }
}


class StockService {
    
    func decreaseFromStock(sku: String) {
        print("removed one item of \(sku) from stock")
    }
    
}


class EmailService {
    
    func sendGift(sku: String, emailAddress: String) {
        print("sending email with \(sku) to \(emailAddress)")
    }
    
}


class GiftServiceFacade {
    
    let balanceService: BalanceService
    let stockService: StockService
    let emailService: EmailService
    
    public init(balanceService: BalanceService, stockService: StockService, emailService: EmailService) {
        self.balanceService = balanceService
        self.stockService = stockService
        self.emailService = emailService
    }
    
    public func redeeemGift(sku: String, account: String) {
        balanceService.withdwaw(amount: 100, fromAccount: account)
        stockService.decreaseFromStock(sku: sku)
        emailService.sendGift(sku: sku, emailAddress: account)
    }
    
}

let giftService: GiftServiceFacade = GiftServiceFacade(balanceService: BalanceService(), stockService: StockService(), emailService: EmailService())

giftService.redeeemGift(sku: "Ozon123", account: "User123")

