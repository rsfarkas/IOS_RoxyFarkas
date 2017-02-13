//: Playground - noun: a place where people can play


import Cocoa

var str = "Hello, playground"


var hello = "Hello"; var playground = "playground";

for i in 0..<64{
    var point = sin(Double(i) * 100)
}

print(str)

print(hello,playground)

print(hello, playground, separator: "_", terminator:"")

print("\(hello) viewer!")

func printLiteralExpressions(){
    print("Function: \(#function)")
    print("File: \(#file)")
    print("Line: \(#line)")
    print("Column:\(#column)")
}

printLiteralExpressions()

//MARK

//TODO 

//FIXME

/* multi
 line 
 comment */

//:Single line delimiter 
/* Text on this line not displayed
 
 ## Header 2
 ### Header 3
 
 > Block note
 
 * Milk
 * Bananas
 * Bread
 
 1. **Learn Swift**
 2. Develop an _awesome_ app
 3. Retire
 
 ____
 
 */


///Quick help comment

