import Foundation
import Darwin

// 열거형은 파일의 최상단에 있으면 가독성이 높습니다 :)
enum Coffee {
    case americano
    case latte
    case cappuccino
    
    var price: Int {
        switch self {
        case .americano:
            return 5000
        case .latte:
            return 5500
        case .cappuccino:
            return 5500
        }
        
    }
}

struct CoffeeShop {
    var totalRevenue: Int
    var menu: [Coffee: Int] = [.americano: 5000, .latte: 5500, .cappuccino: 5500]
    var barista: Person
    var pickUpTable: String? {
        didSet {
            if let pickUpTable = pickUpTable {
                print("\(pickUpTable)가 준비되었습니다. 픽업대에서 가져가주세요.")
            }
        }
    }

    mutating func takeOrder(coffee: Coffee, person: Person) {
        // 커피 주문 후 결제가 가능한지 확인하기 때문에, 주문한 커피를 말하고자 한다면 여기가 적당해보여요!
        print("\(coffee) 주세요")
        
        if person.money < coffee.price {
            print("잔액이 \(coffee.price - person.money)만큼 부족합니다.")
        } else {
            // 이 곳에서 가격만 넘겨줍니다.
            person.order(price: coffee.price)
            totalRevenue += coffee.price
            
            // 단순한 print더라도 언제 coffee를 주문 받았는지도 순서를 생각해보면 좋아요! 더 나아가면 함수 호출의 순서로 언제든 생각해볼 수 있습니다 :)
            print("네 \(coffee) 주문 받았습니다.")
            takeOutCoffee(coffee: coffee)
        }
    }
    
    mutating func takeOutCoffee(coffee: Coffee) {
        pickUpTable = String("\(coffee)")
    }
}
class Person {
    var name: String
    var age: Int
    var money: Int
    
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }
    // juho님 기존 코드
//    func order(coffee: Coffee) {
//        print("\(coffee) 주세요")
//    }
    
    // 매개변수를 현재는 Coffee 타입을 받고 있는데요.
    // 재사용 가능한 함수를 위해, 가격만 받으려면 Int 로 바꿔주면 좋을 것 같아요.
    func order(price: Int) {
        self.money -= price
    }
}

var misterKim = Person(name: "misterKim", age: 30, money: 10000)
var missLee = Person(name: "missLee", age: 27, money: 10000)
var yagomBucks = CoffeeShop(totalRevenue: 0, barista: misterKim)

yagomBucks.takeOrder(coffee: Coffee.latte, person: missLee)
