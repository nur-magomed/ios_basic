import Foundation

enum State: CaseIterable {
    case orderInitiated
    case stockReduced
    case fundsTaken
    case emailSent
    case orderCompleted
    case stockRestored
    case refundIssued
    case rollbacked
}


protocol StateItem {
    associatedtype ItemState: Hashable

    var state: ItemState { get }

    static var transactions: [ItemState: Set<ItemState>] { get }

    func canTransform(nextState: ItemState) -> Bool

    mutating func transition(nextState: ItemState)
}

extension StateItem {
    static func isStateAllowed(from: ItemState, to: ItemState) -> Bool {
        guard let validStates = transactions[from] else { fatalError() }
        return validStates.contains(to)
    }

    func canTransform(nextState: ItemState) -> Bool {
        return type(of: self).isStateAllowed(from: state, to: nextState)
    }
}


class GiftRedeemHistory: StateItem {
    private(set) var state: State = .orderInitiated

    static let transactions: [State : Set<State>] = [
        .orderInitiated: [State.stockReduced, State.fundsTaken],
        .stockReduced: [State.fundsTaken, State.stockRestored, State.rollbacked],
        .fundsTaken: [State.stockRestored, State.refundIssued, State.emailSent, State.rollbacked],
        .emailSent: [State.orderCompleted],
        .refundIssued: [State.stockRestored, State.rollbacked],
        .stockRestored: [State.rollbacked]
    ]

    func transition(nextState: State) {
        precondition(canTransform(nextState: nextState), "Wrong state")
        self.state = nextState
    }
}


do {
    var redeemHistory = GiftRedeemHistory()
    print(redeemHistory.state)
    redeemHistory.transition(nextState: .stockReduced)
    print(redeemHistory.state)
    redeemHistory.transition(nextState: .fundsTaken)
    print(redeemHistory.state)
    redeemHistory.transition(nextState: .emailSent)
    print(redeemHistory.state)
}
