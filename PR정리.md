## 2022.02.22 Step3

## 작업목록

- [x] 포커게임 타입 정의
- [x] 플레이어, 딜러 클래스 생성
- [x] 포커게임 클래스 생성
- [x] 카드 배분 함수 제작 
- [x] XCTest 코드 작성
  - [x] 전체 카드를 뽑았을때 중복없이 잘 뽑히는지
  - [x] 카드 배분 후 포커플레이 타입에 따라 카드가 맞게 배분 되었는지
- [x] 포커게임 화면 만들기
  - [x] 한명의 플레이어의 카드를 보여줄 view 제작
  - [x] 위에서 만든 view를 5개 출력
  - [x] 카드 이미지 설정
- [x] 포커게임 상단 옵션 View 만들기
- [x] 옵션 View 버튼 연결

## 학습키워드

* 단위테스트, MVC, 비지니스로직

## 고민과해결

* delegate의 남발
  * OptionView(상단 메뉴 View)를 제작할 때 해당 뷰에서도 delegate를 통해 처리하도록 구현
    * OptionView의 delegate는 비지니스 로직이 받아서 처리하도록
  * 빌드에서는 동작이 잘 되었지만, 단위 테스트에서 참조가 걸려 테스트를 진행하지 못함
  * 해당 파일의 Target을 설정하여 가져올까도 했지만, 뭔가 찝찝한 느낌이 듬
    * OptionView의 delegate는 ViewController에서 구현해 놓음
  * 위의 방법을 지우고, ViewController에서 OptionView의 버튼들 Action 바인딩해서 사용하는 로직으로 수정
* MVC
  * 프로젝트의 기능을 구현하다보니, 코드가 ViewController로 점점 모이는 구조가 됨
  * 우선, OptionView와 CardView를 레이어단위로 나눠서 구현
  * Input을 처리하는 View의 이벤트는 ViewController에서 PokerGame(비지니스로직)과 연결
  * 포커타입, 사용자 수 이벤트 발생하면 PokerGame에서 처리 후 Delegate를 통해 ViewController로 전달
  * ViewController에서는 받은 데이터로 Layout을 재 설정



------

## 2022.02.21 Step2

## 작업목록

- [x] 카드데이터를 관리할 Struct 제작
- [x] 카드데이터를 문자열을 변환하는 함수 제작
  - [x] 단위테스트
    - [x] CardData 객체 인스턴스 & 출력 테스트
- [x] CardDeck 클래스 구현
- [x] CardDeck 필요 함수 구현
  - [x] 단위테스트
    - [x] CardDeck 인스턴스 테스트
    - [x] CardDeck Shuffle() 테스트
    - [x] CardDeck RemoveOne() 테스트
    - [x] CardDeck Reset() 테스트

## 학습 키워드

* 단위테스트, struct, class

## 고민과 해결

* **단위테스트**
  * 단위테스트가 어떤식으로, 어떻게 하는것인지 모르고 있었음( 채용공고에 보면 단위테스트를 보는 회사도 많았는데...)
  * 단위테스트가 어떤것인지 궁굼해하고 있던 중 오늘 수업중에 나옴
  * 기존 테스트는 코드짜고, 빌드돌리고, 시뮬레이터에서 확인
  * 오늘 수업을 듣고 단위테스트를 적용, 내가 만든 코드를 간단하게 테스트 해볼수 있었음!
  * 아직 기초만 사용하는 것 같지만, 좀더 알아보고 더 나은 단위 테스트를 진행해 보아야겠음

------



## 2022.02.21 작업목록

- [x] git 저장소 fork & 프로젝트 생성
- [x] 기본 폴더 구조 정리
- [x] 앱의 기본설정을 지정해서 StatusBar스타일을 LightContent로 보이도록 한다
- [x] 보드의 배경을 이미지 패턴으로 적용
- [x] 7개의 UIImageView생성하고 카드 뒷면을 출력
- [x] 화면의 크기를 구하고, 균등하게 7등분해서 이미지 표시
- [x] 카드 가로와 세로 배율은 1:1.27로 지정

## 학습키워드

* layoutIfNeeded, preferredStatusBarStyle, patternImage, AutoLayout

## 고민과 해결

* **배열의 초기화!**

  * 평소 값을 넣은 배열을 초기화 하는 방식으로 아래와 같이 코드를 작성

    ```swift
    var cards: [UIImageView] = Array(repeating: UIImageView(), count: 7)
    ```

  * 그 후 AutoLayout를 구성 중 테스트 하는데 한장의 카드만 계속 나오고, AutoLayout이 잘못되었다는 메세지가 출력

  * AutoLayout이 잘못 설정 되었나 싶어 이리저리 건들여 보았지만 효과가 없었음.

  * 파악해보니, 위 코드와 같이 배열을 초기화 할 경우 한개의 UIImageView를 생성하고, 참조로 7개의 값이 들어가고 있었음.

  * 아래와 같이 코드를 수정하여 해결완료

    ```swift
    var cards: [UIImageView] = (0..<7).map{ _ in  UIImageView()}
    ```

* **AutoLayout로 설정한 cardContainerView의 Size 가져오기**

  * cardContainerView의 AutoLayout설정 후 크기를 가져오기 시도

    ```swift
    //오토레이아웃 설정 후
    let cardOffset = 3.0
    let cardWidth = (cardContainerView.frame.width - (cardOffset * 6)) / 7
    let cardHeight = cardWidth * 1.27
    
    //결과
    //0
    ```

  * 로그를 찍어봐도 모든 값이 0으로 설정되어 원하는 값을 가져오지 못함

  * 이전에 몇번 써봣던 화면을 갱신해주는 함수가 있었다는걸 기억해서 어떤함수였는지 찾음

    ```swift
    //강제로 Layout을 업데이트 해주는 함수
    //참조 https://zeddios.tistory.com/359
    self.view.layoutIfNeeded()
    ```

  * 위의 함수를 사용하여 강제로 Layout을 업데이트를 해 준 후 cardContainerView의 크기를 가져올 수 있었음

  

* **AutoLayout**

  * 우선 카드를 보여주는 컨테이너 뷰를 제작(cardContainerView)

  * cardContainerView의 top, left, right, **height** Anchor를 설정

  * cardContainerView 안에 생성한 7개의 ImageView를 추가

  * 각 ImageView의 top, left, right, height Anchor 설정

  * cardContainerView의 height Anchor를 200으로 잡아 놓고 있어서, 이 부분을 맞추려고 아래와 같이 작성

    ```swift
    cardContainerView.bottomAnchor.constraint(equalTo: cards[0].bottomAnchor).isActive = true
    ```

    <img src="https://user-images.githubusercontent.com/5019378/154882129-81cfc4a5-2389-44f7-915b-3864d7eea4eb.png" alt="Simulator Screen Shot - iPhone 13 Pro - 2022-02-21 at 12 01 25" style="zoom:20%;" />

  * 위와 같은 결과가 나와 원인을 파악해보니, 카드의 Anchor를 설정할 때 bottomAnchor은 설정하지 않았음.

  * 위의 코드를 아래와 같이 변경하여 해결완료

    ```swift
    cardContainerView.heightAnchor.constraint(equalTo: cards[0].heightAnchor).isActive = true
    ```



## 결과물

<img src="https://user-images.githubusercontent.com/5019378/154883261-ebc85ee1-6573-4bc3-8bcb-9c689e2a3e04.png" alt="Simulator Screen Shot - iPhone 13 Pro - 2022-02-21 at 11 48 24" style="zoom:20%;" />
