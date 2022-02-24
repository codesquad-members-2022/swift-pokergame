# swift-pokergame
2주차 카드게임 저장소

> 진행상황

- [x] 게임 보드 만들기(2021.02.21 19:26)
- [x] 카드 클래스 구현하기
- [x] 카드덱 구현하고 테스트하기
- [x] 게임로직 구현하기
- [x] 포커게임 화면 만들기
- [ ] 승자 표시하기
- [ ] 마무리하기

​    

## 게임 동작 설명

<img src="https://user-images.githubusercontent.com/68586291/155534039-dc65a1f6-8086-44f9-b906-8589a66ec3e6.gif" alt="image" style="width: 25% !important; align: center !important;"/>

- 앱을 실행하면 ViewController은 맨 처음 포커 게임 객체를 생성한다.
  - 이 때 딜러를 제외한 게임 플레이어의 수와 stud는 화면 상단에 선택된 옵션에 따라 결정된다.

```swift
func setPokerGame(){
  //사용자가 선택한 플레이어 수
  let selectedCount = PokerGame.Count.allCases[playerCountSelectionControl.selectedSegmentIndex]
  //사용자가 선택한 Stud
  let selectedStud = PokerGame.Stud.allCases[studSelectionControl.selectedSegmentIndex]
	
  //포커 게임 객체 생성
  self.pokerGame = PokerGame(numberOfPlayers: selectedCount, stud: selectedStud)
  if let _ = self.pokerGame{
    //게임 실행
    self.pokerGame?.start()
    //카드 이미지 및 사용자 이름 라벨 화면에 보여주기
    setAllImageViewsAndLabels()
  }
}
```

- 생성된 포커 게임 객체는 아래와 같은 프로퍼티를 가지고 있으며, 객체의 생성과 동시에 인스턴스를 할당한다.
  - 전체 52장의 카드 객체를 가지고 있는 카드 덱 객체와, 딜러 및 플레이어 객체 배열 인스턴스를 모두 초기화한다.

```swift
class PokerGame{
  private var randomNames = ["dale","eddy","jee","foucault","sol"]
  private (set) var stud: Stud
  private (set) var deck: CardDeck
  //딜러
  var dealer: Dealer
  //딜러를 제외한 나머지 플레이어 배열
  var players: [Player] = []
  var description: String{
    let value: String = players.reduce(into: "", { $0 += $1.description+"\n"})
    return "\(value)\(dealer)"
  }

  init(numberOfPlayers: Count, stud: Stud){
    self.stud = stud
    self.dealer = Dealer()
    self.deck = CardDeck()
    self.players = createPlayers(numberOfPlayers: numberOfPlayers)
  }
}
```

- 선택된 플레이어 수와 stud에 맞춰 생성된 포커 게임 객체는 플레이어와 딜러 객체를 가지고 있으며, 플레이어와 딜러 객체는 stud 수 만큼의 카드 객체들을 내부에 가지고 있다.

```swift
class Player: CustomStringConvertible{
  var name: String
  //플레이어가 가지고 있는 카드 객체 배열
  fileprivate (set) var cards: [Card] = []
  var description: String{
    return "\(name) \(cards)"
  }

  init(name: String){
    self.name = name
  }

  func addCard(_ card: Card){
    self.cards.append(card)
  }
}
```

- 이후 ViewController은 각 플레이어가 가진 카드 정보에 맞는 이미지 Asset을 가져와 화면에 각 플레이어가 가진 카드 이미지를 순서대로 보여준다.

```swift
func setAllImageViewsAndLabels(){

  guard let game = self.pokerGame else { return }
	
  //기존 이미지 모두 제거
  removePreviousCardImageViewsAndLabels()
	
  //카드 숫자
  let cardsCount = CGFloat(game.stud.rawValue)
  //최초 x좌표
  let initialXPosition = CGFloat(30)
  //카드 이미지 너비
  let cardWidth = (self.view.bounds.width)/(cardsCount+0.6)
  //카드 이미지 높이
  let cardHeight = cardWidth*CGFloat(1.27)
  //카드 x좌표
  var cardXPosition = initialXPosition
  //카드 y좌표
  var cardYPosition = CGFloat(studSelectionControl.center.y * 1.2)
	
  //딜러와 플레이어를 모두 포함한 유저 배열
  var users: [Player] = game.players
  users.append(game.dealer)

  for user in users{
		
    //플레이어 이름 라벨 생성 및 화면에 보여주기
    let label = createUserNameLabel(name: user.name, x: initialXPosition, y: initialXPosition)
    self.view.addSubview(label)
    self.labels.append(label)
    cardYPosition += label.frame.height
		
    //플레이어가 가진 카드 이미지 생성 및 화면에 보여주기
    for card in user.cards{
      guard let image = UIImage(named: "\(card.description)") else { continue }
      let imageView = createCardImageView(image: image, x: cardXPosition, y: cardYPosition, width: cardWidth, height: cardHeight)
      self.view.addSubview(imageView)
      self.cardImageViews.append(imageView)
      cardXPosition += cardWidth - CGFloat(10)
    }
    cardXPosition = initialXPosition
    cardYPosition += cardHeight + CGFloat(10)
  }
}
```
