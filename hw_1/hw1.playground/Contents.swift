import Cocoa


// 1. Есть произвольный массив чисел, найти максимальное и минимальное число и поменять их местами

var randomIntArray = [10, 32, 45, 64, 93, 1, 43, 76, 41, 100, 8, 84]
print(randomIntArray)
var minNumIndex = 0;
var maxNumIndex = 0;

for index in 0..<randomIntArray.count {
    if (randomIntArray[index] < randomIntArray[minNumIndex]) {
        minNumIndex = index
    } else if (randomIntArray[index] > randomIntArray[maxNumIndex]) {
        maxNumIndex = index
    }
}

var tempNum = randomIntArray[maxNumIndex]
randomIntArray[maxNumIndex] = randomIntArray[minNumIndex]
randomIntArray[minNumIndex] = tempNum
print(randomIntArray)

// 2. Есть две коллекции символов - собрать результирующее множество из символов, что повторяются в 2х коллекциях
var firstCharArray = ["a", "b", "x", "c", "d", "y", "e", "f", "z"]
var secondCharArray = ["g", "z", "j", "k", "x", "l", "m", "o", "y"]

var setFistArray: Set<String> = Set(firstCharArray)
var duplicateCharSet: Set<String> = Set()

for char in secondCharArray {
    if ( !setFistArray.insert(char).inserted ) {
        duplicateCharSet.insert(char)
    }
}
print(duplicateCharSet)

// 3. Создать словарь с соотношением имя (ключ) пользователя - пароль (значение), получить из словаря все имена, пароли которых длиннее 10 символов
var accounts = ["User1" : "qwerty",  "User2" : "qwerty789Long", "User3" : "qwerty", "User4" : "qwerty", "User5" : "qwerty", "User6" : "qwerty", "User7" : "qwertyLongPassword", "User8" : "qwerty", "User9" : "qwertyVeryLong", "User10" : "qwerty"]
var longPasswordUsers: Set<String> = Set()
accounts.forEach { (name: String, password: String) in
    if(password.count > 10) {
        longPasswordUsers.insert(name)
    }
}
print(longPasswordUsers)
