//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Animal {
    func eat(){
        print("nom nom nom")
    }
    var eyes = UIColor.green
}

//zebra is inheriting animal
//super class is animal to zebra
class Zebra: Animal {
    override func eat(){
     super.eat()
     print("zebra food")
    }



}


let foo: Int = nil ?? 0


//now harry is a new animal. () near class initialize the class.
let harry = Animal()

let sam = Zebra()

sam.eyes = UIColor.black
//function in a class is a method 

sam.eat()
harry.eat()

