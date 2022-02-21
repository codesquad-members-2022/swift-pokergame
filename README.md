# swift-pokergame
## 게임보드 만들기
### 프로그래밍 요구사항
- 앱 기본 설정을 지정해서 StatusBar 스타일을 LightContent로 보이도록 한다.

<img src = "https://user-images.githubusercontent.com/44107696/154875375-efe20edd-c5d8-413b-970b-5d74778a17de.png" width="900" height="1190">
    * 다양한 속성 관련 Key 값들

<img src = "https://user-images.githubusercontent.com/44107696/154875391-ba9bfad5-f3b9-4d1c-aac8-f73eedbf53de.png" width="800" height="700">
    * View controller-based status bar appearance 값을 false로 설정 (상태 표시줄 모양이 현재의 VC가 택한 스타일을 기반으로 할 것인지에 대한 Key이므로 Info 수정 시에는 필수로 false 필요)
    * Info plist가 아닌 preferredStatusBarStyle 프로퍼티를 오버라이드해서 VC 내에서 설정하는 방법 또한 존재
    * Status bar style Key의 값을 Light Content로 수정. 현재는 흰 배경이라 status bar가 묻혀서 보이지 않는 상태

- ViewController 클래스에서 self.view 배경을 다음 이미지 패턴으로 지정한다. 이미지 파일은 Assets에 추가한다.
- 다음 카드 뒷면 이미지를 다운로드해서 프로젝트 Assets.xcassets에 추가한다.

<img src = "https://user-images.githubusercontent.com/44107696/154877518-9599dc6c-4133-487c-a06f-919536321df7.png" width="940" height="810">
    * backgroundColor 설정 중 UIColor(patternImage:)를 활용하여 Asset의 이미지를 패턴화시켜 UIColor로 변환하여 적용
    * 배경 변경 후에는 Light Content로 수정된 StausBar도 색이 묻히지 않고 잘 표시됨

- ViewController 클래스에서 코드로 7개 UIImageView를 생성하고, 추가해서 카드 뒷면을 보여준다
    + 주의사항 우선 스택뷰StackView를 사용하지 말고 직접 UIImageView를 7개 생성해야 한다
- 화면 크기를 구하고 균등하게 7등분해서 이미지를 표시해야 한다
- 카드 가로와 세로 비율은 1:1.27로 지정한다

<img src = "https://user-images.githubusercontent.com/44107696/154882336-8a6d3a8c-6471-409c-bc36-5eaa19fd6310.png" width="1000" height="900">
    * class 프로퍼티로 카드 뒷면 Image, 값 변경이 가능한 xPosition 선언
    * ImageView 생성 함수 구현. 13pro의 가로값 390을 7개로 분할할 때, 카드 너비 54 / 카드 간 간격 2로 설정하면 정확히 나눠지므로 이를 토대로 카드의 너비와 높이 할당
    * frame을 통한 위치 설정 중 y 값은 50으로 고정
    * 7개의 카드를 만들기 위해 viewDidLoad에서 반복문을 통해 함수 호출
