import Cocoa

struct User {
    
    var name: String
    let age: Int
    let email: String
    
}

    
var user1 = User(name: "John", age: 18, email: "john@mail.com")
var user2 = User(name: "Jane", age: 35, email: "jane@mail.com")
var user3 = User(name: "Alex", age: 42, email: "alex@mail.com")

var users: [User] = [user1, user2, user3]
print(users)
users[1].name = "Alice"
print(users)




