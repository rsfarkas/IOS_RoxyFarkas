//: Playground - noun: a place where people can play

import UIKit


let playerCategory:UInt32 = 0b1
let enemyCategory: UInt32 = 0b1 << 1
let itemCategory: UInt32 = 0b1 << 2
let laserCategory:UInt32 = 0b1 << 3

let playerMask:UInt32 = enemyCategory | itemCategory

let bits1 = 0b001
let bits2 = 0b0011
let bits3 = bits1 | bits2

//or operator takes two different binary values and starts in left column. if either value is a 1, it takes a 1 in that slot. so the new number becomes 0b0011. This operator is not addition. 