import UIKit

var computer = Int.random(in: 1...10)
var user = Int()
user = 7

if computer == user {
    print("Bingo!")
} else if computer > user {
    print("Up!")
} else {
    print("Down")
}
