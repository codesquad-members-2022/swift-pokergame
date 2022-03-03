# swift-pokergame
💁‍♀️ bibi의 스위프트 카드게임 저장소입니다.

---

## [2/22] Step1 - 포커 게임 카드 뒷면과 배경 만들기
- [x] Status Bar 기본 스타일을 LightContent로 설정
- [x] ViewController 뒷배경을 지정된 패턴으로 설정
- [x] ViewController에 카드 뒷면 이미지를 추가
- [x] ViewController에 코드로 7장의 카드 배치
- 현재 상황
  - ![스크린샷 2022-02-23 오후 4 14 31](https://user-images.githubusercontent.com/67407678/155326247-d39fe3e2-430b-457e-8307-5de744aa3bd9.png)


---

## [2/23] Step2 - 카드 데이터를 클래스로 구현하기
- [x] class Card, enum Number, enum Shape 생성
- [x] 카드 정보 출력 메서드 생성
- [x] 뷰 컨트롤러에서 특정 카드 인스턴스를 만들어 출력

---

## [2/25] Step3 - 카드 덱 구조체와 관련 메서드 구현하기
- [x] struct Deck 생성
- [x] Deck의 메서드 - count, shuffle, removeOne, reset 구현

---

## [2/26, 2/28] Step4-1 - 게임 로직 구현
- [x] Pokergame, Dealer, Player 생성
- [x] 7카드-스터드 방식으로 플레이어 3명과 딜러에게 카드 배분 로직 구현

---

## [3/2, 3/3] Step 4-2 - 게임 로직 구현 및 테스트하기
- [x] PokerGame.Stud enum 추가
- [x] 5카드-스터드 방식도 지원하도록 변경
- [x] XCTest로 PokerGame의 메서드 테스트
