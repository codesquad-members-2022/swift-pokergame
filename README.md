# iOS - 포커게임 앱

## 1. 게임보드 만들기

### 📌체크 포인트

- [x] 프로젝트 파일 생성
	- [x] `StatusBar` 스타일을 `LightContent` 로 설정
- [x] 생성되어 있는 ViewController의 `self.view` 를 [다운받은 이미지](http://public.codesquad.kr/jk/bg_pattern.png) 의 이미지 패턴으로 지정(이미지 파일은 Assets에 추가)
- [x] [카드 뒷면에 해당하는 이미지](http://public.codesquad.kr/jk/card-back.png) 를 Asset에 추가
- [x] 코드로 7개의 UIImageView를 생성하여 카드 뒷면을 보여주도록 설정 (카드의 크기는 화면 크기를 균등하게 7등분하도록 설정, 가로 세로 비율은 1:1.27)



---

### 💻진행 과정

1. StatusBar style을 `LightContent` 로 설정해주었습니다. 해당 값은 Project Navigstor에서 프로젝트파일에 해당하는 `PockerGameApp.xcodeproj` 파일을 클릭하여 수정할 수 있습니다.

	<img src="https://user-images.githubusercontent.com/92504186/154877362-f89f5265-8921-4fb6-856a-907688f500b3.jpg" alt="SS 2022-02-21 AM 11 06 09" width="70%;" />

2. 프로젝트를 생성하면서 생성된 ViewController 클래스의 viewDidLoad() 에 아래의 코드를 추가했습니다.

	```swift
	self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern") ?? UIImage())
	```

	해당 코드가 적용된 self.view의 모습은 아래와 같습니다.

	<img src="https://user-images.githubusercontent.com/92504186/154877872-344f5d09-4555-492a-8012-29d34179970f.jpg" alt="SS 2022-02-21  11 13 23" width="20%;" />

3. ImageVie를 코드 작성해 생성하다보니, Project Run을 하지 않고는 어떻게 생성되었는지 확인이 힘들어 SwiftUI에서 사용하는 `ViewPreview` 구조체와 `ViewControllerRepresentable` 구조체를 선언해서 사용했습니다.

	```swift
	import SwiftUI
	
	struct ViewControllerRepresentable: UIViewControllerRepresentable {
	    typealias UIViewControllerType = ViewController
	    
	    func makeUIViewController(context: Context) -> ViewController {
	        return ViewController()
	    }
	    
	    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
	    }
	}
	
	@available(iOS 13.0.0, *)
	struct ViewPreview: PreviewProvider {
	    static var previews: some View {
	        ViewControllerRepresentable()
	            .previewLayout(.sizeThatFits)
	            .previewDevice("iPhone 13 Pro")
	    }
	}
	```

	해당 코드를 추가해 빌드시키고, Canvas를 켜면 아래와 같은 화면 구성으로 코드로 추가한 UI Object나 View들을 Preview로 직접 확인할 수 있습니다.

	<img src="https://user-images.githubusercontent.com/92504186/154898068-9537c11c-3e34-412c-894d-369e7944f3be.jpg" alt="SS 2022-02-21 PM 03 02 22" width="80%;" />

4. **card-back** 파일을 다운로드해 Assets에 추가하고, 각각의 카드를 저장할 `cards` 배열을 선언했습니다. 그리고 해당 card들을 card-back 이미지로 초기화하여 self.view에 추가해주는 메서드 `setImageView()` 를 아래와 같이 선언해주었습니다.

	```swift
	// class ViewController: UIViewController
	var cards = [UIImageView](repeating: UIImageView(), count: 7)
	
	func setImageView() {
	    for eachImageViewIndex in 0..<cards.count {
	        let xPosition = CGFloat(5*(1+eachImageViewIndex) + 50*eachImageViewIndex)
	        let currentFrame = CGRect(x: xPosition, y: 47, width: 50, height: 50*1.27)
	        cards[eachImageViewIndex] = UIImageView(frame: currentFrame)
	        cards[eachImageViewIndex].image = UIImage(named: "card-back")
	        self.view.addSubview(cards[eachImageViewIndex])
	    }
	}
	```

	그리고 ViewController 클래스의 `viewDidLoad()` 메서드에서 위의 메서드를 호출해주면 아래와 같은 앱 화면을 확인할 수 있습니다.

	<img src="https://user-images.githubusercontent.com/92504186/154899127-639d9fe3-b87b-4218-b05b-d3473a0963f1.jpg" alt="SS 2022-02-21 PM 03 12 40" width="20%;" />



---

### 📝추가 학습거리

- 생성한 뷰 7개를 StackView 내부에 넣어 균등하게 분할하도록 변경해본다.

	해당 학습거리 진행을 위해 먼저 StackView를 선언해주고 StackView 내부에 cards를 넣어주고 StackView의 프로퍼티를 설정해주는 `setStackView()` 메서드를 선언했습니다.

	```swift
	func setStackView() {
	    let stackView = UIStackView(arrangedSubviews: cards)
	    stackView.translatesAutoresizingMaskIntoConstraints = false
	    stackView.axis = .horizontal
	    stackView.distribution = .fillEqually
	    stackView.alignment = .fill
	    stackView.spacing = 5
	    self.view.addSubview(stackView)
	    stackView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 5).isActive = true
	    stackView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -5).isActive = true
	    stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
	    stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50*1.27).isActive = true
	}
	```

	이번에는 Auto-Layout 방식을 이용해 StackView의 상대적인 위치를 지정해주는 방법을 사용했고, 해당 코드를 추가한 후에 앱의 화면은 아래와 같이, 위에서 만들었던 모양과 일치하다는 것을 확인할 수 있습니다.

	<img src="https://user-images.githubusercontent.com/92504186/154917016-9b523994-39fa-46ce-bf37-68731a1ec11b.jpg" alt="SS 2022-02-21 PM 05 30 18" width="20%;" />

- `Info.plist` 를 변경하는 방식에 대해 학습하고 앱 표시 이름을 변경한다.

	**Info.plist** 파일은 실행 패키지에 관한 필수 설정 정보가 포함된 텍스트 파일입니다. 파일의 최상단을 보면 `Key`, `Type`, `Value` 를 확인할 수 있습니다.

	<img src="https://user-images.githubusercontent.com/92504186/154917315-dae1c288-f722-4a53-af6c-65a6c75332d4.jpg" alt="SS 2022-02-21 PM 05 32 20" width="30%;" />

	여기서 특정 Key의 Value를 수정하려면, Value를 더블클릭하여 수정할 수 있습니다. 

	앱의 표시 이름을 변경하기 위해서는 `Bundle name` 이라는 키의 값을 수정해야 하는데, 해당 키의 값을 **Sol Poker Game** 이라고 수정해보았고, 다음과 같이 앱 이름이 변경됐음을 확인할 수 있었습니다.

	<img src="https://user-images.githubusercontent.com/92504186/154918092-d8b4fd59-5855-4c4f-add1-746e1e3a9f68.jpg" alt="SS 2022-02-21 PM 05 36 58" width="20%;" />



---

### 🤔코드리뷰 후 추가 수정사항

1. 이렇게 다시 ImageView를 생성할 꺼면 위에 속성에 `var cards` 는 초기화할 필요가 없는게 아닐까요?

	cards를 초기화하지 않고 `var cards: [UIImageView]` 처럼 선언만 해주려고 했으나, cards는 클래스의 프로퍼티이므로 init() 메서드로 초기화해주어야 했습니다. 하지만 

	>1. 초기화 단계에서 view.addSubView() 메서드를 사용한다면 문제가 발생할 것이고, 
	>2. init() 에서는 cards 배열에 UIImageView를 넣고 view.addSubView() 메서드를 호출하기 위한 새로운 메서드를 생성하게 된다면 불필요하게 for loop를 두 번 사용하게 될 것

	위의 두 문제를 생각하여, cards를 빈 UIImageView 배열로만 선언해주고 아래와 같이 `setImageView()` 메서드를 수정했습니다.

	```swift
	func setImageView() {
	    guard let cardImage = UIImage(named: "card-back") else {return}
	    let maxNumberOfCards = 7
	    for eachImageViewIndex in 0..<maxNumberOfCards {
	        let xPosition = CGFloat(5*(1+eachImageViewIndex) + 50*eachImageViewIndex)
	        let currentFrame = CGRect(x: xPosition, y: 47, width: 50, height: 50*1.27)
	        let newImageView = UIImageView(frame: currentFrame)
	        newImageView.image = cardImage
	        self.view.addSubview(newImageView)
	        cards.append(UIImageView(frame: currentFrame))
	    }
	}
	```

	

2. 여기서 자주 사용되는 `50`이나 숫자값들을 의미있는 코드로 표현해보세요. 숫자만 보면 이게 어떤 의미인지 알 수 없으니 상수로 선언해서 어떤 의미인지 표현해주는 게 좋습니다.

	50을 `cardWidth`, 50*1.27을 `cardHeight`, 47을 `spacingFromTop` 상수로 선언하여 사용하도록 수정했습니다.



---

---

## 2. 카드 클래스 구현하기

### 📌체크 리스트

- [x] 카드의 숫자, 모양을 프로퍼티로 갖는 `Card` 클래스 생성
	- [x] 카드 정보를 출력하기 위한 문자열을 출력하는 메서드를 포함한다.
- [x] ViewController에서 특정한 카드 객체 인스턴스를 만들어 콘솔에 출력한다.
	- [x] 데이터를 처리하는 코드와 출력하는 코드를 분리한다.
- [x] 앱 아이콘을 추가해본다.



---

### 💻진행 과정

1. 카드의 정보를 프로퍼티로 갖는 Card 클래스를 선언했습니다. 카드의 숫자를 **number** 프로퍼티에, 기호 모양을 **symbol** 프로퍼티에 갖도록 했습니다.

	```swift
	class Card {
	    
	    enum Number: Int {
	        case ace = 1 ,two ,three ,four ,five ,six ,seven , eight, nine, ten, jack, queen, king
	    }
	    
	    enum Symbol: Character {
	        case heart = "❤️"
	        case spade = "♠️"
	        case diamond = "🔷"
	        case club = "♣️"
	    }
	    
	    var number: Number
	    var symbol: Symbol
	    
	    init(number: Number, symbol: Symbol) {
	        self.number = number
	        self.symbol = symbol
	    }
	    
	    func makeDescription() -> String {
	        var numberValue: String
	        switch self.number.rawValue {
	        case 1:
	            numberValue = "A"
	        case 11:
	            numberValue = "J"
	        case 12:
	            numberValue = "Q"
	        case 13:
	            numberValue = "K"
	        default:
	            numberValue = String(number.rawValue)
	            
	        }
	        return "모양: \(symbol.rawValue), 숫자: \(numberValue)"
	    }
	}
	```

	number의 타입에 해당하는 Number을 enum 타입으로 선언했습니다. number가 될 수 있는 케이스가 13가지인데, 해당 케이스 별로 직접 rawValue를 지정해주지 않아도 되며, number가 가질 수 있는 케이스를 제한할 수도 있기 때문에 해당 타입으로 선언했습니다. 

	symbol의 타입에 해당하는 Symbol 또한 enum 타입으로 선언했습니다. Symbol 타입은 케이스 별로 rawValue를 갖는 것 외에는 다른 메서드나 연산 프로퍼티를 가질 필요가 없다고 판단하여, 가장 간단한 타입인 enum 타입으로 선언했습니다.

2. 이전에 공부했던, 앱의 아이콘을 만드는 방법을 다시 공부할 겸 앱의 아이콘을 만들어 추가했습니다. 추가한 앱의 아이콘은 아래와 같이 확인할 수 있습니다.

	<img src="https://user-images.githubusercontent.com/92504186/154935762-971b3380-3fbd-4533-ae73-ee31a9de4d01.jpg" alt="SS 2022-02-21 PM 07 10 21" width="10%;" />

3. ViewController 클래스에 아래의 코드를 추가하여, 임의의 카드 인스턴스를 생성해 출력했습니다.

	```swift
	// class ViewController: UIViewController
	override func viewDidLoad() {
	    ...
	    let newCard = Card(number: .ace, symbol: .spade)
	    printCardDescription(newCard)
	}
	
	func printCardDescription(_ card: Card) {
	    print(card.makeDescription())
	}
	```

	<img src="https://user-images.githubusercontent.com/92504186/154937843-8110c182-7aa3-405c-960e-9145185d063a.jpg" alt="SS 2022-02-21 PM 06 57 34" width="30%;" />



---

### 🤔코드리뷰 후 추가 수정사항

1. description을 처리하는 것을 지원하는 CustomStringConvertible 프로토콜을 학습해보세요

	```swift
	protocol CustomStringConvertible
	```

	> A type with a customized textual representation.
	>
	> 텍스트적인 표현을 커스터마이즈해주는 타입

	해당 프로토콜을 채택하지 않은 구조체를 Print하면 아래와 같이 출력됩니다.

	```swift
	struct Milk {
	    var title: String = ""
	    var amount: Int = 0
	    var type: MilkType = .Choco
	}
	
	print(Milk()) // Prints "Milk(title: "", amount: 0, type: MilkType.Choco)"
	```

	 Milk 구조체가 `CustomStringConvertible` 프로토콜을 채택하여 `description` 프로퍼티를 지정해주면 원하는 형태로 출력할 수 있습니다.

	```swift
	extension Milk: CustomStringConvertible {
	    var description: String {
	        return self.type.rawValue + self.amount + "우유"
	    }
	}
	
	print(Milk(amount: 150)) // Prints "Choco150우유"
	```

	---

	위의 `CustomStringConvertible` 프로토콜을 채택하여 수정한 Card클래스는 아래와 같습니다.

	```swift
	class Card {
	    
	    enum Number: Int, CustomStringConvertible {
	        case ace = 1 ,two ,three ,four ,five ,six ,seven , eight, nine, ten, jack, queen, king
	        
	        var description: String {
	            switch self.rawValue {
	            case 1:
	                return("A")
	            case 11:
	                return("J")
	            case 12:
	                return("Q")
	            case 13:
	                return("K")
	            default:
	                return(String(self.rawValue))
	            }
	        }
	    }
	    
	    enum Symbol: Character, CustomStringConvertible {
	        case heart = "❤️"
	        case spade = "♠️"
	        case diamond = "🔷"
	        case club = "♣️"
	        
	        var description: String {
	            return String(self.rawValue)
	        }
	    }
	    
	    var number: Number
	    var symbol: Symbol
	    
	    init(number: Number, symbol: Symbol) {
	        self.number = number
	        self.symbol = symbol
	    }
	
	}
	
	extension Card: CustomStringConvertible {
	    var description: String {
	        return symbol.description + number.description
	    }
	}
	```

2. self.view.addSubview()로도 추가를 하는데 cards.append()를 다시 하는 이유가 뭘까요? 안해도 상관없지 않을까요?

	처음 생각으로는, 나중에 각각의 카드 UIImageView의 Image 프로퍼티를 수정해주게 될 것이라 생각해서, 모든 UIImageView들을 하나의 배열에 담아놨었습니다. 하지만 self.view에 subView로 이미 추가해놨기 때문에, self.view.subviews 배열을 이용하면 해당 UIImageView에 접근할 수 있게 됩니다. 따라서 cards 배열을 삭제했습니다.



---

---

## 3. 카드덱 구현하고 테스트하기

### 📌체크 리스트

- [x] CardDeck 구조체 구현
	- [x] 접근제어 구문 이용하여 count,shuffle,removeOne,reset 외의 인터페이스는 접근 불가하도록 설정
	- [x] shuffle 기능에는 shuffle 내부 메서드 사용 금지
- [ ] 테스트 시나리오에 맞춰 테스트 구현해보기 (테스트 시나리오: 모든 함수 테스트)



---

### 💻진행 과정

1. 카드덱을 구현하기 위해 구조체 타입을 선택했습니다. 여기서 만드는 타입은 복잡한 기능이 필요하지 않기 때문에 클래스 타입보다 구조체 타입이 더 빠르게 동작할 수 있다고 판단하였습니다.

2. 카드덱의 프로퍼티가 `모든 종류의 카드 객체 인스턴스` 를 포함하도록 하기위해, Card 클래스의 Number, Symbol 열거형이 `CaseIterable` 프로토콜을 채택하도록 했습니다. 해당 프로토콜을 구현하면 아래의 표현으로 열거형의 모든 케이스들로 이루어진 배열을 만들 수 있었습니다.

	```swift
	let allNumberCases = Card.Number.allCases
	```

3. reset 기능을 구현하기 위해 ~~originDeck을 선언했었는데, 인스턴스에 대한 쓸데없는 참조 카운트만 올리는 것으로 판단하여 제거~~ 2중 for문을 사용해서 구현했습니다.

4. shuffle 기능을 구현하기 위해 **Knuth Shuffle** 로직을 이용했습니다.

	문제에 나와있던 **Fisher-Yates shuffle** 보다 시간 복잡도도 낮고, 별도의 list없이 직접 스와핑하는 방식으로 shuffle할 수 있어서 해당 로직을 이용했습니다. 

	한 쪽 끝에서부터 인덱스씩 이동하면서 각 자리에 들어갈 요소를 랜덤하게 뽑아 집어넣는 방법입니다. 랜덤하게 뽑는 방식은, 그 인덱스를 포함해 아직 정하지 않은(해당 인덱스 뒤에 있는 인덱스들) 요소들을 뽑습니다. 한 인덱스씩 진행되면서 기존에 뽑혔던 요소들을 배제할 수도 있기 때문에 더 잘 섞일 수 있습니다.

	해당 로직은 아래와 같이 구현했습니다.

	```swift
	public mutating func shuffle() {
	    let count = self.count
	    
	    for indexToSwap1 in 0..<count-1 {
	        let indexToSwap2 = Int.random(in: indexToSwap1..<count)
	        let tempCard = self.deck[indexToSwap1]
	        self.deck[indexToSwap1] = self.deck[indexToSwap2]
	        self.deck[indexToSwap2] = tempCard
	    }
	}
	```

5. 테스트 파일을 만들기에 앞서, 테스트 과정에서 Card 클래스와 CardDeck 구조체 각각 비교하는 처리가 필수적으로 발생할 것이라 생각하여, Card 클래스와 CardDeck 구조체가 `Equatable` 프로토콜을 채택하도록 했습니다. 이번 내용을 진행하면서 알게된 사실인데, CardDeck는 구조체이기 때문에 해당 구조체 내에 선언된 프로퍼티들이 모두 Equatable을 채택한 타입이라면, 별도의 `==(_:_:)` 메서드 구현이 필요없었습니다. 이는 Struct는 Equatable을 채택하는 것만으로도 `==(_:_:)` 메서드를 자동으로 구현해주기 때문이라고 합니다.

6. 그냥 원래의 `PockerGameApp` 타겟에서는 `import XCTest` 를 선언해주더라도 해당 모듈을 찾을 수 없다는 알림과 함께 테스트 코드에서 사용되는 `XCAssertEqual(_:_:_:)` 등의 메서드들을 사용할 수 없었습니다.

	이를 해결하기 위해 Test Navigator에서 새로운 테스트 타겟을 생성해주었습니다.

	<img src="https://user-images.githubusercontent.com/92504186/155087031-15a8dfc6-4f6c-4b65-8d42-f26353eee0a2.jpg" alt="SS 2022-02-22 PM 04 51 34" width="40%;" />

7. 아래와 같은 테스트 클래스를 작성했습니다. 

	```swift
	import XCTest
	@testable import PockerGameApp
	
	class PockerGameAppTests: XCTestCase {
	
	    func testScenario() throws {
	        
	    }
	
	    func initializeCardDeckTest() {
	        var cardArrayMustBeEqual = [Card]()
	        
	        for numberCase in Card.Number.allCases {
	            for symbolCase in Card.Symbol.allCases {
	                cardArrayMustBeEqual.append(Card(number: numberCase, symbol: symbolCase))
	            }
	        }
	        
	        XCTAssertEqual(CardDeck.init(), CardDeck.init(with: cardArrayMustBeEqual), "초기화된 값이 일치하지 않습니다.")
	    }
	    
	    func shuffleCardDeckTest() {
	        let testCardDeck1 = CardDeck()
	        var testCardDeck2 = CardDeck()
	        
	        testCardDeck2.shuffle()
	        
	        XCTAssertNotEqual(testCardDeck1, testCardDeck2, "셔플되지 않았습니다.")
	    }
	    
	    func removeCardDeckTest() {
	        var testCardDeck = CardDeck()
	        let previousCardsCount = testCardDeck.count
	        print(testCardDeck.removeOne()!)
	        
	        XCTAssertEqual(testCardDeck.count, previousCardsCount - 1, "한 장이 뽑혀 제거되지 않았습니다.")
	    }
	}
	```

	만약 `XCTAssertEqual(_:_:_:)` 의 앞 두개 매개변수의 return 값이 일치하지 않다면 아래와 같은 오류 메세지가 나타납니다.

	<img src="https://user-images.githubusercontent.com/92504186/155088553-b7238952-4094-4627-a2f8-1f0eeb726541.jpg" alt="SS 2022-02-22 PM 12 36 03" width="100%;" />



---

### 🤔코드리뷰 후 추가 수정사항

1. if문에 return하는 코드 한 줄, else문에도 return하는 코드 한 줄인 경우에는 `return 비교식` 형태로 쓰면 깔끔합니다.

	-> 3항 연산자를 사용해 깔끔하게 코드를 정리했습니다.

	```swift
	//before
	//if lhs.number == rhs.number && lhs.symbol == rhs.symbol {
	//    return true
	//} else {
	//    return false
	//}
	
	return lhs.number == rhs.number && lhs.symbol == rhs.symbol ? true : false
	```

2. 한 줄 코드라도 내려쓰는 것을  추천하는 경우도 많습니다. 비교식을 바꾼 것과 {} 스코프 내부를 수정한 것이 한 줄로 표기되면, `diff` 로 표시될 때도 겹쳐서 표기되기 때문입니다.

3. 테스트 함수들은 `test-` 로 시작하는게 규칙입니다. `어떤어떤 것을 테스트해` 정도로 읽으면 됩니다.



---

---

