# Step 1. 게임보드 만들기

## 작업목록

- [x] 화면 크기에 따라 뷰를 균등하게 분리해서 생성할 수 있다
- [x] 이미지 뷰에 content mode에 대해 학습하고 원하는 비율로 표시할 수 있다
- [x] 이미지를 배경에 패턴으로 추가할 수 있다
- [x] 코드로 뷰를 추가한 다음에, 추가학습으로 UIStackView에 대해 학습하고 뷰를 균등하게 나눠서 표시할 수 있다

## 결과물

<image src="../images/step1-1.png" width="150px" />

## 학습 키워드

- Info.plist
- StatusBar
- safeAreaLAyoutGuide
- UIImageView.ContentMode

## 고민과 해결

- 문제: 기기의 화면 크기에 따라 ImageView 의 크기가 비율에 맞게 가변적으로 변화해야하는 문제가 있었습니다.
- 시도와 해결: 스크린의 너비값을 구해 카드 갯수만큼 나누어 각 카드의 너비값과 비율에 맞는 높이 값을 계산했습니다. frame.x 에 추가 값을 더해 이미지간 균일한 간격을 주었습니다.

---

- 문제: ImageView의 Frame 기준이 View 의 (0,0) 으로 StatusBar 영역을 침범하는 문제가 있었습니다.
- 시도 1: StatusBar 의 높이를 구해 ImageView.frame.y 값으로 설정하고자 했으나 ViewController 가 모달로 표시된 경우에는 불필요한 작업이라는 생각이 들었습니다.
- 시도 2: SafeArea 의 frame.y 값을 얻어 ImageView 의 y축 frame 으로 설정하려했으나 의도했던 값을 얻을 수 없었습니다.
- 해결: root view 가 View 계층에 추가되지 않거나 스크린에 보이지 않는 단계에서는 safeAreaLayoutGuide 와 View 의 크기와 동일하다는 것을 알게 되었고, ImageView 생성 시점을 viewDidLoad 가 아닌 viewDidAppear 메서드로 옮겨 문제를 해결했습니다.
