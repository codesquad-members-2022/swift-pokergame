# swift-pokergame
## 게임보드 만들기
### 프로그래밍 요구사항
- 앱 기본 설정을 지정해서 StatusBar 스타일을 LightContent로 보이도록 한다.

<img src = "https://user-images.githubusercontent.com/44107696/154883554-2abc18cc-5da6-4233-8ab5-75bea973ef81.png" width="900" height="1190">
    * 다양한 속성 관련 Key 값들

<img src = "https://user-images.githubusercontent.com/44107696/154883533-1254ab12-79f7-43e7-b475-7aedb7413e34.png" width="800" height="700">
    * View controller-based status bar appearance 값을 false로 설정 (상태 표시줄 모양이 현재의 VC가 택한 스타일을 기반으로 할 것인지에 대한 Key이므로 Info 수정 시에는 필수로 false 필요)
    * Info plist가 아닌 preferredStatusBarStyle 프로퍼티를 오버라이드해서 VC 내에서 설정하는 방법 또한 존재
    * Status bar style Key의 값을 Light Content로 수정. 현재는 흰 배경이라 status bar가 묻혀서 보이지 않는 상태

- ViewController 클래스에서 self.view 배경을 다음 이미지 패턴으로 지정한다. 이미지 파일은 Assets에 추가한다.
- 다음 카드 뒷면 이미지를 다운로드해서 프로젝트 Assets.xcassets에 추가한다.

<img src = "https://user-images.githubusercontent.com/44107696/154883563-efe647f3-b152-45b6-888f-4792793dc2b9.png" width="940" height="810">
    * backgroundColor 설정 중 UIColor(patternImage:)를 활용하여 Asset의 이미지를 패턴화시켜 UIColor로 변환하여 적용
    * 배경 변경 후에는 Light Content로 수정된 StausBar도 색이 묻히지 않고 잘 표시됨

- ViewController 클래스에서 코드로 7개 UIImageView를 생성하고, 추가해서 카드 뒷면을 보여준다
    + 주의사항 우선 스택뷰StackView를 사용하지 말고 직접 UIImageView를 7개 생성해야 한다
- 화면 크기를 구하고 균등하게 7등분해서 이미지를 표시해야 한다
- 카드 가로와 세로 비율은 1:1.27로 지정한다

<img src = "https://user-images.githubusercontent.com/44107696/154883565-d531b979-8279-48a0-8fa4-fe496c7a52ec.png" width="1000" height="900">
    * class 프로퍼티로 카드 뒷면 Image, 값 변경이 가능한 xPosition 선언
    * ImageView 생성 함수 구현. 13pro의 가로값 390을 7개로 분할할 때, 카드 너비 54 / 카드 간 간격 2로 설정하면 정확히 나눠지므로 이를 토대로 카드의 너비와 높이 할당
    * frame을 통한 위치 설정 중 y 값은 50으로 고정
    * 7개의 카드를 만들기 위해 viewDidLoad에서 반복문을 통해 함수 호출

### 추가 구현사항
- 앱 기본 설정(Info.plist)을 변경하는 방식에 대해 학습하고 앱 표시 이름을 변경한다

<img src = "https://user-images.githubusercontent.com/44107696/154883567-2a4e1066-ae91-4d9f-a354-ba8afefaed30.png" width="800" height="890">
    * Info plist에서 BundleName 추가. 시뮬레이터 홈 화면에서 변경된 Yu-Gi-Oh!로 앱 이름 표시되는 것을 확인
    
- Stack View 추가
    + 추가 후 코드 변경되기 전의 코드
    ```swift
    class ViewController: UIViewController {
        private let cardImage = UIImage(named: "card-back")
        private var cardXPosition: Double = 0
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            if let pattern = UIImage(named: "bg_pattern"){
                self.view.backgroundColor = UIColor(patternImage: pattern)
            }
            
            for _ in 0...6{
                makeImageView()
            }
        }

        func makeImageView(){
            let cardWidth: Double = 54
            let cardHeight: Double = cardWidth * 1.27
            
            let imageView = UIImageView(frame: CGRect(x: self.cardXPosition, y: 50, width: cardWidth, height: cardHeight))
            imageView.image = self.cardImage
            
            // 나열을 위해 x 값 변경 (카드 가로 54 / 카드 간격 2 ; 13pro 가로 390)
            self.cardXPosition += 56
            
            self.horizonStack.addSubview(imageView)
        }
    }
    ```
    
    + Stack View에 맞춰서 코드 변경
        * StackView는 Auto layout을 적용해 내부에 배치된 view들을 배치하므로 subview 개개로 크기 등의 요소를 조절하는 것이 의미 없어지므로 makeImageView 함수는 imageView를 image 매개변수로 생성하고 addArrangedSubview를 통해 StackView의 stack에 추가하는 로직으로 수정
        * StackView의 높이는 7개의 subview 각각의 너비에 1.27배로 계산 (기존 카드의 너비 대비 높이가 나올 수 있도록). subview 간의 간격은 3, 동일 크기로 stackview를 채우도록 fill equally로 설정.
        
    ```swift
    class ViewController: UIViewController {
        private let cardImage = UIImage(named: "card-back")
        
        @IBOutlet weak var horizonStack: UIStackView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            horizonStack.frame.size.height = horizonStack.frame.width / 7 * 1.27
            horizonStack.distribution = .fillEqually
            horizonStack.spacing = 3
            
            if let pattern = UIImage(named: "bg_pattern"){
                self.view.backgroundColor = UIColor(patternImage: pattern)
            }
            
            for _ in 0...6{
                makeImageView()
            }
        }

        func makeImageView(){
            let imageView = UIImageView(image: self.cardImage)
            
            self.horizonStack.addArrangedSubview(imageView)
        }
    }
    ```


## 카드 클래스 구현하기
### 프로그래밍 요구사항
- 객체지향 프로그래밍 방식에 충실하게 카드 클래스(class)를 설계한다.
    + 속성으로 모양 4개 중에 하나, 숫자 1-13개 중에 하나를 가질 수 있다.
    + 모양이나 숫자도 적당한 데이터 구조로 표현한다. 클래스 혹은 Nested enum 타입으로 표현해도 된다.
    + 어떤 이유로 데이터 구조를 선택했는지 주석(comment)으로 구체적인 설명을 남긴다.
    + 카드 정보를 출력하기 위한 문자열을 반환하는 함수를 구현한다.
    + 문자열에서 1은 A로, 11은 J로, 12는 Q로, 13은 K로 출력한다.
    
    ```swift
    struct CardNumber{
        private let number: Int
        var changedNumber: String{
            switch number{
            case 1:
                return "A"
            case 11:
                return "J"
            case 12:
                return "Q"
            case 13:
                return "K"
            default:
                return number.description
            }
        }
        
        init(num: Int){
            number = num
        }
    }

    enum Shape: String{
        case heart = "♥️", case dia = "♦️", case spade = "♠️", case clover = "♣️"
    }
    ```
    * 숫자 값은 변환 값 외에 실제 숫자를 사용하는 경우도 있으므로 모두 보관할 수 있는 Struct로 고려 (enum은 상기의 목적을 이루기 위해 모든 숫자 나열 필요, 클래스는 참조나 고유 값 등이 필요하지 않으므로)
    * 문양은 4가지 밖에 안 되는 간단한 상황이므로 enum으로 고려
    
    ```swift
    class Card{
        private let number: CardNumber
        private let shape: Shape
        
        func cardInformation() -> String{
            let cardValue = shape.rawValue + number.changedNumber
            return cardValue
        }
        
        init(number: CardNumber, shape: Shape){
            self.number = number
            self.shape = shape
        }
    }
    ```
    * 문양과 숫자 정보를 합쳐서 리턴해주는 cardInformation 함수

- ViewController에서 특정한 카드 객체 인스턴스를 만들어서 콘솔에 출력한다
- 데이터를 처리하는 코드와 출력하는 코드를 분리한다
    + 랜덤으로 문양과 숫자를 선택해서 카드 인스턴스를 만들어주는 makeCardInfo 함수 구현
    + 전달받은 카드 인스턴스의 정보를 출력해주는 showCardInfo 함수 구현
    
    ```swift
    class ViewController: UIViewController {
        private let cardImage = UIImage(named: "card-back")
        
        @IBOutlet weak var horizonStack: UIStackView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            horizonStack.frame.size.height = horizonStack.frame.width / 7 * 1.27
            horizonStack.distribution = .fillEqually
            horizonStack.spacing = 3
            
            if let pattern = UIImage(named: "bg_pattern"){
                self.view.backgroundColor = UIColor(patternImage: pattern)
            }
            
            for _ in 0...6{
                makeImageView()
                let cardInfo = makeCardInfo()
                showCardInfo(card: cardInfo)
            }
        }

        func makeImageView(){
            let imageView = UIImageView(image: self.cardImage)

            self.horizonStack.addArrangedSubview(imageView)
        }
        
        func makeCardInfo() -> Card{
            let shapes: [Shape] = [.clover, .dia, .heart, .spade]
            let shapeRandomNum = Int.random(in: 0...3)
            let cardRandomNum = Int.random(in: 1...13)
            
            let cardInfo = Card(number: CardNumber(num: cardRandomNum), shape: shapes[shapeRandomNum])
            
            return cardInfo
        }
        
        func showCardInfo(card: Card){
            print(card.cardInformation())
        }
    }
    ``` 
    
<img src = "https://user-images.githubusercontent.com/44107696/155056906-3b59e657-5364-4444-8a31-51cdc8f0c61e.png" width="800" height="800">

### 수정사항
```swift
// 하나의 카드가 가지게 될 Card 인스턴스는 항상 고유한 값이 되어야 하므로 class로 설계
class Card: CustomStringConvertible{
    private let number: Card.CardNumber
    private let shape: Card.Shape
    
    var description: String{
        let cardValue = shape.description + number.description
        return cardValue
    }
    
    // 랜덤 문양, 숫자의 카드 인스턴스 초기화
    init(){
        guard let shapeRandomNum = Shape.allCases.randomElement() else{
            print("적절한 Case 값을 찾지 못하였습니다.")
            fatalError()
        }
        
        let cardRandomNum = Int.random(in: 1...13)
        
        self.number = CardNumber(num: cardRandomNum)
        self.shape = shapeRandomNum
    }
    
    // 변경해줘야 하는 값의 종류가 다소 많은 편이며, 카드의 값을 오로지 숫자로만 사용하는 놀이 등도 존재하므로 숫자와 문자열 모두 보관할 수 있는 형태를 생각함. 고유한 값으로 존재하거나 꼭 참조될 필요가 없으므로 Struct로 표현
    struct CardNumber: CustomStringConvertible{
        private let number: Int
        var description: String{
            switch number{
            case 1:
                return "A"
            case 11:
                return "J"
            case 12:
                return "Q"
            case 13:
                return "K"
            default:
                return number.description
            }
        }
        
        init(num: Int){
            guard num <= 13 || num != 0 else{
                print("적절하지 못한 값이 발견되었습니다 : \(num)")
                fatalError()
            }
            
            number = num
        }
    }

    // 4가지 문양밖에 없는 간단한 변환 처리이므로 enum으로 간소하게 표현
    enum Shape: CaseIterable, CustomStringConvertible{
        case heart, dia, spade, clover
        var description: String{
            switch self {
            case .heart:
                return "♥️"
            case .dia:
                return "♦️"
            case .spade:
                return "♠️"
            case .clover:
                return "♣️"
            }
        }
    }
}
``` 

- Card 인스턴스의 주요 프로퍼티의 타입인 CardNumber와 Shape은 Card 클래스와의 관계성이 높으며, 차후 재사용 가능성이 낮으므로 nested 형태로 수정
- CustomStringConvertible을 채택하고 description의 오버라이드를 통해 속성을 문자열 값으로 전달하도록 모든 커스텀 속성들 수정
- CardNumber는 인자로 Int를 받으니 Int.random 사용. Shape은 가지고 있는 속성들을 random으로 선택하는 로직을 구현하기 위해 caseIterable 프로토콜 채택 (케이스들을 순회할 수 있도록 만들어주며, allCases라는 모든 케이스를 배열로 담은 프로퍼티를 호출할 수 있음)
- guard 구문을 활용하여 예외사항에 대한 alert를 콘솔창에 띄워주며 더이상 작업이 진행되지 못하도록 fatalError 호출
- VC 내에서는 Card 인스턴스를 인자 없이 생성 가능하게 되었고, 출력 함수또한 description을 호출하는 형태로 변경
