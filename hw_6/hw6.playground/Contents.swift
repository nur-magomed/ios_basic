import Cocoa

//функция складывает две целочисленных переменных - отдает на выходе сумму
func sum(number1: Int, number2: Int) -> Int {
    number1 + number2
}

print(sum(number1: 40, number2: 2))

//функция принимает кортеж из числа и строки приводит число к строке и ввыводит в консоль резуультат
func printSum(_ tuple: (Int, String)) -> Void {
    print("\(tuple.1)\(String(tuple.0)) ")
}

printSum((25, "Again"))

//функция принимает на вход опциональное замыкание и целое число, выполняет замыкание только. в случае если число больше 0
func executeIfPositive(closure: (Int) -> Void, number: Int) -> Void {
    if number > 0 {
        closure(number)
    }
}

executeIfPositive(closure: { Int in
    print(Int * Int)
}, number: 10)

executeIfPositive(closure: { Int in
    print(Int * Int)
}, number: -2)


//функция принимает число на вход (год), проверить високосный ли он
func isLeapYear(year: Int) -> Bool {
    if (year % 4 != 0) {
        return false;
      } else if (year % 400 == 0) {
        return true;
      } else if (year % 100 == 0) {
        return false;
      } else {
        return true;
      }
}

print(isLeapYear(year: 2024))
print(isLeapYear(year: 2025))
print(isLeapYear(year: 2026))
print(isLeapYear(year: 2027))
print(isLeapYear(year: 2028))
print(isLeapYear(year: 2029))


