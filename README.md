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
    + backgroundColor 설정 중 UIColor(patternImage:)를 활용하여 Asset의 이미지를 패턴화시켜 UIColor로 변환하여 적용
    + 배경 변경 후에는 Light Content로 수정된 StausBar도 색이 묻히지 않고 잘 표시됨
