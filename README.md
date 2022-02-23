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

### 수정사항 - (1)
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


### 수정사항 - (2)
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
    init(number: Card.CardNumber, shape: Card.Shape){
        self.number = number
        self.shape = shape
    }
    
    
    // 한정된 범위에 맞춰 enum 타입으로 수정
    enum CardNumber: CaseIterable ,CustomStringConvertible{
        case one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen
        var description: String{
            switch self {
            case .one: return "A"
            case .two: return "2"
            case .three: return "3"
            case .four: return "4"
            case .five: return "5"
            case .six: return "6"
            case .seven: return "7"
            case .eight: return "8"
            case .nine: return "9"
            case .ten: return "10"
            case .eleven: return "J"
            case .twelve: return "Q"
            case .thirteen: return "K"
            }
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
            
            if let cardInfo = makeRandomCardInfo(){
                showCardInfo(card: cardInfo)
            } else{
                let alert = UIAlertController(title: "잘못된 호출", message: "모양이나 숫자 입력이 잘못되었습니다. 다시 확인해주세요.", preferredStyle: UIAlertController.Style.alert)
                self.present(alert, animated: true)
            }
        }
    }

    func makeImageView(){
        let imageView = UIImageView(image: self.cardImage)

        self.horizonStack.addArrangedSubview(imageView)
    }
    
    func makeRandomCardInfo() -> Card?{
        guard let cardRandomShape = Card.Shape.allCases.randomElement(), let cardRandomNum = Card.CardNumber.allCases.randomElement() else{
            return nil
        }
        
        let cardInfo = Card(number: cardRandomNum, shape: cardRandomShape)
        
        return cardInfo
    }
    
    func showCardInfo(card: Card){
        // description 생략 시에도 description을 가져와서 출력
        print(card)
    }
}
``` 

- CardNumber 또한 한정된 범위를 지니고 있으므로 enum 타입으로 수정
- 범용성이 떨어졌던 이전 수정의 이니셜라이저는 상위의 값을 전달받아 할당해주는 형태로 수정. (차후에는 Int, String 등을 받은 걸 변환시켜 할당하는 요소도 추가 고려 중)
- makeCardInfo 함수는 makeRandomInfo 함수로 이름을 변경, 이에 맞춰 적절한 범위 내의 랜덤 값을 변환하여 Card에 값을 전달하도록 수정. 잘못된 값이 들어갈 경우 nil로 전달하도록 리턴 타입은 Card?
- Card 인스턴스 생성 시, nil이 들어갈 경우 alert를 통해서 재입력 부탁 메세지 출력


## 카드덱 구현하고 테스트하기
### 기능 요구사항
- 앞서 만든 모든 종류의 카드 객체 인스턴스를 포함하는 카드덱 구조체를 구현한다.
- 객체지향 설계 방식에 맞도록 내부 속성을 모두 감추고 다음 인터페이스만 보이도록 구현한다.
    + count 갖고 있는 카드 개수를 반환한다.
    + shuffle 기능은 전체 카드를 랜덤하게 섞는다.
    + removeOne 기능은 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
    + reset 처음처럼 모든 카드를 다시 채워넣는다.

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
                
                if let cardInfo = makeRandomCardInfo(){
                    showCardInfo(card: cardInfo)
                } else{
                    let alert = UIAlertController(title: "잘못된 호출", message: "모양이나 숫자 입력이 잘못되었습니다. 다시 확인해주세요.", preferredStyle: UIAlertController.Style.alert)
                    self.present(alert, animated: true)
                }
            }
        }

        func makeImageView(){
            let imageView = UIImageView(image: self.cardImage)

            self.horizonStack.addArrangedSubview(imageView)
        }
        
        func makeRandomCardInfo() -> Card?{
            guard let cardRandomShape = Card.Shape.allCases.randomElement(), let cardRandomNum = Card.CardNumber.allCases.randomElement() else{
                return nil
            }
            
            let cardInfo = Card(number: cardRandomNum, shape: cardRandomShape)
            
            return cardInfo
        }
        
        func showCardInfo(card: Card){
            // description 생략 시에도 description을 가져와서 출력
            print(card)
        }
    }
    ``` 
    * CardDeck에는 52장의 카드를 담을 deck 프로퍼티와 드로우된 카드들을 기록하는 removedCards로 구현 (덱에서 나간 카드들은 현실에서도 어떤 카드인지 공개되지 않으므로 private 설정 후, 어떤 메서드로도 내부를 볼 수 있는 로직 구현하지 않음)
    * count 구현, 보통 개수는 출력과 관련되는 경우가 많으므로 return 값 설정
    * shuffle 구현, Fisher-Yates shuffle 알고리즘에 맞춰 랜덤 값으로 나온 인덱스의 value를 신규 덱에 넣고 기존 덱에서는 삭제. 이를 기존 덱이 빌 때까지 반복한 뒤, 반복이 끝나면 신규 덱을 기존 덱에 할당
    * reset 구현, 빠진 카드들을 다시 주워담아서 합치는 형태로 구현했으며 빠진 카드가 없으면 괜히 로직이 실행되지 않도록 guard 구문 작성
    * removeOne 구현, 보통 카드를 드로우할 때에는 맨 뒷장이 빠지므로 removeLast로 구현. 남은 카드가 없을 수도 있으므로 리턴은 옵셔널 Card
    * 카드 구성은 기본적으로 52장 세팅이므로 4개의 문양 별로 13장의 카드 생성 로직 구성

- 상위 모듈에서 카드덱 기능을 확인할 수 있도록 테스트 코드를 추가한다
- XCTest 같은 단위 테스트가 아니라, 카드덱 함수를 호출해서 원하는 데로 동작하는지 확인할 수 있는 코드를 작성한다
    + 테스트 시나리오와 비슷한 형태로 테스트 구문 구현 ( guard 조건 시, 아래 구문 미실행 부분들도 추가로 검토 진행함 )
    
    ```swift
    func testCardDeck(){
        // 카드 초기화
        var deck = CardDeck()
        // 초기화 카드 수 52장 확인
        let firstDecks = deck.count()
        
        // 카드 셔플
        deck.shuffle()
        
        deck.reset()
        
        // 카드 뽑기
        let card1 = deck.removeOne()
        let secondDecks = deck.count()
        
        // 카드 또뽑기
        let card2 = deck.removeOne()
        let thirdDecks = deck.count()
        
        // 카드 리셋
        deck.reset()
        let fourthDecks = deck.count()
    }
    ```

<img src = "https://user-images.githubusercontent.com/44107696/155133976-84732446-1b2b-4fbf-8ec3-169ef4477fbc.png" width="800" height="800">

### 수정 사항
- CardDeck init 코드 단순화를 위해 forEach 구문을 활용한 형태로 수정
- VC 내 Card 생성 구문의 변수명 cardInfo -> card로 변경 (카드 자체를 생성하는 로직이므로 혼선 없도록 변수명 변경)

```swift
init(){
    let cardShapes = Card.Shape.allCases
    let cardNumbers = Card.CardNumber.allCases
        
    cardShapes.forEach{ shape in
        cardNumbers.forEach{ number in
            let card = Card(number: number, shape: shape)
            deck.append(card)
        }
    }
    
    deck.sort(by: { card1, card2 in
        card1.description > card2.description
    })
}
``` 


## 게임로직 구현하기
### 프로그래밍 요구사항
- 포커 딜러가 나눠줄 수 있는 게임 방식을 선택할 수 있다
    + 게임은 7카드-스터드 방식과 5카드-스터드를 지원한다
- 참가자는 딜러를 제외하고 1명에서 4명까지 참여할 수 있다
- 딜러는 이름이 없고, 참가자는 영문 2~5글자 이내 이름을 가진다 (crong, honux, jk 등)
    + 인원이 결정되면 랜덤하게 이름을 생성한다
- 카드게임 종류와 참가자수에 따라 적절하게 동작을 해야한다
- 딜러가 딜러 자신을 포함해서 참여자에게 카드를 나눠주고도, 전체 카드가 남은 경우는 계속해서 게임을 진행한다
- 한 번 나눠준 카드는 다시 덱에 넣지 않고 카드가 부족할 경우 종료한다
- 카드 개수나 참가자 인원에 대한 입력을 구현할 필요없다
- XCTest를 위한 테스트 타깃을 추가한다
- 테스트 코드에서 PokerGame 메소드를 호출해서 동작을 확인한다

### 딜러 / 플레이어 구현
- 딜러의 role / 플레이어의 name은 표시되어야 하므로 internal로 접근 설정을 하되, 상수로 선언하여 차후 수정이 불가하도록 함
- 딜러는 카드덱을 소유 (보통 카지노에서 딜러가 카드덱을 소유하고 관리하는 것을 차용)
- 딜러가 giveCard를 통해 card를 넘기면 플레이어는 receiveCard를 통해 해당 card를 자신의 카드더미에 넣는다
- 이후 패 확인은 checkingCards를 통해서 공개
- (수정) 가지고 있는 패를 전부 버리는 removeCards 함수 추가

```swift
class Player{
    let name: String
    private var cards: [Card] = []
    
    // 딜러가 주는 카드를 받을 때 사용되는 함수
    func receiveCard(card: Card){
        cards.append(card)
    }
    
    // 결과 확인을 위해 패를 깔 때 사용되는 함수
    func checkingCards() -> [String]{
        var cardsDescription: [String] = []
        
        cards.forEach{ card in
            cardsDescription.append(card.description)
        }
        
        return cardsDescription
    }
    
    // 게임 완료 후, 현재 패 버리기
    func removeCards(){
        self.cards.removeAll()
    }

    init(randomName: String){
        name = randomName
    }
}

``` 

```swift
class Dealer{
    let role = "Dealer"
    private var cards: [Card] = []
    private var cardDeck: CardDeck = CardDeck()
    
    func giveCard() -> Card?{
        guard let card = cardDeck.removeOne() else{
            return nil
        }
        return card
    }
    
    func shuffleCardDeck() -> Int{
        self.cardDeck.shuffle()
        
        return self.cardDeck.count()
    }
    
    func checkingCards() -> [String]{
        var cardsDescription: [String] = []
        
        cards.forEach{ card in
            cardsDescription.append(card.description)
        }
        
        return cardsDescription
    }
    
    func receiveCard(card: Card){
        cards.append(card)
    }
    
    func removeCards(){
        self.cards.removeAll()
    }
}

```

### PockerGame 구현
- 구현 중, Card 외에는 가지고 있는 데이터를 중점으로 고유성을 띄기보다는 각 인스턴스 간의 교류를 통한 데이터의 변화가 잦은 형태를 띄어 Card를 class -> struct, 나머지 객체들은 class로 수정하거나 구현함
- variant와 entries는 각각의 enum을 통해 한정된 게임방식과 인원 수를 가지도록 선언. inHandCards는 모든 참가자가 손에 들고있는 카드들을 기록하고자 한 Dic 타입이며, canPlayGame은 카드가 떨어지기 전까지 게임을 진행시키기 위한 Bool 타입.
- Player의 랜덤 네임 생성은 String 타입을 extension하여 함수 추가
- divideCards 함수는 모든 player에게 한장씩 카드를 나눠준 후, 마지막에 딜러가 카드를 가지는 로직. showAllCardInHand 함수는 모든 카드를 나눠가진 후, 현재 들고있는 카드들을 오픈하는 로직으로 이를 하나의 문자열로 바꿔서 리턴.
- playPockerGame 함수는 셔플 -> 카드 떨어질 때까지 게임 진행 -> 게임 중 카드 돌리기 / 모든 카드 나눠주면 서로 패 오픈 로직으로 구현
- (추가) 한 게임이 끝나면 참여자들의 카드를 inHandCards에 할당하는 overOneGame 함수, inHandCards의 값을 String 한 줄로 표현해주는 showAllCardInHand 함수, 한 게임이 끝나면 모두가 들고있는 카드를 버리는 clearGame 함수 추가

```swift
class PockerGame{
    private var variant: PockerGame.Variants
    private var entries: PockerGame.Entries
    private var dealer = Dealer()
    private var players: [Player] = []
    
    private var inHandCards = [String:[String]]()
    private var canPlayGame = true
    
    func playPockerGame(){
        // 현재 판 수
        var nowPlay = 1
        // 시작에 앞서 딜러가 카드를 셔플하고 52장 맞는지 확인
        let _ = dealer.shuffleCardDeck()
        
        // 카드덱이 떨어질 때까지 게임 진행 반복
        while canPlayGame{
            // 5장 or 7장 나눠주기
            for _ in 0..<variant.rawValue{
                divideCards()
            }
            
            overOneGame()
            let show = showAllCardInHand()
            
            nowPlay += 1
            clearGame()
            
        }
    }
    
    func divideCards(){
        players.forEach{ player in
            guard let card = dealer.giveCard() else{
                self.canPlayGame = false
                return
            }
            
            player.receiveCard(card: card)
        }
        
        if let card = dealer.giveCard(){
            dealer.receiveCard(card: card)
        } else{
            self.canPlayGame = false
        }
    }
    
    func overOneGame(){
        // 한게임 마무리 시, 현재 참여자들의 카드를 inHandCards에 할당
        players.forEach{ player in
            inHandCards[player.name] = player.checkingCards()
        }
        inHandCards[dealer.role] = dealer.checkingCards()
    }
    
    func showAllCardInHand() -> String{
        var showAll = [String]()
        
        inHandCards.forEach{ playerAndDealer in
            let name = playerAndDealer.key
            let cards = playerAndDealer.value.joined(separator: ",")
            showAll.append("\(name) : \(cards)")
        }
        
        showAll.sort(by: < )
        
        return showAll.joined(separator: " | ")
    }
    
    func clearGame(){
        // 이번 판의 카드들 전부 해제
        inHandCards.removeAll()
        
        players.forEach{ player in
            player.removeCards()
        }
        dealer.removeCards()
    }
    
    init(variant: PockerGame.Variants, entries: PockerGame.Entries){
        self.variant = variant
        self.entries = entries
        
        for _ in 0..<self.entries.rawValue{
            let name = String.makePlayerName()
            let player = Player(randomName: name)
            self.players.append(player)
        }
    }
    
    enum Variants: Int{
        case fiveCardStud = 5, sevenCardStud = 7
    }
    
    enum Entries: Int{
        case one = 1, two = 2, three = 3, four = 4
    }
}

extension String{
    static func makePlayerName() -> String{
        let alphabet: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
        let nameLength = Int.random(in: 2...5)
        var name: [String] = []
        
        for _ in 0..<nameLength{
            if name.isEmpty{
                let upperCase = alphabet.randomElement()?.uppercased()
                name.append(upperCase ?? "1")
            } else{
                name.append(alphabet.randomElement() ?? "1")
            }
        }
        
        return name.joined()
    }
}
```

### 테스트코드 구현
- divide 함수 확인
<img src = "https://user-images.githubusercontent.com/44107696/155286517-225b7626-ea74-42ae-a8ba-a3730eefd1cf.png" width="800" height="1300">

- overOneGame, showAllCardHand 함수 확인
<img src = "https://user-images.githubusercontent.com/44107696/155286525-f968426c-3c10-4281-9285-db4ba7951da0.png" width="800" height="1300">

- clearGame 함수 확인
<img src = "https://user-images.githubusercontent.com/44107696/155286531-326fd4c8-ae7f-402f-9e8a-a67d064a6574.png" width="800" height="1300">

- playPockerGame 함수 확인
<img src = "https://user-images.githubusercontent.com/44107696/155286533-38a16172-d6b5-4c73-9471-2b3fd2c329e5.png" width="800" height="1300">
