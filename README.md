# 포커게임 Ebony

----

## 게임보드 만들기.

### 구현과정
1. UIStatusBar lightContent로 변경.
2. view 패턴이미지 설정.
3. 카드뷰 한장 화면에 추가해보기.
4. 카드뷰 크기 확인 및 비율 설정.
5. 카드뷰 간 간격 계산해서 반복문으로 추가하기.

### 기능 요구 사항
> [x] 앱 기본 설정을 지정해서 StatusBar 스타일을 LightContent로 보이도록 한다.
>
> [x] ViewController 클래스에서 self.view 배경을 다음 이미지 패턴으로 지정한다. 
> 
> [x] ViewController 클래스에서 코드로 7개 UIImageView를 생성하고, 추가해서 카드 뒷면을 보여준다
>
> [x] 화면 크기를 구하고 균등하게 7등분해서 이미지를 표시해야 한다
> 
> [x] 카드 가로와 세로 비율은 1:1.27로 지정한다
> 

### 실행화면
<img width="281" alt="스크린샷 2022-02-21 오후 2 22 46" src="https://user-images.githubusercontent.com/62687919/154894266-6d3dc726-90f3-4afd-88f1-988e4a80547c.png">


### 공부내용
1. UIStatusBar에는 default, darkContent, lightContent가 있으며 이는 상단의 배터리잔량표시 등 상태 텍스트색을 변경합니다.
2. view.backgroundColor를 통해 pattern을 지정할 수 있으며 이는 이미지를 사용할 수 있습니다.
3. UIView가 생성될때 인자값으로 입력받는 CGRect를 통하여 view의 좌표값 및 크기 설정이 가능합니다.

### 추가학습거리
- 앱 기본 설정(Info.plist)을 변경하는 방식에 대해 학습하고 앱 표시 이름을 변경한다

<img width="70" alt="스크린샷 2022-02-21 오전 11 19 56" src="https://user-images.githubusercontent.com/62687919/154878469-c6e46dd8-c1cb-4ee3-8234-f4cfcb58544b.png">

<img width="497" alt="스크린샷 2022-02-21 오전 11 20 10" src="https://user-images.githubusercontent.com/62687919/154878487-fad5946e-2f33-4338-afec-9eb73d4bb3fe.png">


----

## 카드 클래스 구현하기.

### 구현과정

1. PockerCard struct 구현

### 기능 요구 사항
> [x] 카드 데이터를 추상화해서 클래스로 구현하고 단계별로 다양한 상황에 확장해서 사용한다.
>
> [x] 클래스 이름, 변수 이름, 함수 이름에서 자신만의 규칙을 만든다.
>
> [x] 임의의 카드 객체 인스턴스를 하나 만들어서 출력한다.
> 

### 실행화면
<img width="74" alt="스크린샷 2022-02-22 오전 11 31 32" src="https://user-images.githubusercontent.com/62687919/155052291-30a3f57c-bf82-42ef-ad37-d025e00fc635.png">

### 공부내용
1. Nested Enum
- 중첩 타입에 대해 공부하였습니다. 해당 타입 외에 다른곳에서 enum을 사용하지 않는다면 이 방법을 채택하는듯 합니다.

2. breakpoint
- 결과값 확인을 위해 breakpoint를 사용하였습니다.
- 어떠한 결과값을 보기보다, 에러가 났을 때 혹은 값이 잘 전달, 가공 되고 있는 지 확인할 때 쓰면 매우 좋을 것 같습니다.

### 고민한 내용
- 앞으로 해당 카드클래스를 어떤식으로 사용할 지에 대해 고민하였습니다.
1. 카드를 나눠줄 때 : 각각의 카드들은 중복이 되면 안된다. - 다음 스텝의 shuffle알고리즘을 사용한다.
2. 해당 카드값을 판별하여 점수를 확인해야 하고, 이를 통해 승자를 정해야 한다.


----

## 카드덱 구현하고 테스트하기.

### 구현과정

1. PockerCard struct 구현

### 기능 요구 사항
> [x] count 갖고 있는 카드 개수를 반환한다.
>
> [x] shuffle 기능은 전체 카드를 랜덤하게 섞는다.
>
> [x] removeOne 기능은 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
>
> [x] reset 처음처럼 모든 카드를 다시 채워넣는다.
> 

### 공부내용

1. Shuffle
- 카드를 섞는 알고리즘 Fisher-Yates를 사용하였습니다.
```swift
    for i in 0 ..< cardDeckArray.count - 1 { // 0 ~ n-2
        let randomIndex = Int.random(in: i ..< cardDeckArray.count)
        let temp = cardDeckArray[i]
        cardDeckArray[i] = cardDeckArray[randomIndex]
        cardDeckArray[randomIndex] = temp
    }
```

2. XCTest
- 결과값을 테스트하기 위해 XCTest를 생성하였습니다.
```swift
    func testExample() throws {
        XCTAssertEqual((1+1), 2)
    }
```
- XCTAssertEqual : 결과값과 비교값이 일치하는지 테스트해주는 함수입니다.

```swift
    func testShuffle() throws{
        let deckCards = cardDeck.cardDeckArray
        cardDeck.shuffle()
        let duplicated = zip(cardDeck.cardDeckArray, deckCards).enumerated().filter() {
            $1.0.number == $1.1.number && $1.0.shape == $1.1.shape
        }
        let duplicatedCount = duplicated.map{$0.offset}.count
        XCTAssertTrue(deckCards.count > duplicatedCount)
    }
```
- XCTAssertTrue : 결과값의 범위가 일치하는지 테스트해주는 함수입니다.

### 고민한 내용
- XCTest를 사용하지 않고 테스트코드를 어떻게 작성할 수 있을까 고민해보았습니다.
- protocol을 생성하고 extension으로 test관련 메소드들을 모아 구현하였습니다.


----

## 게임로직 구현하기.

### 구현과정

- 설계하기.

    1. player, Dealer, Pockergame객체에 어떤 변수가 필요하고, 어떤 역할을 할지 고민하기.
    2. Dealer와 Player의 차이 = 이름의 유무, 카드를 나눠주는 역할의 유무.
    3. Dealer: Player로 구현하기.
    4. PockerGame의 역할과 Dealer, Player의 역할관계를 설계하고 개발하기.
    5. 테스트코드 작성.
    
### 기능 요구 사항
> [x] 포커 딜러가 나눠줄 수 있는 게임 방식을 선택할 수 있다
>
> [x] 게임은 7카드-스터드 방식과 5카드-스터드를 지원한다
>
> [x] 참가자는 딜러를 제외하고 1명에서 4명까지 참여할 수 있다
>
> [x] 딜러는 이름이 없고, 참가자는 영문 2~5글자 이내 이름을 가진다 (crong, honux, jk 등)
>
> [x] 카드게임 종류와 참가자수에 따라 적절하게 동작을 해야한다
>
> [x] 딜러가 딜러 자신을 포함해서 참여자에게 카드를 나눠주고도, 전체 카드가 남은 경우는 계속해서 게임을 진행한다
>
> [x] 한 번 나눠준 카드는 다시 덱에 넣지 않고 카드가 부족할 경우 종료한다
>
> [x] XCTest를 위한 테스트 타깃을 추가한다

### 실행화면

<img width="476" alt="스크린샷 2022-02-24 오후 3 51 58" src="https://user-images.githubusercontent.com/62687919/155473214-7de7ced6-6bba-4ea5-977e-147563863474.png">

### 공부내용

1. XCTest
- Test하고자 하는 메소드의 이름은 반드시 test로 시작해야 합니다.

2. Result<PockerCard, CardDeckError>
- Deck이 비었을 경우 CardDeckError의 cardDeckEmpty를 반환하고, 게임종료 메시지를 출력하였습니다.

### 고민한 내용
- 각 객체의 속성들을 private으로 설정하였습니다. 
- 외부 클래스에서 해당 객체들의 변수들을 알 수 없어 테스트등을 할 수 없었습니다.
- 각 객체들 내부에서 변수들을 테스트하는 메소드를 작성한 뒤 외부클래스에서 이를 테스트하게 하였습니다.
