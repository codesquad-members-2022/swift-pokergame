# iOS - 포커게임 앱

## 1. 게임보드 만들기

### 📌체크 포인트

- [x] 프로젝트 파일 생성
	- [x] `StatusBar` 스타일을 `LightContent` 로 설정
- [x] 생성되어 있는 ViewController의 `self.view` 를 [다운받은 이미지](http://public.codesquad.kr/jk/bg_pattern.png) 의 이미지 패턴으로 지정(이미지 파일은 Assets에 추가)
- [x] [카드 뒷면에 해당하는 이미지](http://public.codesquad.kr/jk/card-back.png) 를 Asset에 추가
- [x] 코드로 7개의 UIImageView를 생성하여 카드 뒷면을 보여주도록 설정 (카드의 크기는 화면 크기를 균등하게 7등분하도록 설정, 가로 세로 비율은 1:1.27)



---

### 💻진행 과정

1. StatusBar style을 `LightContent` 로 설정해주었습니다. 해당 값은 Project Navigstor에서 프로젝트파일에 해당하는 `PockerGameApp.xcodeproj` 파일을 클릭하여 수정할 수 있습니다.

	<img src="https://user-images.githubusercontent.com/92504186/154877362-f89f5265-8921-4fb6-856a-907688f500b3.jpg" alt="SS 2022-02-21 AM 11 06 09" width="70%;" />

2. 프로젝트를 생성하면서 생성된 ViewController 클래스의 viewDidLoad() 에 아래의 코드를 추가했습니다.

	```swift
	self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern") ?? UIImage())
	```

	해당 코드가 적용된 self.view의 모습은 아래와 같습니다.

	<img src="https://user-images.githubusercontent.com/92504186/154877872-344f5d09-4555-492a-8012-29d34179970f.jpg" alt="SS 2022-02-21  11 13 23" width="20%;" />

3. ImageVie를 코드 작성해 생성하다보니, Project Run을 하지 않고는 어떻게 생성되었는지 확인이 힘들어 SwiftUI에서 사용하는 `ViewPreview` 구조체와 `ViewControllerRepresentable` 구조체를 선언해서 사용했습니다.

	```swift
	import SwiftUI
	
	struct ViewControllerRepresentable: UIViewControllerRepresentable {
	    typealias UIViewControllerType = ViewController
	    
	    func makeUIViewController(context: Context) -> ViewController {
	        return ViewController()
	    }
	    
	    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
	    }
	}
	
	@available(iOS 13.0.0, *)
	struct ViewPreview: PreviewProvider {
	    static var previews: some View {
	        ViewControllerRepresentable()
	            .previewLayout(.sizeThatFits)
	            .previewDevice("iPhone 13 Pro")
	    }
	}
	```

	해당 코드를 추가해 빌드시키고, Canvas를 켜면 아래와 같은 화면 구성으로 코드로 추가한 UI Object나 View들을 Preview로 직접 확인할 수 있습니다.

	<img src="https://user-images.githubusercontent.com/92504186/154898068-9537c11c-3e34-412c-894d-369e7944f3be.jpg" alt="SS 2022-02-21 PM 03 02 22" width="80%;" />

4. **card-back** 파일을 다운로드해 Assets에 추가하고, 각각의 카드를 저장할 `cards` 배열을 선언했습니다. 그리고 해당 card들을 card-back 이미지로 초기화하여 self.view에 추가해주는 메서드 `setImageView()` 를 아래와 같이 선언해주었습니다.

	```swift
	// class ViewController: UIViewController
	var cards = [UIImageView](repeating: UIImageView(), count: 7)
	
	func setImageView() {
	    for eachImageViewIndex in 0..<cards.count {
	        let xPosition = CGFloat(5*(1+eachImageViewIndex) + 50*eachImageViewIndex)
	        let currentFrame = CGRect(x: xPosition, y: 47, width: 50, height: 50*1.27)
	        cards[eachImageViewIndex] = UIImageView(frame: currentFrame)
	        cards[eachImageViewIndex].image = UIImage(named: "card-back")
	        self.view.addSubview(cards[eachImageViewIndex])
	    }
	}
	```

	그리고 ViewController 클래스의 `viewDidLoad()` 메서드에서 위의 메서드를 호출해주면 아래와 같은 앱 화면을 확인할 수 있습니다.

	<img src="https://user-images.githubusercontent.com/92504186/154899127-639d9fe3-b87b-4218-b05b-d3473a0963f1.jpg" alt="SS 2022-02-21 PM 03 12 40" width="20%;" />



---

### 📝추가 학습거리

- 생성한 뷰 7개를 StackView 내부에 넣어 균등하게 분할하도록 변경해본다.

	해당 학습거리 진행을 위해 먼저 StackView를 선언해주고 StackView 내부에 cards를 넣어주고 StackView의 프로퍼티를 설정해주는 `setStackView()` 메서드를 선언했습니다.

	```swift
	func setStackView() {
	    let stackView = UIStackView(arrangedSubviews: cards)
	    stackView.translatesAutoresizingMaskIntoConstraints = false
	    stackView.axis = .horizontal
	    stackView.distribution = .fillEqually
	    stackView.alignment = .fill
	    stackView.spacing = 5
	    self.view.addSubview(stackView)
	    stackView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 5).isActive = true
	    stackView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -5).isActive = true
	    stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
	    stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50*1.27).isActive = true
	}
	```

	이번에는 Auto-Layout 방식을 이용해 StackView의 상대적인 위치를 지정해주는 방법을 사용했고, 해당 코드를 추가한 후에 앱의 화면은 아래와 같이, 위에서 만들었던 모양과 일치하다는 것을 확인할 수 있습니다.

	<img src="https://user-images.githubusercontent.com/92504186/154917016-9b523994-39fa-46ce-bf37-68731a1ec11b.jpg" alt="SS 2022-02-21 PM 05 30 18" width="20%;" />

- `Info.plist` 를 변경하는 방식에 대해 학습하고 앱 표시 이름을 변경한다.

	**Info.plist** 파일은 실행 패키지에 관한 필수 설정 정보가 포함된 텍스트 파일입니다. 파일의 최상단을 보면 `Key`, `Type`, `Value` 를 확인할 수 있습니다.

	<img src="https://user-images.githubusercontent.com/92504186/154917315-dae1c288-f722-4a53-af6c-65a6c75332d4.jpg" alt="SS 2022-02-21 PM 05 32 20" width="30%;" />

	여기서 특정 Key의 Value를 수정하려면, Value를 더블클릭하여 수정할 수 있습니다. 

	앱의 표시 이름을 변경하기 위해서는 `Bundle name` 이라는 키의 값을 수정해야 하는데, 해당 키의 값을 **Sol Poker Game** 이라고 수정해보았고, 다음과 같이 앱 이름이 변경됐음을 확인할 수 있었습니다.

	<img src="https://user-images.githubusercontent.com/92504186/154918092-d8b4fd59-5855-4c4f-add1-746e1e3a9f68.jpg" alt="SS 2022-02-21 PM 05 36 58" width="20%;" />



---

### 🤔코드리뷰 후 추가 수정사항

1. 이렇게 다시 ImageView를 생성할 꺼면 위에 속성에 `var cards` 는 초기화할 필요가 없는게 아닐까요?

	cards를 초기화하지 않고 `var cards: [UIImageView]` 처럼 선언만 해주려고 했으나, cards는 클래스의 프로퍼티이므로 init() 메서드로 초기화해주어야 했습니다. 하지만 

	>1. 초기화 단계에서 view.addSubView() 메서드를 사용한다면 문제가 발생할 것이고, 
	>2. init() 에서는 cards 배열에 UIImageView를 넣고 view.addSubView() 메서드를 호출하기 위한 새로운 메서드를 생성하게 된다면 불필요하게 for loop를 두 번 사용하게 될 것

	위의 두 문제를 생각하여, cards를 빈 UIImageView 배열로만 선언해주고 아래와 같이 `setImageView()` 메서드를 수정했습니다.

	```swift
	func setImageView() {
	    guard let cardImage = UIImage(named: "card-back") else {return}
	    let maxNumberOfCards = 7
	    for eachImageViewIndex in 0..<maxNumberOfCards {
	        let xPosition = CGFloat(5*(1+eachImageViewIndex) + 50*eachImageViewIndex)
	        let currentFrame = CGRect(x: xPosition, y: 47, width: 50, height: 50*1.27)
	        let newImageView = UIImageView(frame: currentFrame)
	        newImageView.image = cardImage
	        self.view.addSubview(newImageView)
	        cards.append(UIImageView(frame: currentFrame))
	    }
	}
	```

	

2. 여기서 자주 사용되는 `50`이나 숫자값들을 의미있는 코드로 표현해보세요. 숫자만 보면 이게 어떤 의미인지 알 수 없으니 상수로 선언해서 어떤 의미인지 표현해주는 게 좋습니다.

	50을 `cardWidth`, 50*1.27을 `cardHeight`, 47을 `spacingFromTop` 상수로 선언하여 사용하도록 수정했습니다.
