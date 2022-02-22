# swift-pokergame

- - -

## 2주차 카드게임 만들기 

### 학습목표
`Step01`
- 화면 크기에 따라 뷰를 균등하게 분리해서 생성할 수 있다
- 이미지 뷰에 content mode에 대해 학습하고 원하는 비율로 표시할 수 있다
- 이미지를 배경에 패턴으로 추가할 수 있다
- 코드로 뷰를 추가한 다음에, 추가학습으로 UIStackView에 대해 학습하고 뷰를 균등하게 나눠서 표시할 수 있다

### 학습 키워드
- StatusBar: 화면의 상단 가장자리에 표시되며 시간, 이동통신사. 네트워크 상태와 같은 디바이스의 현재 상태에 대한 정보를 제공해줍니다.
  - HIG 
  - 사람들은 status Bar의 형식이 바뀌면 혼란스러울 수 있다 -> 괜히 커스텀으로 status Bar를 건들이지 말기.
  - Status Bar Status에는 Light Status,Dark Status가 있다 앱 스타일에 맞추어서 적절히 조정하자. [UIStatusBarStyle](https://developer.apple.com/documentation/uikit/uistatusbarstyle)
  - Status bar의 배경은 투명해서 그 안에 있는 콘텐츠를 표시할 수 있게 된다. status bar를 읽을 수 있게 유지하고 콘텐츠가 상호작용 할 수 있다는 것을 암시 하지 말라.
  - 사용자가 미디어에 집중하려고 할때 방해를 해서는 안되므로 status Bar를 일시적으로 숨기기(Ex 전체화면..)
  - status bar를 영구적으로 숨겨서는 안된다. 이용자들이 간단하고 쉬운 제스처로 숨겨진 status bar를 표시하도록 해야한다.
  - status bar를 이용해서 네트워크 활동을 나타낸다.
  ![스크린샷 2022-02-21 오전 11 03 42](https://user-images.githubusercontent.com/80263729/154877103-88ce7663-a3a0-489d-8009-99fa0f027a24.png)

-: Super View좌표계에서 View의 위치와 크기를 나타낸다  
-Bounds: 자신의 좌표계에서 View의 위치와 크기를 나타낸다.  
[Frame vs Bound](https://babbab2.tistory.com/44)

- [X] 앱 기본 설정을 지정해서 StatusBar 스타일을 LightContent로 보이도록 한다.
 
 앱의 기본설정으로 가서 statusBar Style을 Light content로 바꾸어보았다.이때 Status bar Style만 바꿔서 안되고 그림과 같은 속성을 NO로 하여 추가해준다.
 이후 바꾸고 싶은 곳에서 밑과같이 코드를 작성해준다 
 ~~~swift
 // StatusBar 색상 변경
UIApplication.shared.statusBarStyle = .lightContent
UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)
// StatusBar Hidden
UIApplication.shared.isStatusBarHidden = true
UIApplication.shared.setStatusBarHidden(true, with: .slide) // .none, .slide, .fade
 ~~~

![스크린샷 2022-02-21 오후 9 12 18](https://user-images.githubusercontent.com/80263729/154953041-f4eaf688-c6aa-468f-b9de-e85e9d6690ee.png)

- 코드로 구현하는 방법: 위에서 No로 설정한 View controller-based status bar appearance를 Yes로 둔다.
ViewController에 밑과같이 함수를 재정의 하니 성공적으로 실행이 됬다.(UIStatusBarStyle은 get only라 viewDidLoad같은데서 값을 바꾸려하면 에러가뜸.)

![스크린샷 2022-02-21 오후 12 28 13](https://user-images.githubusercontent.com/80263729/154884387-571ff9bc-e52c-404e-8b9f-368fcf83a6e6.png)

[코드 출처](https://mrgamza.tistory.com/630)

- [X] ViewController 클래스에서 self.view 배경을 정해진 이미지 패턴으로 지정한다. 이미지 파일은 Assets에 추가한다. 
- `배경을 설정하는 것이지만 BackgroundColor에 지정을 해주어야하고 이는 곧 UIColor를 넣어야하는 것이기에 네이밍에 주의한다`
  - 코드  
  ![스크린샷 2022-02-21 오후 12 14 25](https://user-images.githubusercontent.com/80263729/154883268-ce619db7-75f8-4205-afd5-389917e03a2c.png)  
  ![스크린샷 2022-02-21 오후 12 14 54](https://user-images.githubusercontent.com/80263729/154883299-28b9ddb1-e089-4cf7-b1d7-1e90b9b2ee28.png)  


  - 구현화면

![스크린샷 2022-02-21 오후 12 29 47](https://user-images.githubusercontent.com/80263729/154884530-751654db-155e-4b46-9ccc-35f0c7f0562a.png)

- [X] 다음 카드 뒷면 이미지를 다운로드해서 프로젝트 Assets.xcassets에 추가한다.
- [X] ViewController 클래스에서 코드로 7개 UIImageView를 생성하고, 추가해서 카드 뒷면을 보여준다
- [X] 화면 크기를 구하고 균등하게 7등분해서 이미지를 표시해야 한다
- [X] 카드 가로와 세로 비율은 1:1.27로 지정한다
  1. 화면의 가로길이를 구하기 위해 `self.view.frame.width` 명령어를 print해보니 390.0이라는 수치가 나왔다.
  braek point를 이용해서도 구해봤다.  
  
  ![스크린샷 2022-02-21 오후 4 37 27](https://user-images.githubusercontent.com/80263729/154909473-df36fa2d-ef09-477e-a959-ea4823e3cb75.png)

  2. 코드로 작성해야기 때문에 imageView를 만들고 그안에 image를 넣는 밑과 같은 코드를 7개 만든다. 
 ![스크린샷 2022-02-21 오후 5 17 14](https://user-images.githubusercontent.com/80263729/154914870-c16eb815-bf4e-4283-b385-51dbfc89563c.png)

  3. 위에서 구한 값이 390.0이니 나누기 7대신 8을 함으로써 이미지들 사이에 공백을 만들도록 한다.
  4. 밑과 같은 constraint를 설정하는 함수를 구한하고 viewDidLoad에서 호출한다.
  
  ![스크린샷 2022-02-21 오후 5 18 29](https://user-images.githubusercontent.com/80263729/154915047-5606ae4e-5b02-48da-9b46-b0a72e3f72a7.png)

 - 결과
   ![스크린샷 2022-02-21 오후 5 21 01](https://user-images.githubusercontent.com/80263729/154915448-fd1e36e8-97f3-423a-a235-4c35c659168c.png)

- 추가 학습거리
  - 앱 기본 설정(Info.plist)을 변경하는 방식에 대해 학습하고 앱 표시 이름을 변경한다.
  - Target의 general에 가면 Display Name을 바꿀 수 있다.
![스크린샷 2022-02-21 오후 9 19 50](https://user-images.githubusercontent.com/80263729/154954137-79c52da6-45b9-4bef-a8ec-50e903e0a882.png)
  
  - 앱이름을 변경할 때 info.plist에 가면 BudleDisplayName과 BundleName도 있고 Value는 PRODUCT_NAME이라 되있고 상당히 혼란스러웠다
    - [여기](https://docs.unrealengine.com/udk/Three/UDKInfoPListApple_iOSKR.html)를 참고하여 많은 이해가 되었다.
    - [공식문서](https://developer.apple.com/documentation/bundleresources/information_property_list/cfbundlename) 
  
  - 프로젝트의 Assets.xcassets 안의 json알아보기
  
  ![스크린샷 2022-02-21 오전 11 45 26](https://user-images.githubusercontent.com/80263729/154880659-01e153b6-4e81-48ef-870c-1f79431e3092.png)
  이런 Asset을 가지고 있다고 했을때 프로젝트안에 들어가보면 이런식으로 폴더로 구분이 되어있고 Json파일이 생겨있음을 알수 있다.
  
  ![스크린샷 2022-02-21 오전 11 46 19](https://user-images.githubusercontent.com/80263729/154880753-3b734f33-3937-4026-848f-0d17e23187c5.png)  
  폴더들은 그렇다 쳐도 Json파일들은 대체 뭘까?
  `현재 Asset에 있는 이미지들의 상황을 나타내준다`  
  예를들어 card_back이라는 이미지의 폴더의 json을 열어보면 현재 이미지가 x3에 세팅이 되어있음을 알수있는 것이다  
  심지어 실시간으로 바뀌기 때문에 만약 xcode에서 내가 이미지를 x1으로 세팅하면..  
  
  JSON파일도 바로 바뀌는 걸 볼수 있다.
  ![스크린샷 2022-02-21 오전 11 49 46](https://user-images.githubusercontent.com/80263729/154881080-ccbb8bab-a149-4472-884a-d2e07312a750.png)
  
  - AutoLayout없이 카드 배치해보기
    - UIImageView(frame:)을 이용하면 설정한 값으로 위치와 크기를 정해서 View에 올릴 수 있다.
    - 위 메서드 안의 frame을 자세히보면 CGRect(x:,y:,width:,:height:)기 되는데 여기서 x,y는 만드는 사각형의 오른쪽 밑 꼭지점이다.(이를 인지 안하면 사각형이 엉뚱한 위치에 있거나 잘릴 수 있다)
  
  - - -
  
 `Step02`
### 학습목표
- 객체지향 프로그래밍(Object-oriented Programming) 방식에 대해 학습고 필요한 역할을 담당하는 객체를 설계할 수 있다
- 데이터를 추상화하기 위한 설계 방식을 학습하고 원하는 구조로 표현할 수 있다
- 객체 내부 데이터 타입과 출력할 때 사용할 데이터를 구분해서 사용할 수 있다
- 유니코드에 대해 학습하고 코드에 활용할 수 있다

### 요구사항 

- [X] 객체지향 프로그래밍 방식에 충실하게 카드 클래스(class)를 설계한다.
- [X] 속성으로 모양 4개 중에 하나, 숫자 1-13개 중에 하나를 가질 수 있다.
- [X] 모양이나 숫자도 적당한 데이터 구조로 표현한다. 클래스 혹은 Nested enum 타입으로 표현해도 된다.
- [X] 어떤 이유로 데이터 구조를 선택했는지 주석(comment)으로 구체적인 설명을 남긴다.
- [X] 카드 정보를 출력하기 위한 문자열을 반환하는 함수를 구현한다.
- [X] 문자열에서 1은 A로, 11은 J로, 12는 Q로, 13은 K로 출력한다.
- [X] ViewController에서 특정한 카드 객체 인스턴스를 만들어서 콘솔에 출력한다
- [X] 데이터를 처리하는 코드와 출력하는 코드를 분리한다

### 학습키워드

- Value Semantics, Copy-by-Value Semantics  

[출처:유용하님의 스위프트 성능 이해하기](https://haningya.tistory.com/382) 를 시청하면서 키워드들을 살펴보자

- (Semantics? -> 프로그램이 무엇을 어떻게 수행할지를 나타내며, 특정 기능의 의미가 다른 부분의 상호연관에 의해서 설명되는 경우가 많다.  
[Semntics vs Syntax](https://leadbiz.tistory.com/377)
- Value Type의 특징
  - 변수 할당시 Stack에 값 전체가 저장됨
  - 다른 변수에 할당될 때 전체가 값이 복사됨(copy by value)
  - Heap을 안쓰기 때문에 Reference Counting도 필요 없음  
`'값'에 의해 구분된다`
- Value semantics에서는 Identity가 아니라 Value가 중요하다
- 각 변수는 Value에 의해 구분이 되어야 한다.
- 따라서,, 동치관계여야한다 -> Equatable을 구현해보면 확인이된다.
- Thread간 의도하지 않은 공유로부터 안전하다!(왜냐하면 값이 복사가 되기 떄문!)
![스크린샷 2022-02-22 오후 2 25 01](https://user-images.githubusercontent.com/80263729/155068428-946e5893-a538-4b9c-b3cc-75f0125de301.png)  


- 값을 모조리 카피해버리면 성능에 문제가 생기지 않을까? 🤔  
`Copy는 빠르다` 
- 컴퓨팅 성능의 상승으로 Copy자체는 매우 빠른 속도로 해결이 가능하다
- 기본타입들(enum,typle,struct)은 엄청나게 큰 데이터가 아닌 이상은 정해진 시간(constant time)안에 끝난다.

- 내부데이터가 Heap과 혼용하는 struct의 경우
  - 정해진 시간 + referenct copy등의 시간
  - String,Array,set,Dictionary등
  - 쓰기 시 Copy-on-write로 속도 저하 보완

- immutable(불변)을 사용하면 되지 않나? 🤔 
왜냐하면 참조형이어도 값이 붋변하면 Thread간에 문제가 생길일이 없다.
실제로 immutable은 cocoa에서도 꽤 써왔다. 
하지만 계속 개체를 생성하고 합치는 과정은 비효율적임

<img src = "https://user-images.githubusercontent.com/80263729/155069852-b92f9ce6-2a34-49c6-a6e1-be418273ade4.png" width="40%"/> <img src = "https://user-images.githubusercontent.com/80263729/155070945-7c5a325c-8680-42ab-9b78-7007f5acbff1.png" width="40%" height="250"/>

- 그럼 대체 class는 언제 사용하나? 🤔 
  - value보다 identity가 중요한 경우
    - UIView 같이 모든 변수에서 단 하나의 state를 갖는 개체
  - OOP 모델
  - Objective-C 연동
  - indirect storage

- - - 

### 성능에 영향을 미치는 3가지
- Memory Allocation: Stack or Heap -> **메모리를 어디다가 할당할것인가**
- Reference Counting: No or Yes -> **Referenc Count를 사용하나 안하나**
- Method dispatch: Static or Dynamic -> **Method를 호출 할때 컴파일 타임에 할지 런타임에 할지**

`Heap 할당,Stack 할당`
- Heap 메모리에 할당시 빈곳을 찾고 관리하는 것은 복잡한 과정을 수반한다.
  - 따라서, 크기가 큰 Loop를 돌면서 Heap메모리에 할당하는 작업은 성능을 크게 떨어뜨릴 수 있다.
- 그 과정이 thread safe해야 한다는 점이 가장 큰 문제
  - lock 등의 synchronization동작은 큰 성능 저하 요소
- Stack 할당은 단순히 스택 포인터 변수값만 바꾸면 되기 때문에 `Heap할당보다는 간편한? 과정을 가진다.`

`Reference Counting`
- 정말 자주 실행된다 Ex) 변수가 Copy될 때마다
- `thread safety문제가 발생할 수 있다.`
  - 카운트를 Atomic하게 늘리고 줄여주는 것이 필요하다.

`Method Dispatch(Static)`
- 컴파일 시점에 메소드 실제 코드 위치를 안다면 실행중(runtime) 찾는 과정 없이 해당 코드 주소로 점프 할 수 있다.
- 컴파일러의 최적화, `메소드 인라이닝(inlining)가능`
  - 메소드 인라이닝?: 컴파일 시점에 메소드 호출부분에 메소드 내용을 inline하게(한줄로 그냥 쭈욱) 붙여넣는다. -필요한 경우에만
  - **장점**
  - 일반적인 함수들은 런타임에 호출 하여 그 주소로 점프해서 넘어간다음 다시 원래 주소로 돌아오는데 이런 오버헤드를 줄일 수 있게 된다.
  - Call Stack 오버헤드를 줄인다
    - CPU icache나 레지스터를 효율적으로 쓸 가능성이 높아진다
  - 컴파일러의 추가 최적화 가능
    - 최근 메서드들이 작으므로 기회가 많다
    - 루프 안에서 불리는 경우 큰 효과를 본다
    - 개념적인 과정

<img width="45%" alt="스크린샷 2022-02-22 오후 3 14 58" src="https://user-images.githubusercontent.com/80263729/155073702-afe28889-569c-48e4-be5b-1118270f7d36.png"><img width="45%" alt="스크린샷 2022-02-22 오후 3 15 21" src="https://user-images.githubusercontent.com/80263729/155073749-1a2e67e5-5271-4161-811d-67d8c64ecbe7.png">

`Method Dispatch(Dynamic)`
- 컴파일 시점에 실제 Type을 알 수 없다, 때문에 코드 수조를 runtime에 알아야한다.

<img width="45%" alt="스크린샷 2022-02-22 오후 3 19 07" src="https://user-images.githubusercontent.com/80263729/155074205-74a03dd9-5542-4cc5-ba61-f6f2f4ce97ba.png"><img width="45%" alt="스크린샷 2022-02-22 오후 3 19 12" src="https://user-images.githubusercontent.com/80263729/155074217-e2f9a137-0640-429e-8e69-823ed118056b.png">

- Static에 비해 이것이 문제이다. 사실 Thread saftety도 문제가 없다.
- 하지만 `컴파일러가 최적화를 못하는 것` 이 문제
- 특히 `Objective-C` 가 이 방식을 택하기 때문에 문제가 

<img width="60%" alt="스크린샷 2022-02-22 오후 3 43 55" src="https://user-images.githubusercontent.com/80263729/155077186-6e431d1e-4096-43f9-86cb-e8d50186729c.png">

- Static Dispatch로 강제할 수 있는 방법이 있다.
  - final, private등을 쓰는 버를
    - 해당 메소드,프로퍼티는 상속되지 않기 때문에 static하게 처리한다.
  - dynamic 쓰지 않기
  - objc연동 최소화
  - WMO(whole module optimization)활용
    - 빌드시에 모든 파일을 한번에 분석하여, Static dispatch로 변환 가능한지 등을 판단하여 최적화 한다.

- 정리
  - Memory Allocation: `Stack or Heap`
  - Reference Counting: `NO or Yes`
  - Method Dispatch: `Static or Dynamic` 


- 추상화 기법에 따라 앞서 나온 성능들을 어떻게 활요하고 있는가?
- `class`  
- 단, `final class`는 Method Dispatch를 Static으로 바꿀 수 있다.

<img width="70%" alt="스크린샷 2022-02-22 오후 3 50 22" src="https://user-images.githubusercontent.com/80263729/155077987-4f602a1b-73ca-4c30-9bf5-e93ef9a037af.png">

- `Struct`  
  - 참조 타입이 없는 Struct
 <img width="70%" alt="스크린샷 2022-02-22 오후 3 51 48" src="https://user-images.githubusercontent.com/80263729/155078182-24b2f270-b3f9-4729-970f-951ff8fb2530.png">
 
  - 참조 타입이 있는 Struct  
  중요한 것은 `Reference Count가 struct안에 참조 타입의 property수만큼 많아진다는 것!`   
    
  <img width="45%" alt="스크린샷 2022-02-22 오후 3 54 07" src="https://user-images.githubusercontent.com/80263729/155078487-ed7495dd-ac38-40ce-9aca-b48b232eed15.png"><img width="45%" alt="스크린샷 2022-02-22 오후 3 54 37" src="https://user-images.githubusercontent.com/80263729/155078569-5d1ed6a9-fb51-4eca-af33-ff88fb9ab23c.png">
  
<img width="70%" alt="스크린샷 2022-02-22 오후 4 00 32" src="https://user-images.githubusercontent.com/80263729/155079337-7f52d7b2-09c3-45a4-9671-b976b6db04b6.png">

- Struct내에 참조 타입을 줄일 수는 없을까? 🤔 
  - 값의 제한이 가능하면 enum등의 Value type으로 변경하기
  - 다수의  class들을 하나으 class로 묶기.

- `Protocol Type`
  - 코드 없이 API만 정의함
  - 상속 없는 다형성 (Polymorphism) 구현 가능
  - `Value 타입인 struct에도 적용가능`
    - Value semantics에서의 다형성  
    <img width="70%" alt="스크린샷 2022-02-22 오후 4 06 00" src="https://user-images.githubusercontent.com/80263729/155080083-3c44f23f-9d88-48a4-b13e-26d818ba93ee.png">
- class는 주소값이라 모두 같은 사이즈라 하지만 Struct는 사이즈가 다다를텐데 어떻게 메모리를 할당하고 저장할까? 🤔 

<img width="70%" alt="스크린샷 2022-02-22 오후 4 14 52" src="https://user-images.githubusercontent.com/80263729/155081272-2a9971ee-7ffa-4170-ae9d-677e67b7ec94.png">

- `Existential Container`

<img width="70%" alt="스크린샷 2022-02-22 오후 4 16 40" src="https://user-images.githubusercontent.com/80263729/155081546-d356110d-6168-4e1d-a8d3-e4c4ca065369.png">

  - 위와 같은 문제점을 해결하기 위해 만들었따. 
  - 3 words에 해당하는 Buffer를 넣고 fixed Size라는 메타데이터로 구성된 고정된 사이즈로 구성되어 있음
  - 위 그림에서 배열안에 이런 Container들이 들어가 있는것임

- Struct가 3 words이하인 경우
  - Existential container안에 값이 모두 저장됨
  - 만약 값이 2word크기라면 1word는 낭비될 것 임 
  
- Struct가 3 words 초과 인 경우
  - Heap에 할당해서 저장하게 된다
  - 해당 참조를 Existential container에 저장하게 된다.
<img width="70%" alt="스크린샷 2022-02-22 오후 4 21 00" src="https://user-images.githubusercontent.com/80263729/155082178-f490b35a-7e0b-4940-bd70-604b8604ea48.png">

- 3 word크기인지 아닌지 어떻게 구분하고 할당하고 복사하는가? 🤔 

- `Value Witness Table(VWT)
  - Existential container의 생성/해제를 담당하는 인터페이스 
<img width="40%" alt="스크린샷 2022-02-22 오후 4 23 06" src="https://user-images.githubusercontent.com/80263729/155082508-cb80b6e3-7730-45cc-abd4-058bfbc07103.png">

1. allocate한다 (3word보다 크면 ref가 작으면 값이 할당됨)
2. copy한다 (3word보다 클때 발생하며 Heap에 데이터를 copy하게 됨)
3. destruct (메모리에 올라와있는 것을 지운다. 3word보다 크면 Heap에 있는 데이터가 작으면 stack에 있는 데이터가 삭제됨)
4. deallocate (Stack에 있는 참조 주소를 지운다)
VWT는 fix size안에 포함이 되어있기 때문에 Copy가 되더라도 계속 가지고 있게 된다.

- Dynamic Dispatch는 어떻게 함?
- PWT라는 포인터를 이용해서 찾게됨(fixed size안에 있음)
<img width="70%" alt="스크린샷 2022-02-22 오후 4 30 29" src="https://user-images.githubusercontent.com/80263729/155083548-f5515c21-c1d6-446a-a61a-d6ce52b3515f.png">

- 만약 큰 사이즈 Protocol 타입의 Copy가 일어나면 어떻게 될까? 🤔 
  - 값이 복사가 된다!!
  - Heap은 쓰지만 Reference Count가 없는 신기한 구조가 생긴다. 
  - Copy마다 Heap을 복사하므로 엄청난 성능 저하가 생긴다.

<img width="70%" alt="스크린샷 2022-02-22 오후 4 33 33" src="https://user-images.githubusercontent.com/80263729/155083986-c3ef91a2-124f-4018-9bfb-9078715e4760.png">

- 성능 저하 해결하기(indirect Storage)
  - 성능 저하가가 야기 되는 부분은 var x1,y1...과 같은 사이즈가 큰 프로퍼티들이다 따라서 이들을 담을 storage클래스를 만들고 실제 line에서는 reference만 가지게 한다.
  - reference만 복사가 되기 때문에 값을 복사하는것에 비해 상당한 성능 이점을 가질 수 있다.
  - 하지만.. 만약 값이 바뀐다면 모든 인스턴스들의 값이 바뀐다.
  - 값타입의 장점이 사라지므로 이를 해결해야한다.

<img width="70%" alt="스크린샷 2022-02-22 오후 4 35 38" src="https://user-images.githubusercontent.com/80263729/155084303-788acf5b-be79-4948-b431-f816ab4c4d55.png">

- Copy-on-Write
  - 값을 Write할때만 Copy를 하자
  - 값에 변화가 있을때만 Copy를 하는 방법으로 이방법을 이용하면 값을 바꾸더라도 똑같이 reference Count가 1인 line이 복사가된다.
  - 따라서, 값을 바꾸더라도 서로 영향이 없는 독립적인 값타입의 장점을 살릴 수 있다.
  
<img width="70%" alt="스크린샷 2022-02-22 오후 4 39 49" src="https://user-images.githubusercontent.com/80263729/155084908-3b1752f7-f6f4-4f7b-a2f4-9289c7ce3f6f.png">

- 정리
  - 변수가 Protocol Type으로 사용된 경우 쓰인다
  - 프로토콜을 이용한 다형성 구현이 목적이다
  - Class와 비슷하다
    - 초기화시 Heap사용
    - Dynamic Dispatch( class -> V-Table, protocol -> PWT) 
  
  - Indirect Storage
    - Copy시 Heap할당 대신 Reference counting으로 대체 
  
  - Copy-on-Write
    - Indirect Storage 값이 변경될 시점에 Heap에 할당하여 복사
    - 성능 저하를 최소화함(변경 동작에만)
  
  - String, Array, Dictionary도 비슷한 개념으로 Value semantics 구현  
<img width="30%" alt="스크린샷 2022-02-22 오후 4 48 21" src="https://user-images.githubusercontent.com/80263729/155086218-db602e04-fca7-41a4-a4a4-0c6578914be6.png"><img width="30%" alt="스크린샷 2022-02-22 오후 4 49 26" src="https://user-images.githubusercontent.com/80263729/155086386-1adbb230-1c6d-4e55-bfbd-cb668ee1b06b.png">

- `Generics Type`
  - Protocol Type과 비슷하다
  - Dynamic Method Dispatch를 개선할 수 없을까? 🤔 
    
<img width="50%" alt="스크린샷 2022-02-22 오후 4 57 03" src="https://user-images.githubusercontent.com/80263729/155087477-3746ec90-72ce-435d-ab08-02deb41a52d5.png"><img width="50%" alt="스크린샷 2022-02-22 오후 4 58 07" src="https://user-images.githubusercontent.com/80263729/155087658-d187f622-3dc8-4620-b467-3927fe723069.png">

  - 정적 다형성: 메서드 내에서는 Drawable의 실제 실제 타입이 변하지 않음을 않음을 이용하자
  - 각 타입에 맞게 메서드를 추가로 구현해주는 것이다.

<img width="50%" alt="스크린샷 2022-02-22 오후 4 58 58" src="https://user-images.githubusercontent.com/80263729/155087822-e118f83e-6264-4d8b-ae86-3116f948d357.png">

  - Generics 특수화

<img width="50%" alt="스크린샷 2022-02-22 오후 5 44 22" src="https://user-images.githubusercontent.com/80263729/155095214-d94ba47e-cfd1-495b-bddc-2e0332108cef.png">

  - 장점
    - 복잡한 Existential Container 안써도 된다.
    - 함수 호출시 Heap할당을 없앨 수 있다.
    - Static Method Dispatch로 변해서 컴파일러 최적화가 가능하게 됨. 
  
  - 단점
    - 너무 귀찮다 So..  `컴파일러가 해준다😀`

- 정리
  - 컴파일 시점에 부르는 곳마다 타입이 정해져 있다
  - 런타임에 바뀌지 않는다
  - 그렇기에 특수화가 가능하다.
  
  before
<img width="40%" alt="스크린샷 2022-02-22 오후 5 49 24" src="https://user-images.githubusercontent.com/80263729/155096061-97944293-35af-4252-9958-decf6a352a67.png">

  after
<img width="40%" alt="스크린샷 2022-02-22 오후 5 50 28" src="https://user-images.githubusercontent.com/80263729/155096254-644757ba-06cc-4a65-baab-7bd921fef30a.png">


<img width="40%" alt="스크린샷 2022-02-22 오후 5 51 20" src="https://user-images.githubusercontent.com/80263729/155096405-dff42a07-d0d5-4bb1-9ae7-3589995a50c3.png">

**추상화 기법의 선택**
- Struct: Value semantics가 맞는 부분
- class: Identity가 필용한 부분, 상속등의 OOP, Objective-C
- Generics: 정적 다형성ㅇ으로 가능한 경우
- Protocol: 동적 다형성이 필요한 경우

**고려 할 수 있는 성능 최적화 기법**
- Struct에 클래스 타입의 Property가 많으면 값 타입으로 대체해서 Reference Counting을 줄이자
- Mutable해야 한다면 Copy-on-Write를 구현해보자.



