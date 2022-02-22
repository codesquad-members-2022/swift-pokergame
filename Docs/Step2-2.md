# Step2-2. 카드 클래스 구현하기

## 💻 작업 목록

- [x] Step2-1의 PR 리뷰 반영
- [x] 카드 데이터를 추상화해서 클래스로 구현하고 단계별로 다양한 상황에 확장해서 사용한다.
- [x] 클래스 이름, 변수 이름, 함수 이름에서 자신만의 규칙을 만든다.
- [x] 임의의 카드 객체 인스턴스를 하나 만들어서 출력한다.


## 📱 실행 화면

![스크린샷 2022-02-22 오후 4 40 31](https://user-images.githubusercontent.com/95578975/155086263-70eace93-80b8-47c6-a77f-b149c794fa9d.png)

![스크린샷 2022-02-22 오후 4 48 05](https://user-images.githubusercontent.com/95578975/155086196-15487cb5-adc1-471f-b7dc-cd78eb391be5.png)

## 🤔 고민과 해결

### 1️⃣ 이미지를 반복적으로 7번 만드는 코드 개선

❌ 시도 1 - 아래와 같이 배열을 만들고 for 문으로 위치를 지정하니 7개의 이미지가 모두 같은 위치에 놓여져 마치 카드가 1개만 있는 것처럼 보였다. 출력해보니 같은 이미지뷰가 7개 만들어졌고, 이 이미지들은 모두 같은 주소를 참조하고 있었다. 

```swift
var cardImages = [UIImageView](repeating: UIImageView(image: getImage(name: "card-back")), count: 7)
```



⭕️ 시도 2 - map을 사용하여 해결하니 모두 다른 주소를 갖는 이미지뷰가 7개 생성되었다. 

```swift
var cardImages: [UIImageView] = (0..<7).map { _ in UIImageView(image: getImage(name: "card-back")) }
for i in 0..<7 {
    cardImages[i].frame = CGRect(x: xPosition , y: yPosition, width: cardWidth, height: cardHeight)
    cardImages[i].contentMode = .scaleAspectFit
    cardImages.append(cardImages[i])
    view.addSubview(cardImages[i])
    xPosition += (cardWidth + cardOffset)
}
```

### 2️⃣ Struct vs Class

애플은 가이드라인에서 다음 조건 중 하나 이상에 해당된다면 구조체를 사용하기를 권합니다. 

- 연관된 간단한 값의 집합을 캡슐화 하는 것만이 목적일 때 
- 캡슐화된 값이 참조되는 것보다 복사되는 것이 합당할 때
- 구조체에 저장된 프로퍼티가 값 타입이며 참조되는 것보다 복사되는 것이 합당할 때
- 다른 타입으로부터 상속받거나 자신이 상속될 필요가 없을 때 

## 💡 학습 키워드

- Object-oriented Design
- 유니코드
- Enumeration
- description
