# Step 3. 카드덱 구현하고 테스트하기

## 작업 목록

- [x] Card 클래스, CardDeck 구현
- [x] 팩토리 패턴을 적용한 CardDeckFactory 구조체 구현
- [x] 테스트 코드 작성

## 학습 키워드

- Factory Pattern
- Class & 구조체
- Sattolo Shuffle 알고리즘
- Durstenfeld Shuffle 알고리즘
- Unit Testing

## 고민과 해결

<details>
<summary>문제</summary>
  - CardDeck 인스턴스 생성에 필요한 복잡한 작업을 CardDeckFactory에 모두 위임하였는데 CardDeck.reset 호출 시 다시 Card 인스턴스를 만들어 덱에 채워야하는 문제가 생겼습니다.
</details>

<details>
  <summary>시도</summary>
  - CardDeck.reset 내부에서 CardDeckFactory 를 사용해 다시 덱을 채워우면 해결되나 코드간 결합도가 높아지는 문제가 발생했습니다.
</details>

<details>
  <summary>해결</summary>
  - Card 클래스는 Reference Semantic 방식으로 동작한다는 점을 고려했습니다.
  - CardDeck.cache 속성을 추가해 CardDeck.removeOne 호출 시 내부에서 cache 배열에 draw 된 카드를 저장시켰습니다.
  - reset 호출 시 cache 의 저장된 덱 정보([Card]) 를 활용하는 방법으로 CardDeckFactory 와 분리하여 해결했습니다.
</details>

<details>
  <summary>적용한 해결방법의 장점</summary>
  - 상위 모듈에서 removeOne 을 사용해 draw 한 카드와 cache에 담긴 카드 모두 같은 인스턴스를 가리키고 있어 메모리 활용 측면에서도 효율적일 것이라고 생각합니다.
  - Card 의 속성은 immutable 하게 정의되었기 때문에 상위 모듈과 하위 모듈이 같은 인스턴스를 참조하더라도 문제가 되지 않을 것이라고 생각합니다.
</details>
