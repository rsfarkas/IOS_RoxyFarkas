//: Playground - noun: a place where people can play
//frameworks are collections,libraries, of code. Logically organized.

import Cocoa

var str = "Hello, playground"

//Primative Value Types Pre-OOP
//Int, Floats, BOOL, String "type of value"
//Int Interger, FLoat 1.0, BOOl True/False 0/1

//let x: Int = 10 //keyword 'let', reserved word.
//var y: Int = 20

//let z = 10 //create a value, name "z"

//let highScore = 100 // create a value, name "z", = "assignment operator"

//infered by CPU.

//let playerScore: Int = 10 //explicity typed
//":" of Type 

//highScore

//let x: Float = 100.0
//let y = 100
//let a: Float = 115.5


//var z = x + y //change the value

//z = x + x + x + y
//cant mix types. must make x a float
//var z = x + a

//let a = true
//
//let myName = "Yury" //strings must be in ""
//
//
//let firstName = "roxy"
//let lastName = "farkas"
//
//let fullName = firstName + " " + lastName
//fullName

//Operator: operations on variables

//let x = (6 + (()6 * (100 * 0.678)) + 32 - 9)

//Control flow. C is a procedural language meaning it goes top to bottom.

//Control flow and "logic"

//if(){
    //evaluates inside(), if true perform action. If false, jumps over action.
    //}
//
//let x = 10
//let y = 100
//
//if (x < y){
//    print("Hello World")
//}


//Comparison operators
//==, <,>,>=,<=, !=

//if(x==y || a<b){
//    print("hello world")
//}
//

//exhaustive if statement, it will always do one of those two things 
//not all if statements are exhaustive

//variables hold data
//functions do something

//let phrase: String
//
//function myFunctionName(firstString: String, secondString:String){
//    var x = firstString + secondString
//}

//you need the arrow to return, and tell it the type

func myFunctionName()->String{
    return "hello world"
}

var x = myFunctionName()

