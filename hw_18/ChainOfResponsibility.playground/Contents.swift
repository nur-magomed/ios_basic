import Foundation

protocol Handler {

    func handle(ticket: String) -> String?

    var nextHandler: Handler? { get set }
}

extension Handler {

    mutating func setNext(handler: Handler) -> Handler {
        self.nextHandler = handler
        return handler
    }

    func handle(ticket: String) -> String? {
        return nextHandler?.handle(ticket: ticket)
    }
}

class FirstLineSupport: Handler {

    var nextHandler: Handler?

    func handle(ticket: String) -> String? {
        if (ticket.contains("easy")) {
            return "I can handle this easy task"
        } else {
            return nextHandler?.handle(ticket: ticket)
        }
    }
}

class SecondLineSupport: Handler {

    var nextHandler: Handler?

    func handle(ticket: String) -> String? {
        if (ticket.contains("difficult")) {
            return "I can handle this difficult task"
        } else {
            return nextHandler?.handle(ticket: ticket)
        }
    }
}


class ThirdLineSupport: Handler {

    var nextHandler: Handler?

    func handle(ticket: String) -> String? {
        if (ticket.contains("advanced")) {
            return "Only I can handle this impossible task"
        } else {
            return nextHandler?.handle(ticket: ticket)
        }
    }
}



class SupportDeskService {
    
    let handler: Handler
    
    init(handler: Handler) {
        self.handler = handler
    }
    
    func process(ticket: String) -> String {
        return handler.handle(ticket: ticket) ?? "Call Chuck Norris"
    }
}


do {
    var firstLineHandler = FirstLineSupport()
    var secondLineHandler = SecondLineSupport()
    var thirdLineHandler = ThirdLineSupport()
    firstLineHandler.setNext(handler: secondLineHandler)
    secondLineHandler.setNext(handler: thirdLineHandler)
    
    let supportDesk = SupportDeskService(handler: firstLineHandler)
    print(supportDesk.process(ticket: "This is a difficult task"))
    print(supportDesk.process(ticket: "This is a easy task"))
    print(supportDesk.process(ticket: "This is a advanced task"))
    print(supportDesk.process(ticket: "This is an insane task"))
}
