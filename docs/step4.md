# STEP04. 게임 로직 구현하기

> 2022.02.25

### 요구사항

- [x] 카드덱을 활용해서 게임을 위해 카드를 나눠주는 포커 게임 딜러와 카드를 받는 참가자를 설계하고, 각 역할을 담당하는 클래스 구현한다.
- [x] 카드 게임 규칙과 참가자 수에 따라서 각기 다른 방식으로 카드를 뽑아 전달한다
- [x] 딜러와 참가자를 포함하는 PokerGame 객체를 작성한다
  - struct냐 class냐 스스로 판단해서 결정한다
- [x] PokerGame 동작을 확인하기 위해 XCTest 단위 테스트를 구현한다

### 프로그래밍 요구 사항

- [ ] 포커 딜러가 나눠줄 수 있는 게임 방식을 선택할 수 있다 (?) => 게임방식을 변경할 수 있다는건가
- [x] 게임은 7카드-스터드 방식과 5카드-스터드를 지원한다
- [x] 참가자는 딜러를 제외하고 1명에서 4명까지 참여할 수 있다
- [x] 인원이 결정되면 랜덤하게 이름을 생성한다
  - 딜러는 이름이 없고, 참가자는 영문 2~5글자 이내 이름을 가진다 (crong, honux, jk 등)
- [x] 카드게임 종류와 참가자수에 따라 적절하게 동작을 해야한다
- [x] 딜러가 딜러 자신을 포함해서 참여자에게 카드를 나눠주고도, 전체 카드가 남은 경우는 계속해서 게임을 진행한다
- [x] 한 번 나눠준 카드는 다시 덱에 넣지 않고 카드가 부족할 경우 종료한다
- [x] 테스트 코드에서 PokerGame 메소드를 호출해서 동작을 확인한다

<br/>
<br/>

### 과정

1. PokerGame, Dealer, Player 클래스 생성, 초기화 함수 작성
2. Dealer 의 카드 분배 로직 테스트 작성
3. 카드 분배 로직 구현 → 테스트 실행하여 정상적으로 동작하는지 확인
4. 프로젝트에 Unit Test를 타겟으로 추가
5. XCTest 를 사용해 카드 분배 로직 테스트
6. 게임참여자 객체를 생성하는 Factory 구현과 테스트
7. Player 를 상속하는 Guest, Dealer 하위 모듈로 수정
   - 게임 참가자는 공통적으로 이름, 카드 배열을 값으로 가진다
   - 카드를 분배받을 수 있다
8. 게임 실행(run) 로직 구현 및 테스트
9. 전체코드 리펙토링

<br/>

## 객체의 역할, 책임, 협력

|                    | 역할                                         | 책임                                                                                                                                      | 협력                                                                  |
| ------------------ | -------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| PokerGame          | 게임을 준비하고 실행                         | ▫️게임에 필요한 객체를 생성하고 초기화한다. ▫️게임 실행전 준비한다.▫️게임을 실행한다. ▫️화면에 출력할 데이터를 반환한다.                  | ▫️Dealer 에게 게임 준비를 지시한다.▫️Dealr 에게 게임 실행을 지시한다. |
| Player             | 게임을 하는 플레이어                         | ▫️카드를 받아 가질 수 있다. ▫️화면에 출력할 이름과 카드배열을 반환                                                                        |                                                                       |
| Dealer: Player     | 게임을 진행하면서 게임에 참여(플레이어 상속) | ▫️게임 시작전에 카드를 섞고 Player에게 분배 ▫️게임이 시작하면 CardDeck 에서 카드를 한장씩 빼서 Player에게 나누어 줌 ▫️CardDeck 을 가진다. | ▫️Team 에게 덱에서 뺀 카드를 준다                                     |
| ParticipantFactory | 게임에 참가하는 객체생성                     | ▫️Guest 를 생성하고 반환 ▫️Dealer 를 생성하고 반환                                                                                        |                                                                       |
| Team               | 게임에 참여하는 모든 플레이어                | ▫️player 들을 인자로 받아 초기화 ▫️화면에 출력할 모든 플레이어의 데이터를 반환                                                            | ▫️Dealer로 부터 받은 카드를 모든 Player에게 나눠 준다                 |
| Card               | 게임에 사용하는 카드                         | ▫️한정된 값을 인자로 받아 카드 생성                                                                                                       |                                                                       |
| CardDeck           | 카드 뭉치                                    | ▫️카드 뭉치의 갯수를 반환 ▫️카드 뭉치에서 한개를 삭제하고 반환 ▫️카드 뭉치를 원래 갯수로 복원 ▫️카드를 섞는다                             | ▫️Card 에게 모든 카드 배열을 달라고 요청                              |

<br/>

## 로직에 대한 설명

### 초기화

PokerGame 은 게임을 준비하고 실행하는 역할을 한다.

게임 방식과 딜러를 제외한 방문자 수를 인자로 받아 초기화 한다:

```swift
let game = PokerGame(stud: .seven, guestCount: .four)
game.prepare()
game.run { isEnd in
    if !isEnd {
        return
    }
}
```

PokerGame 클래스의 초기화는 다음과 같다:

```swift
// class PokerGame
init(stud: Stud, guestCount: GuestCount) {
  let dealer = ParticipantFactory.generateDealer(stud: stud)
  self.gameDealer = dealer
  self.team = Team(guestCount: guestCount, dealer: dealer)
}
```

Dealer 를 Factory 를 통해 생성한다. 모든 참여자의 배열을 관리할 Team 도 객체를 생성해 초기화 한다.

### 게임 준비:

PokerGame 이 Dealer 에게 게임 준비를 지시한다.

Dealer 는 카드를 섞고 게임 방식에 맞게 카드를 분배한다.

```swift
// class PokerGame
func prepare() {
    gameDealer.prepare(with: self.team)
}

// class Dealer:Player
func prepare(with team: Team) {
    cardDeck.shuffle()
    distributeCard(to: team)
}
```

딜러는 모든 참여자인 Team 에게 카드를 분배한다.

Team 에서 모든 플레이어 배열을 순회하며 카드를 분배하기 위해, 클로저를 인자로 사용했다. `loop(act: (Player) -> Void)`

```swift
// class Dealer
func distributeCard(to team: Team) {
    team.loop { player in
        var removedCards = [Card]()
        for _ in 0..<stud.rawValue {
            guard let card = cardDeck.removeOne() else {
                continue
            }
            removedCards.append(card)
        }
        player.handOver(cards: removedCards)
    }
}

// class Team
func loop(act: (Player) -> Void) {
    for player in players {
        act(player)
    }
}
```

### 게임 실행(시작):

1. 게임 딜러가 카드를 모든 플레이어에게 한장씩 나눠준다
2. 만약, 게임딜러의 덱에 카드가 없다면(나눠줄 카드가 없다) ⇒ 게임 종료
3. 게임딜러의 덱에 카드가 남아 있다면 ⇒ 계속해서 게임 실행

게임을 진행하는 주체는 Dealer 이므로, Dealer 에게 게임을 시작하라고 메시지를 보낸다.

```swift
// class PokerGame
func run(handler: (Bool) -> Void) {
    gameDealer.start(with: team) { isOutOfCard in
        if isOutOfCard {
            isEnd = true
            handler(true)
        }
    }
}
```

게임 시작을 요청받은 딜러는, 소지하고 있는 카드덱이 빌때까지 Team에게 카드를 분배한다.

만약 카드덱에서 카드가 다 떨어졌다면, `outOfCard` 클로저를 호출한다.

```swift
// class Dealer
func start(with team: Team, outOfCard: (Bool) -> Void) {
    while (cardDeck.count() != 0) {
        team.loop { player in
            guard let card = cardDeck.removeOne() else {
                return
            }
            player.handOver(cards: [card])
        }
    }
    outOfCard(true)
}
```

### 게임 종료:

Dealer 의 start 메서드에서 인자로 받은 클로저 `outOfCard` 를 호출하면, GamePoker 클래스에서 이벤트를 받는다.

run 메서드도 실행이 종료했음을 클로저 `handler` 를 통해 알려준다.

```swift
// class GamePoker
func run(handler: (Bool) -> Void) {
    gameDealer.start(with: team) { isOutOfCard in
        if isOutOfCard {
            isEnd = true
            handler(true)
        }
    }
}
```

<br/>

## 배경 지식 학습

### Unit test

```swift
// 1.
override func setUpWithError() throws {
        self.pokerGame = PokerGame(stud: .five, participantCount: .four)
    }
// 2.
override func setUp() {
    super.setUp()
}

// 3.
override func tearDown() {
    super.tearDown()
    self.pokerGame = nil
}
// 4.
override func tearDownWithError() throws {

}
```

- 1~4 순서로 실행된다.
- setUpWithError 가 에러를 던질 수 있게 되어 `do-catch`, `try?` 말고 `try` 만 사용하도록 도와준다
  1. 에러 발생시, 테스트가 스킵된다. `Test skipped`
  2. tearDownWithError 호출
