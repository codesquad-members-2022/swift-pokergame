# swift-pokergame
2주차 카드게임 저장소

​    

## 0. 진행 상황

- [x] 게임 보드 만들기(2021.02.21 19:26)
- [ ] 카드 클래스 구현하기
- [ ] 카드덱 구현하고 테스트하기
- [ ] 게임로직 구현하기
- [ ] 포커게임 화면 만들기
- [ ] 승자 표시하기
- [ ] 마무리하기

​    

## 1. 게임 보드 만들기

<img src="https://user-images.githubusercontent.com/68586291/154936556-77ae248d-a2d4-4dc8-a136-460f1777963f.png" alt="image" style="width:25%; align:center;"/>

- 백그라운드 패턴으로 사용할 이미지 Asset 추가 후, __`backgroundColor`__ 속성으로 지정

```swift
func setBackgroundColor(){
  if let patternImage = UIImage(named: "bg_pattern"){
    self.view.backgroundColor = UIColor.init(patternImage: patternImage)
  }
}
```

- 이후 카드 이미지 Asset추가 후, UIImageView를 7개 만들어서 일정 간격으로 정렬
  - 카드 간격은 우선 CGFloat(10)으로, 카드의 Y좌표는 CGFloat(80)으로 하드코딩했음
  - 카드의 너비와 높이의 비를 1:1.27로 맞추기 위해 카드 너비를 정하고, 높이는 너비의 1.27배가 되도록 설정
  - 반복문을 7번 돌면서 UIImageView를 만든 후, 카드 간격 값을 누적하면서 X좌표값을 구해서 화면에 SubView로 추가함

```swift
func setInitialImageView(_ cardsCount: CGFloat){
  guard let image = UIImage(named: "card-back") else{ return }

  let cardMargin = CGFloat(10)
  let cardWidth = (self.view.bounds.width - cardMargin*(cardsCount+1))/cardsCount
  let cardHeight = cardWidth*CGFloat(1.27)
  var cardXPosition = cardMargin
  let cardYPosition = CGFloat(80)

  for _ in 0..<Int(cardsCount){
    let imageView: UIImageView = UIImageView(frame: CGRect(x: cardXPosition, y: cardYPosition, width: cardWidth, height: cardHeight))
    imageView.image = image
    imageView.contentMode = .scaleAspectFit
    self.view.addSubview(imageView)
    cardXPosition += cardMargin+cardWidth
  }

}
```

