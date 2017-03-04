//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class SoundManager {
    static let instance = SoundManager()
    
    let soundType = "wav"
}


SoundManager.instance.soundType

// Class
// a class defines a bunch of properties and behavior (i.e variables and functions)
// an instance is a member of that class: example Tree is a class THIS Tree in front of me is an instance.

// instance variables you call on an instance
// class/static variables you call on the class itself


// meta class object
// a given class is an instance of that meta class object

// a singleton is a design pattern in which an object has only one instance, and you can access that instance as a class or static variable.


class SaltShaker {
    
    var howMuchSalt = 100
    
    init(saltAmount: Int = 100) {
        self.howMuchSalt = saltAmount
    }
    
    let whatsInHere = "Salt"
    func shake() {
        print("shake shake shake")
        howMuchSalt -= 1
        print("Left: \(howMuchSalt)")
    }
    
}


let marbleSaltShaker = SaltShaker(saltAmount: 500)
marbleSaltShaker.shake()
marbleSaltShaker.shake()
marbleSaltShaker.shake()

let otherSaltShaker = SaltShaker()

