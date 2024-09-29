import Cocoa

// Сгенерировать массив случайных чисел (например 200 чисел). Найти индекс первого повторяющегося числа в массиве. Если все числа разные - то -1.

var randomNumArray: Array<Int> = [Int](repeating: 0, count: 200)
for index in 0..<randomNumArray.count {
    randomNumArray[index] = Int.random(in: 0...1000)
}

var numbSet: Set<Int> = Set()
var firstRepeatedIndex = -1
for index in 0..<randomNumArray.count {
    if (numbSet.contains(randomNumArray[index]) && firstRepeatedIndex == -1) {
        firstRepeatedIndex = index
    } else {
        numbSet.insert(randomNumArray[index])
    }
}

print(firstRepeatedIndex)
        
