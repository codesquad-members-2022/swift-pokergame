# PokerGame

- 단계별로 미션을 해결하고 리뷰를 받고나면 readme.md 파일에 주요 작업 내용(바뀐 화면 이미지, 핵심 기능 설명)과 완성 날짜시간을 기록한다.
- 실행한 화면을 캡처해서 readme.md 파일에 포함한다.

## 작업내역

| 날짜       | 번호   | 내용                       | 비고                             |
| ---------- | :----- | -------------------------- | -------------------------------- |
| 2022.02.21 | Step_2 | 카드 데이터 & 카드 덱 구현 |                                  |
| 2022.02.21 | Step_1 | 게임보드 만들기            | 프로젝트 셋팅 및 Step_1단계 진행 |

------

## [Step_2]

### 체크리스트

- [x] 포커게임 타입 정의
- [x] 플레이어, 딜러 클래스 생성
- [x] 포커게임 클래스 생성
- [x] 카드 배분 함수 제작 
- [x] XCTest 코드 작성
  - [x] 전체 카드를 뽑았을때 중복없이 잘 뽑히는지
  - [x] 카드 배분 후 포커플레이 타입에 따라 카드가 맞게 배분 되었는지

### 핵심기능

* 플레이어와 딜러 객체를 인스턴스하고, 카드덱에서 한장씩 뽑아 플레이어들에게 카드를 배분한다

### 결과화면

* **전체 카드를 뽑았을때 중복없이 잘 뽑히는지**

  ```
  
  ```

  

------



## [Step_2] 카드 데이터 & 카드 덱 구현

### 체크리스트

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


### 핵심기능

* 카드 데이터 Class를 제작해 인스턴스를 생성하고, 해당 카드를 출력한다

### 결과화면

* CardData 객체 인스턴스 확인

  ```
  ♣A
  ♣2
  ♣3
  ♣4
  ♣5
  ♣6
  ♣7
  ♣8
  ♣9
  ♣10
  ♣J
  ♣Q
  ♣K
  ```

* CardDeck 인스턴스 확인

  ```
  [PokerGameTests.CardData(pattern: PokerGameTests.CardData.CardPattern.spade, number: 1), 
  ...
  PokerGameTests.CardData(pattern: PokerGameTests.CardData.CardPattern.spade, number: 13), PokerGameTests.CardData(pattern: PokerGameTests.CardData.CardPattern.diamond, number: 1), 
  ...
  PokerGameTests.CardData(pattern: PokerGameTests.CardData.CardPattern.diamond, number: 13), PokerGameTests.CardData(pattern: PokerGameTests.CardData.CardPattern.heart, number: 1), 
  ...
  PokerGameTests.CardData(pattern: PokerGameTests.CardData.CardPattern.heart, number: 13), PokerGameTests.CardData(pattern: PokerGameTests.CardData.CardPattern.clover, number: 1),
  ...
  PokerGameTests.CardData(pattern: PokerGameTests.CardData.CardPattern.clover, number: 13)]
  남은 카드 갯수: 52
  ```
  
* CardDeck Shuffle() 테스트

  ```
  [PokerGameTests.CardData(pattern: PokerGameTests.CardData.CardPattern.diamond, number: 7), PokerGameTests.CardData(pattern: PokerGameTests.CardData.CardPattern.clover, number: 3), PokerGameTests.CardData(pattern: PokerGameTests.CardData.CardPattern.heart, number: 2), PokerGameTests.CardData(pattern: PokerGameTests.CardData.CardPattern.spade, number: 7), PokerGameTests.CardData(pattern: PokerGameTests.CardData.CardPattern.diamond, number: 5), PokerGameTests.CardData(pattern: PokerGameTests.CardData.CardPattern.heart, number: 11), PokerGameTests.CardData(pattern: PokerGameTests.CardData.CardPattern.diamond, number: 3), 
  ...
  PokerGameTests.CardData(pattern: PokerGameTests.CardData.CardPattern.heart, number: 6), PokerGameTests.CardData(pattern: PokerGameTests.CardData.CardPattern.spade, number: 8), PokerGameTests.CardData(pattern: PokerGameTests.CardData.CardPattern.clover, number: 1), PokerGameTests.CardData(pattern: PokerGameTests.CardData.CardPattern.clover, number: 12), PokerGameTests.CardData(pattern: PokerGameTests.CardData.CardPattern.spade, number: 12), PokerGameTests.CardData(pattern: PokerGameTests.CardData.CardPattern.clover, number: 11), PokerGameTests.CardData(pattern: PokerGameTests.CardData.CardPattern.diamond, number: 12), PokerGameTests.CardData(pattern: PokerGameTests.CardData.CardPattern.clover, number: 9)]
  남은 카드 갯수: 52
  ```
  
* CardDeck RemoveOne() 테스트

  ```
  뽑은카드: ♠K
  남은 카드 갯수: 51
  ```
  
* CardDeck Reset() 테스트

  ```
  뽑은카드: ♠7
  뽑은카드: ♣5
  뽑은카드: ♥A
  남은 카드 갯수: 49
  카드 덱 리셋
  남은 카드 갯수: 52
  ```



------

## [Step_1] 게임 보드 만들기

### 체크리스트

- [x] git fork 및 프로젝트 생성
- [x] StatusBar Style를 LightContent로 변경
- [x] 보드의 배경을 이미지 패턴을 사용하여 적용
- [x] 7개의 카드를 만들고, 카드 뒷면이 나오도록 출력
- [x] 카드를 균등하게 7등분해서 이미지로 표시
- [x] 카드의 가로 세로 비율은 1:1.27로 적용

### 핵심기능

* PokerGame에 필요한 보드를 만들고 그 위에 7장의 카드를 생성하여, 동일한 크기로 만든다

### 결과화면

<img src="https://user-images.githubusercontent.com/5019378/154883261-ebc85ee1-6573-4bc3-8bcb-9c689e2a3e04.png" alt="Simulator Screen Shot - iPhone 13 Pro - 2022-02-21 at 11 48 24" style="zoom:20%;" />



