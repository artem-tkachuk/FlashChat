import Foundation

var str = "Hello, playground"

//MARK: - Example 1
let fruitBasket = ["Apple", "Pear", "Orange"]

for fruit in fruitBasket {
    print(fruit)
}

//MARK: - Example 2: for each loops
let names = ["Anna", "Alex", "Brian", "Jack"]

for name in names {
    print("Hello, \(name)")
}

//MARK: - Example 3: Range for loops
for number in 1...5 {
    print("Number \(number)")
}

for _ in 1...4 {
    print("Hello")
}

let fruits: Set = ["Apple", "Pear", "Orange"]   //set does not guarantee the order of the items in it, more efficient
let contacts = ["Adam": 123456789, "James": 987654321, "Amy": 3142536475]
let word = "supercalifragilisticexpialidocious"

let halfOpenRange = 1..<5
let closedRange = 1...5

for fruit in fruits {
    print(fruit)
}

for person in contacts {
    print(person.key)
    print(person.value)
}

for letter in word {
    print(letter)
}

for number in halfOpenRange {
    print(number)
}

for number in closedRange {
    print(number)
}

for _ in halfOpenRange {
    //block of code
    print("The loop is running")
}


//MARK: - While
var now = Date().timeIntervalSince1970
var oneSecondFromNow = now + 1

//

//class Assignment {
    func fibonacci(n: Int) {
        var fibArray: [Int] = []
        
        if (n <= 0) {
            print("Error!")
            return
        } else if (n == 1) {
            fibArray.append(0)
        } else {    //n >= 2
            fibArray.append(0)
            fibArray.append(1)
            
            for i in 2..<n {
               fibArray.append(fibArray[i - 1] + fibArray[i - 2])
            }
        }
        
        print(fibArray)
    }
//}

fibonacci(n: 2)


struct MyStruct {
    static let typeProperty = "123" //static property is associated with the type
    let instanceProperty = "ABC"    //instance property is associated with the instance created from the type
    
    func instanceMethod() {
        
    }
    
    static func typeMethod() {
        
    }
}

let myStruct = MyStruct()   //a new instance from the MyStruct blueprint
print(myStruct.instanceProperty)
myStruct.instanceMethod()


print(MyStruct.typeProperty)
MyStruct.typeMethod()


