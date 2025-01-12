//: [Previous](@previous)

import Foundation

// variables // name given to a memory location

// variables are declared with var
// constants are declared with let

let name = "Adams"
var age = 20

// if we try and change name u'll get an error

//name = "Jeff" // cannot assign to value name is a constant
age = 25

print("Your name is: \(name) and your age is: \(age)")
// We can declare variables either implicitly or explicitly
// implicitly; Compiler determines the data type of the variable based on the assigned value.
// Explicitly; we specify the data type after the variable name.

var object = "Chair" // implicitly
var randomObject: String = "Table" // Explicitly
 
// Embedding variables within a String; String interpolation
let theResult = "This sittingRoom has an \(object)"
print(theResult)

// Basic Data Types
// Strings
var randstring: String = "this is a String"
// Integers
var randInt: Int = 1
// Float
var randFloat: Float = 0.2
// Double
var randDouble: Double = 0.5
// Bool
var isBoolean: Bool = true
// character
var letter: Character = "A"

// Function that returns Total Income and Total Expenses
func getBudget(_ income: Int, _ expenses: Int) -> Int {
    return income - expenses
}
getBudget(100000, 200)

//: [Next](@next)
