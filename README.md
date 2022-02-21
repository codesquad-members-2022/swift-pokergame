# swift-pokergame : STEP1 

## [작업목록]
- [X] Statusbar 스타일을 LightContent로 보이도록 한다.





## [작업기록]

### **- Statusbar 란?** 
**시간, 배터리 네트워크 연결상태 등 의 정보를 표시해주는 상태창.**
- Light , Dark content 의 설정 가능.
<p align="center">
<img src="https://user-images.githubusercontent.com/36659877/154877093-1a911c4c-68f2-4ceb-bde5-b523b578bfc7.png" width="500" height="300"> 
</p>

<p align="center">
<img src="https://user-images.githubusercontent.com/36659877/154878037-17b43d02-e53d-46cd-980a-f31d1baad97d.png" width="500" height="300"> 
</p>


### **- Background 설정하기 **
- UIColor 의 생성자중 `init(patternImage image: UIImage)` 을 사용하여 UIImage 를 다운받은 배경으로 지정해준다. 
  
