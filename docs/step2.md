# STEP01. 게임보드 만들기

> 2022.02.22

### 요구사항

- [x] 카드 데이터를 추상화해서 클래스로 구현하고 단계별로 다양한 상황에 확장해서 사용한다.
- [ ] 클래스 이름, 변수 이름, 함수 이름에서 자신만의 규칙을 만든다.
- [x] 임의의 카드 객체 인스턴스를 하나 만들어서 출력한다.

<br/>
<br/>

### 과정

1. Card struct 생성
2. 두가지의 속성(property) 를 가지도록 함
   1. 모양(suit): nested enum 으로 설계. 4가지의 한정된 값을 지님
   2. 숫자(number): 초기화시 Int 를 인자로 받음

```swift
struct Card {
  let suit: Suit
  let number: Int

	// nested enum
  enum Suit: String {
      case spade = "♠️"
      case heart = "♥️"
      case diamond = "♦️"
      case club = "♣️"
  }

	// 객체 내부에서 데이터 처리
  private func numberToString() -> String {
      switch self.number {
      case 1:
          return "A"
      case 2...10:
          return String(number)
      case 11:
          return "J"
      case 12:
          return "Q"
      case 13:
          return "K"
      default:
          fatalError("Card:: Fail numberToString()")
      }
  }

	// view 에서 출력을 위해 만든 공개된 인터페이스
  func convertedString() -> String {
      return self.suit.rawValue + self.numberToString()
  }
}
```

### 실행화면

```swift
// ViewController
let heat12 = Card(suit: .heart, number: 12)
print(heat12.convertedString())

let spade7 = Card(suit: .spade, number: 7)
print(spade7.convertedString())
```

```swift
♥️Q
♠️7
```
