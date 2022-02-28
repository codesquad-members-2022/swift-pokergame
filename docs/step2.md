# Step 2. 카드 클래스 구현하기

## 작업 목록

- [x] Card class 추가
- [x] Card 정보를 출력하는 코드 분리
- [x] 임의의 카드 객체 인스턴스를 하나 만들어서 출력한다.
- [x] 주석 추가

## 결과물

<image src="../images/step1-2.png" width="100px" />

## 학습 키워드

- Nested Type
- Comparable Protocol
- Swift 성능 최적화

## 고민

- 카드 클래스가 채택한 프로토콜(Comparable CustomStringConvertible)의 구현체는 카드 클래스의 extension 에 정의하였는데 관리적인 측면에서 코드가 분리되어 보여 장점으로 보인다.
- 결과적으로 카드 클래스의 메서드로 추가되는 것이기 때문에 데이터 흐름의 관점에서는 코드가 분리되어 역할이 나뉘는 것은 아니다. 결국 작성할 떄에만 따로 구분하는 것이지 데이터 흐름과는 관계가 없기 떄문에 `extension` 를 사용할 때 데이터 흐름을 고려해야한다.
