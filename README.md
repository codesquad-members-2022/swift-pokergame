# swift-pokergame : STEP1 

## [작업목록]
- [X] Statusbar 스타일을 LightContent로 보이도록 한다
- [X] 배경화면 설정
- [X] 카드 StackView 사용하지 않고 정렬 하기 

## [주요 작업 내용]

### **- Statusbar 란?** 
**시간, 배터리 네트워크 연결상태 등 의 정보를 표시해주는 상태창.**
- Light , Dark content 의 설정 가능.
<p align="center">
<img src="https://user-images.githubusercontent.com/36659877/154877093-1a911c4c-68f2-4ceb-bde5-b523b578bfc7.png" width="500" height="300"> 
</p>

<p align="center">
<img src="https://user-images.githubusercontent.com/36659877/154878037-17b43d02-e53d-46cd-980a-f31d1baad97d.png" width="500" height="300"> 
</p>


### **- Background 설정하기**

- UIColor 의 생성자중 `init(patternImage image: UIImage)` 을 사용하여 UIImage 를 다운받은 배경으로 배경 패턴을 지정해준다.

### **- 카드 레이아웃 하기** 

- Iphone 13 의 width 크기와 카드사이 의 거리, 시작 offset 을 미리 계산하여 cardWidth 를 계산해준다. 
- 첫번째 카드의 위치는 safe area 를 침범하면 안되므로 safe area 좌표 정보를 가지고 있는`safeAreaInsets` 을 구해주었다. 
- `safe area insets` 은 viewDidLayoutsubviews 이후 값이 매겨지기 때문에 그 이후에 카드의 frame 좌표를 계산하여 UIImageView 를 CGRect 을 사용하여 생성했다. 
- 똑같은 이미지의 카드가 여러장 있어서 IBOutlet collect 을 사용해서 배열 로 관리 해주었다. 

### **- 화면 설계** 
   <p align="center">
   <img src="https://user-images.githubusercontent.com/36659877/154964765-d7da8654-044f-40c9-b974-d1af8571b6c0.png" width="350" height="450"> 
   </p>
  
  
### **- 화면 구현** 
   <p align="center">
   <img src="https://user-images.githubusercontent.com/36659877/154964741-a4f32095-ad94-48b9-a39a-6023958d1ee8.png" width="300" height="450"> 
   </p>
   


  
  
