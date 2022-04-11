import UIKit

var user = Int()
user = 1
var computer = Int.random(in: 0...2)

switch computer {
case 0:
    print("컴퓨터의 선택은 '바위'입니다")
case 1:
    print("컴퓨터의 선택은 '가위'입니다")
case 2:
    print("컴퓨터의 선택은 '보'입니다")
default:
    break
}

switch user {
case 0:
    print("당신의 선택은 '바위'입니다")
case 1:
    print("당신의 선택은 '가위'입니다")
case 2:
    print("당신의 선택은 '보'입니다")
default:
    break
}

if user == 0 {
    if computer == 0 {
        print("무승부입니다")
    } else if computer == 1 {
        print("당신은 이겼습니다")
    } else {
        print("당신은 졌습니다")
    }
} else if user == 1 {
    if computer == 0 {
        print("당신은 졌습니다")
    } else if computer == 1 {
        print("무승부입니다")
    } else {
        print("당신은 이겼습니다")
    }
} else {
    if computer == 0 {
        print("당신은 이겼습니다")
    } else if computer == 1 {
        print("당신은 졌습니다")
    } else {
        print("무승부입니다")
    }
}
