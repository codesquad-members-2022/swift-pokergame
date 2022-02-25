# Step2-4. 게임로직 구현하기

## 💻 작업 목록

- [x] Step2-3의 PR 리뷰 반영
- [x] XCTest 적용
- [X] PokerGame 객체 생성
- [X] 딜러 구현
- [X] 참가자 구현
- [X] Step2-4 README.md 작성

## 📱 실행 화면

![스크린샷 2022-02-25 오후 10 43 53](https://user-images.githubusercontent.com/95578975/155725923-7dd060b6-2009-4d0d-a051-75c44bcc6a9b.png)

## 🤔 고민과 해결

### 1️⃣ XCTest 코드 작성하기

- setUpWithError() : 테스트 메소드가 실행되기 전 모든 상태를 reset (초기화 코드)
- tearDownWithError() - 테스트 동작이 끝난 후 모든 상태를 clean up (해체 코드)

### 2️⃣ 'CardGame' initializer is inaccessible due to 'private' protection level

- 문제 발생 이유: 구조체의 내부 프로퍼티를 private으로 설정하고 cardCount의 초기값을 지정해주지 않아서 발생한 문제.
- 해결 방법: cardCount의 초기값을 0으로 설정
- 접근 제어자 관련 학습
- 최종적으로 삭제된 코드입니다.

### 3️⃣ instance member cannot be used on instance of nested type swift

Dealer 구조체 내의 distributeCard(to:)에서 cardStud를 사용하려고 하니 위의 메시지와 같은 오류가 났습니다.
(인스턴스 멤버는 Swift의 중첩된 타입에서 인스턴스로 사용될 수 없다는 것)

- 문제 발생 이유 [자료](https://forums.swift.org/t/is-it-ok-that-i-cannot-instantiate/43389/2)

  Nested types in Swift as of now serve only namespasing purposes; beyond that, they are not "linked" to the containing type and aren't aware of any of its properties or methods. 

- 해결 방법

  cardStud를 private에서 static으로 변경하였습니다. static은 프로퍼티를 인스턴스화하지 않고 하나만 존재하도록 하기 위해 사용되는데, 최종적으로 cardStud도 distributeCard(to:) 메소드 내에서 삭제되었습니다.

## ❓ 느낀 점

구현하면서 부족하다고 생각되었던 부분이 많아 추가적으로 공부를 더 할 예정이고, Struct, Class의 특징과 차이점에 대해서 다시 한번 제대로 정리를 해봐야겠다고 생각했습니다. 접근제어자와 프로퍼티에 대해서도 학습을 더 할 예정입니다.

## 💡 학습 키워드

- Struct
- Class
- static
- 접근 제어자 (Access control)
