# PokerGame

- 단계별로 미션을 해결하고 리뷰를 받고나면 readme.md 파일에 주요 작업 내용(바뀐 화면 이미지, 핵심 기능 설명)과 완성 날짜시간을 기록한다.
- 실행한 화면을 캡처해서 readme.md 파일에 포함한다.

## 작업내역

| 날짜       | 번호   | 내용                                    | 비고                             |
| ---------- | :----- | --------------------------------------- | -------------------------------- |
| 2022.02.24 | Step_4 | 승자 표시하기                           |                                  |
| 2022.02.22 | review | 코드리뷰 후 수정작업                    |                                  |
| 2022.02.21 | Step_3 | 게임로직 구현하기 & 포커게임 화면만들기 |                                  |
| 2022.02.21 | Step_2 | 카드 데이터 & 카드 덱 구현              |                                  |
| 2022.02.21 | Step_1 | 게임보드 만들기                         | 프로젝트 셋팅 및 Step_1단계 진행 |

------

## [Step_4] 승자 표시하기

### 체크리스트

- [x] 플레이어에 점수를 계산하는 함수 추가
- [x] XCTest 코드 작성
  - [x] 원페어, 투페어, 트리플, 스트레이트, 포카드의 규칙을 적용해 정상적으로 찾는지?
- [x] 승자표시를 위한 UI 구현
- [x] 추가요구사항 구현
  - [x] 일정시간 간격을 두고 카드를 나눠주는 것 처럼 반복해서 업데이트

### 결과화면

```
Name: 테스터1, cards: [hJ, c2, d9, s5, s7, sQ, h10] -- 점수없음
Name: 테스터2, cards: [c3, c9, sA, c7, s8, cK, c10] -- 점수없음
Name: 테스터3, cards: [c6, c4, d5, hK, hQ, s9, s4] -- onePair(4)
Name: 테스터4, cards: [s3, h3, cJ, sJ, h8, d7, d10] -- twoPair(J)
Name: 딜러, cards: [d3, d8, dK, sK, c5, c8, d4] -- twoPair(K)
승자는 딜러 입니다!! (twoPair(K))
```

```
Name: 테스터1, cards: [h6, c9, d8, c7, c4, cA, s9] -- onePair(9)
Name: 테스터2, cards: [d6, s8, h8, hA, d4, sA, d2] -- twoPair(8)
Name: 테스터3, cards: [d7, hK, s7, dJ, c8, s4, h4] -- twoPair(7)
Name: 테스터4, cards: [dK, hJ, d5, h3, h2, d3, hQ] -- onePair(3)
Name: 딜러, cards: [c5, cQ, sJ, h9, cJ, s2, sQ] -- twoPair(Q)
승자는 딜러 입니다!! (twoPair(Q))
```

```
Name: 테스터1, cards: [cA, h2, d6, d5, hK, c3, h4] -- straight(2)
Name: 테스터2, cards: [c2, dA, s9, hQ, sK, d7, hA] -- onePair(A)
Name: 테스터3, cards: [h5, d10, dK, s2, cK, c5, sA] -- twoPair(K)
Name: 테스터4, cards: [h9, d8, s6, hJ, dJ, s5, d4] -- onePair(J)
Name: 딜러, cards: [h3, c8, sJ, d2, d3, s10, c10] -- twoPair(10)
승자는 테스터1 입니다!! (straight(2))
```

![스크린샷 2022-02-25 오후 2 25 33](https://user-images.githubusercontent.com/5019378/155659156-e94e8761-14e0-4c95-89ea-d73da7c1edfd.png)

![Simulator Screen Recording - iPhone 12 Pro - 2022-02-25 at 15 30 48](https://user-images.githubusercontent.com/5019378/155666207-144be205-f003-4513-b440-f78d45700ef7.gif)

------

## [Step_3] 게임로직 구현하기 & 포커게임 화면만들기

### 체크리스트

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

### 핵심기능

* 플레이어와 딜러 객체를 인스턴스하고, 카드덱에서 한장씩 뽑아 플레이어들에게 카드를 배분하고, 화면에 보여준다

### 결과화면

* 카드 배분 후 포커플레이 타입에 따라 카드가 맞게 배분 되었는지

  ```
  //PokerType.sevenCard
  //pokerPlayerCount = 3
  Name: pigbag, cards: [d10, d6, d3, d9, s4, sQ, c7]
  Name: bibi, cards: [s5, c2, h8, d5, c6, cQ, hJ]
  Name: shingha, cards: [s10, dJ, sA, d2, sK, d8, h4]
  Name: Dealer, cards: [cJ, c5, s6, h5, c8, dQ, s2]
  ```

* 아이폰, 아이패드 결과 화면

  ![스크린샷 2022-02-22 오후 3 49 10](https://user-images.githubusercontent.com/5019378/155078016-eb35fa59-69f6-4027-9897-25e042187de7.png)

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
  [sA, s2, s3, s4, s5, s6, s7, s8, s9, s10, sJ, sQ, sK, dA, d2, d3, d4, d5, d6, d7, d8, d9, d10, dJ, dQ, dK, hA, h2, h3, h4, h5, h6, h7, h8, h9, h10, hJ, hQ, hK, cA, c2, c3, c4, c5, c6, c7, c8, c9, c10, cJ, cQ, cK]
  count: 52
  ```
  
* CardDeck Shuffle() 테스트

  ```
  [hQ, sA, d7, d3, dK, dJ, s5, h2, s10, c4, h5, sQ, h8, c3, sJ, s6, s7, d9, dA, cA, sK, d4, hK, h7, hJ, hA, dQ, h4, d8, c6, d6, cK, s3, s9, d10, d5, c2, cJ, cQ, c5, h10, s4, h6, h9, c7, h3, s2, c9, c10, c8, d2, s8]
  count: 52
  ```
  
* CardDeck RemoveOne() 테스트

  ```
  뽑은카드: ♠K
  남은 카드 갯수: 51
  ```
  
* CardDeck Reset() 테스트

  ```
  [sA, s2, s3, s4, s5, s6, s7, s8, s9, s10, sJ, sQ, sK, dA, d2, d3, d4, d5, d6, d7, d8, d9, d10, dJ, dQ, dK, hA, h2, h3, h4, h5, h6, h7, h8, h9, h10, hJ, hQ, hK, cA, c2, c3, c4, c5, c6, c7, c8, c9, c10, cJ, cQ, cK]
  count: 52
  
  뽑은카드: h5
  [sA, s2, s3, s4, s5, s6, s7, s8, s9, s10, sJ, sQ, sK, dA, d2, d3, d4, d5, d6, d7, d8, d9, d10, dJ, dQ, dK, hA, h2, h3, h4, h6, h7, h8, h9, h10, hJ, hQ, hK, cA, c2, c3, c4, c5, c6, c7, c8, c9, c10, cJ, cQ, cK]
  count: 51
  
  뽑은카드: h7
  [sA, s2, s3, s4, s5, s6, s7, s8, s9, s10, sJ, sQ, sK, dA, d2, d3, d4, d5, d6, d7, d8, d9, d10, dJ, dQ, dK, hA, h2, h3, h4, h6, h8, h9, h10, hJ, hQ, hK, cA, c2, c3, c4, c5, c6, c7, c8, c9, c10, cJ, cQ, cK]
  count: 50
  
  뽑은카드: d10
  [sA, s2, s3, s4, s5, s6, s7, s8, s9, s10, sJ, sQ, sK, dA, d2, d3, d4, d5, d6, d7, d8, d9, dJ, dQ, dK, hA, h2, h3, h4, h6, h8, h9, h10, hJ, hQ, hK, cA, c2, c3, c4, c5, c6, c7, c8, c9, c10, cJ, cQ, cK]
  count: 49
  
  Deck Reset!
  [sA, s2, s3, s4, s5, s6, s7, s8, s9, s10, sJ, sQ, sK, dA, d2, d3, d4, d5, d6, d7, d8, d9, d10, dJ, dQ, dK, hA, h2, h3, h4, h5, h6, h7, h8, h9, h10, hJ, hQ, hK, cA, c2, c3, c4, c5, c6, c7, c8, c9, c10, cJ, cQ, cK]
  count: 52
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



