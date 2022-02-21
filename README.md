# swift-pokergame
2주차 카드게임 저장소

# Step2-1. 게임보드 만들기

## 💻 작업 목록

- [x] 앱 기본 설정을 지정해서 StatusBar 스타일을 LightContent로 보이도록 한다.
- [x] ViewController 클래스에서 self.view 배경을 다음 이미지 패턴으로 지정한다. 이미지 파일은 Assets에 추가한다.
- [x] self.view의 배경을 이미지 패턴으로 지정하고, 카드 추가하기


## 📱 실행 화면

![스크린샷 2022-02-21 오후 6 42 23](https://user-images.githubusercontent.com/95578975/154929115-6eda42a5-fad6-43cb-9a8e-f612a467853e.png)

## 🤔 고민과 해결

### 1️⃣ 뷰의 배경을 이미지 패턴으로 지정하기

```swift
self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern")!)
```

- UIColor(patternImage:) 메소드는 이미지를 패턴화해서 색상 객체를 만들고 배경 색상처럼 사용할 수 있도록 해줍니다.

### 2️⃣ 7개의 이미지를 나열하기

이미지를 차례대로 나열시키는데는 성공하였으나, 모든 이미지들이 간격 없이 붙어서 나왔습니다. 그래서 이미지 사이에 간격을 추가하였습니다.

```swift
func showCardImages() {
    let cardOffset = 5.0
    let cardWidth = (view.frame.width - (cardOffset * 8)) / 7
    let cardHeight = cardWidth * 1.27
    var xPos = 5.0
    let yPos = 60.0
    
    for _ in 0..<7 {
        let cardImage = UIImageView(image: UIImage(named: "card-back"))
        cardImage.frame = CGRect(x: xPos , y: yPos, width: cardWidth, height: cardHeight)
        cardImage.contentMode = .scaleAspectFit
        view.addSubview(cardImage)
        
        xPos += cardWidth + cardOffset
    }
}
```


## 💡 학습 키워드

- StatusBar
- UIImageView
- StackView
