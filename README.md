# swift-pokergame

- - -

## 2주차 카드게임 만들기 

### 학습목표
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

-Frame : Super View좌표계에서 View의 위치와 크기를 나타낸다  
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
  
  
  
  
