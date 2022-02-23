# swift-pokergame
2주차 카드게임 저장소

​    

## 0. 진행 상황

- [x] 게임 보드 만들기(2021.02.21 19:26)
- [x] 카드 클래스 구현하기
- [x] 카드덱 구현하고 테스트하기
- [x] 게임로직 구현하기
- [ ] 포커게임 화면 만들기
- [ ] 승자 표시하기
- [ ] 마무리하기

​    

## 1. 게임 보드 만들기

<img src="https://user-images.githubusercontent.com/68586291/154936556-77ae248d-a2d4-4dc8-a136-460f1777963f.png" alt="image" style="width:25%; align:center;"/>

- 백그라운드 패턴으로 사용할 이미지 Asset 추가 후, __`backgroundColor`__ 속성으로 지정

```swift
func setBackgroundColor(){
  if let patternImage = UIImage(named: "bg_pattern"){
    self.view.backgroundColor = UIColor.init(patternImage: patternImage)
  }
}
```

- 이후 카드 이미지 Asset추가 후, UIImageView를 7개 만들어서 일정 간격으로 정렬
  - 카드 간격은 우선 CGFloat(10)으로, 카드의 Y좌표는 CGFloat(80)으로 하드코딩했음
  - 카드의 너비와 높이의 비를 1:1.27로 맞추기 위해 카드 너비를 정하고, 높이는 너비의 1.27배가 되도록 설정
  - 반복문을 7번 돌면서 UIImageView를 만든 후, 카드 간격 값을 누적하면서 X좌표값을 구해서 화면에 SubView로 추가함

```swift
func setInitialImageView(_ cardsCount: CGFloat){
  guard let image = UIImage(named: "card-back") else{ return }

  let cardMargin = CGFloat(10)
  let cardWidth = (self.view.bounds.width - cardMargin*(cardsCount+1))/cardsCount
  let cardHeight = cardWidth*CGFloat(1.27)
  var cardXPosition = cardMargin
  let cardYPosition = CGFloat(80)

  for _ in 0..<Int(cardsCount){
    let imageView: UIImageView = UIImageView(frame: CGRect(x: cardXPosition, y: cardYPosition, width: cardWidth, height: cardHeight))
    imageView.image = image
    imageView.contentMode = .scaleAspectFit
    self.view.addSubview(imageView)
    cardXPosition += cardMargin+cardWidth
  }

}
```

​    

## 2. 카드 클래스 구현하기

- 카드의 모양은 CardSuit이라는 열거형으로 아래와 같은 구조로 구현

```swift
enum CardSuit: String, CaseIterable{
  case clover 
  case diamond 
  case club 
  case heart 
  case invalid 
}
```

- 카드 숫자는 내부에 숫자값과 출력을 위한 문자열을 각각 프로퍼티로 가진 구조체로 구현
  - 각 숫자에 따라 description값이 달라지게 됨

```swift
struct CardNumber: CustomStringConvertible{
  var number: Int
  var description: String

  init(_ number: Int){}
}
```

- 마지막으로 CardSuit 타입과 CardNumber 타입의 변수를 각각 프로퍼티로 가지는 Card 클래스를 구현

```swift
class Card: CustomStringConvertible{

  var suit: CardSuit
  var number: CardNumber
  var description: String

  init(_ cardSuitindex: Int, _ cardNumber: Int){}
}
```

​    

## 3. 카드 덱 구현하고 테스트하기

- CardDeck 구조체는 내부에 카드 배열인 deck과 배열의 크기(카드의 개수)에 해당하는 count를 프로퍼티로 가짐
- 요구조건에 따라 외부에서는 count만 읽도록 해야 하므로 deck은 get,set 모두 private로 선언했으며, count는 set만 private로 선언

```swift
private var deck: [Card] = []
private (set) var count: Int = 0
```

- reset()은 전체 카드 52장을 순차적으로 배열에 넣는 동작을 실행

```swift
mutating func reset(){
  self.deck = []
  for suit in Card.Suit.allCases{
    for number in Card.Number.allCases{
      guard let card = Card(suit: suit, number: number) else{ continue }
      self.deck.append(card)
    }
  }
  self.count = self.deck.count
}
```

- shuffle()은 Knuth Shuffle방식을 적용하여 배열 내의 각 카드의 순서를 무작위로 섞어줌

```swift
mutating func shuffle(){
  for i in 0..<deck.count-1{
    let randomIndex = Int.random(in: i..<deck.count)
    let temp = deck[i]
    deck[i] = deck[randomIndex]
    deck[randomIndex] = temp
  }
}
```

- removeOne()은 카드를 덱에서 한 장씩 뽑기 위해, 배열의 맨 마지막 요소부터 제거하는 동작을 수행
  - 배열의 처음부터 제거하면 나머지 요소의 인덱스를 재조정해야 하므로 성능상 더 비효율적임

```swift
mutating func removeOne()-> Card{
  count -= 1
  return deck.removeLast()
}
```

- ViewController에 카드 덱의 생성 및 섞는 과정을 테스트하기 위한 메소드 추가

```swift
  func testCardDeckCreation(){
  var deck: CardDeck = CardDeck()
  let commands: [String] =["reset","shuffle","remove","remove","shuffle","reset","remove","shuffle","remove","exit"]
  for command in commands{
    print(command)
    switch command{
      case "reset":
      deck.reset()
      print("카드 전체를 초기화했습니다.\n총 \(deck.count)장의 카드가 있습니다.")
      case "shuffle":
      deck.shuffle()
      print("전체 \(deck.count)장의 카드를 섞었습니다.")
      case "remove":
      print("\(deck.removeOne())\n총 \(deck.count)장의 카드가 남아있습니다.")
      default:
      print("테스트 종료")
      break
    }
  }
}
```

​    

## 4. 게임 로직 만들기

- PockerGame 클래스 내부에 Player, Dealer 내부 클래스 타입 선언
- PockerGame 클래스 생성자에서 Player 배열과 Dealer 인스턴스를 각각 생성해서 프로퍼티에 할당한 후 게임 실행 준비 마침
- 게임 실행은 start() 함수를 호출하며, 카드 덱을 섞은 후 run() 메소드 호출
- run() 메소드는 딜러에게 플레이어에게 배분할 모든 카드를 일단 부여한 후, distributeCards() 메소드를 호출하여 딜러가 다시 플레이어들에게 카드를 1장씩 배분하는 식으로 동작

```swift
func start(){
  deck.shuffle()
  run()
}

private func run(){
  if(deck.count >= (players.count + 1) * stud.rawValue){
    for _ in 0..<(players.count + 1) * stud.rawValue{
      guard let card = deck.removeOne() else { continue }
      dealer.getCard(card)
    }
    distributeCards()
  }
}

private func distributeCards(){
  for _ in 0..<stud.rawValue{
    for index in 0..<players.count{
      guard let card = dealer.handOutCard(stud: stud.rawValue) else { continue }
      players[index].getCard(card)
    }
  }
}
```

- PockerGame, CardDeck 각각의 클래스에 대한 단위 테스트 메소드 작성



