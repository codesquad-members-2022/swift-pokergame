# STEP03. 카드덱 구현, 테스트

> 2022.02.23

### 요구사항

- [x] 앞서 만든 모든 종류의 카드 객체 인스턴스를 포함하는 카드덱 구조체를 구현한다.
- [x] 객체지향 설계 방식에 맞도록 내부 속성을 모두 감추고 다음 인터페이스만 보이도록 구현한다.
  - count 갖고 있는 카드 개수를 반환한다.
  - shuffle 기능은 전체 카드를 랜덤하게 섞는다.
  - removeOne 기능은 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
  - reset 처음처럼 모든 카드를 다시 채워넣는다.
  - 메소드 매개변수와 리턴값은 어떤 타입이 좋을지, 속성으로 무엇이 필요한지, 불변 Immutable 인지 가변 mutable 인지 판단해야 한다.

### 프로그래밍 요구 사항

- [x] 상위 모듈에서 카드덱 기능을 확인할 수 있도록 테스트 코드를 추가한다
- [x] XCTest 같은 단위 테스트가 아니라, 카드덱 함수를 호출해서 원하는 데로 동작하는지 확인할 수 있는 코드를 작성한다
  - XCTest 타깃과 단위 테스트는 다음 단계에서 적용한다
- [x] 다양한 shuffle 알고리즘에 대해 찾아보고 랜덤하게 shuffle 처리하는 로직을 직접 구현한다.
  - Array.shuffle() 이나 shuffled()을 사용하지 않는다

<br/>
<br/>

### 과정

1. Test 클래스 생성
2. CardDeck 의 `count()` 를 테스트하는 함수 작성
3. `CardDeck.count()` 구현
4. 테스트 실행, 코드 리펙토링
5. 2~4 를 반복하여 CardDeck 의 메서드들 구현

<br/>

## 배경 지식 학습

### Equatable

> 값이 같은지 비교할 수 있는 타입
> ==, ≠ 사용할 수 있게 해줌

기본 자료형을 `==` 로 비교할 수 있는 이유도 이 프로토콜을 채택했기 때문이다.

Int 형 연산을 위해 사용하는 함수가 구현된 것을 확인할 수 있다:

```swift
public static func == (lhs: Int8, rhs: Int8) -> Bool
public static func < (lhs: Int8, rhs: Int8) -> Bool
public static func += (lhs: inout Int8, rhs: Int8)
public static func -= (lhs: inout Int8, rhs: Int8)
public static func *= (lhs: inout Int8, rhs: Int8)
public static func /= (lhs: inout Int8, rhs: Int8)
```

- `==` 은 `lhs`, `rhs` 두 인자를 비교해 Bool 형으로 반환한다

`구조체A == 구조체B` 비교하기 위해서는 다음처럼 구현한다:

```swift
// 1. 프로토콜 채택
struct Card: Equatable {
...생략
// 2. 비교를 위한 함수 구현
  static func == (lhs: Self, rhs: Self) -> Bool {
      return (lhs.suit == rhs.suit) && (lhs.number == rhs.number)
  }
}
```

## 셔플 알고리즘

### **Fisher-Yates shuffle**

1983년 로널드 피셔, 프랭크 예이츠가 처음 고안하였고 이들의 이름을 따서 부른다.

- 편향 되지 않은 순열을 만드는데 적합하다.
- 시간 복잡도 $O(n^2)$

1. 1~N 까지의 숫자를 적는다
2. 1과 남아있는 숫자 사이에서 무작위로 숫자 K를 선택한다
3. 낮은쪽 부터 세고, 아직 별도의 배열 끝에 넣는다.
4. 2단계부터 모든 숫자가 제외될때까지 반복
5. 3단계에서 넣은 배열의 결과가 셔플된 배열이다.

### Fisher-Yates 현대판 알고리즘

1964년 리처드 던스텐펠트에 의해 소개.

오리지널 피셔-예이츠 셔플은 O(n^2) 의 복잡도를 가지기 때문에 O(n) 인 개선된 현대판 알고리즘이 사용된다.

- 별도의 배열이 필요없다(배열안에서 요소의 위치를 swap 하기때문)
- 반복할떄마다 남은 요소 갯수를 셀 필요가 없다 ⇒ O(n)
