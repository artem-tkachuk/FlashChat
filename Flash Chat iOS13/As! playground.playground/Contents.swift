import Foundation

class Animal {
    var name: String
    
    init(n: String) {
        name = n
    }
}

class Human: Animal {
    func code() {
        print("Typing away")
    }
}

class Fish: Animal {
    func breatheUnderWater() {
        print("Breathing under water")
    }
}

let artem = Human(n: "Artem Tkachuk")
let angela = Human(n: "Angela Yu")
let nemo = Fish(n: "Nemo")

let neighbours = [artem, angela, nemo]

let neighbour1 = neighbours[0]

let myDouble = 0.0
let mDoubleAsAnInt = Int(myDouble)  //not really type casting

if neighbours[2] is Human {
    print("First Neighbour is a Human")
}

func findNemo(from animals: [Animal]) {
    for animal in animals {
        if animal is Fish {
            print(animal.name)
            let fish = animal as! Fish //Forced downcasting: casting from superclass Animal to one of its subclasses, namely Fish
            fish.breatheUnderWater()
            let animalFish = fish as Animal //Upcast: convert an object of subclass type to the superclass type
            print(animalFish.name)
        }
    }
}

findNemo(from: neighbours)

if let fish = neighbours[0] as? Fish {
    fish.breatheUnderWater()
} else {
    print("Casting has failed")
}


let num: NSNumber = 12
let word: NSString = "abc"


struct FishOne {
    
}

let nemo1 = FishOne()

//let fam: [AnyObject] = [artem, angela, nemo1, num]   //structs are not allowed if AnyObject is used. All basic datatypes are instances of structs

//let neighboursTwo: [NSObject] = [angela, artem, nemo]

let neighbours: [NSObject] = [num, word]
