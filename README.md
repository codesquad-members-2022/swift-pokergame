# swift-pokergame
2주차 카드게임 저장소

## Step1 (22.02.21 / 18:00)



![스크린샷 2022-02-21 오후 6.45.21](/Users/choeyeju/Desktop/스크린샷 2022-02-21 오후 6.45.21.png)

### 🎯진행사항 

- 앱 기본 설정을 지정해서 StatusBar 스타일을 LightContent로  보이도록 한다.in
  - 앱의 기본설정을 할수 있는 Info.plist 파일에서 설정해주었다.
  - Status bar is initally hidden 를 YES로 설정 
  - Status bara style 을 Light Content 로 설정 

![스크린샷 2022-02-21 오전 11.04.10](/Users/choeyeju/Desktop/스크린샷 2022-02-21 오전 11.04.10.png)



 + 이래도 변경이 되지않았다.

   ```swift
       override var preferredStatusBarStyle: UIStatusBarStyle {
           return .lightContent
       }
   ```

   

- 이미지 파일들을 Assets에 추가한다. 
  - 다운로드한 파일을 드래그앤 드롭으로 추가 



- 배경 이미지 설정하기 

```swift
self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_patterns") ?? UIImage())
```



- ViewController 클래스에서 **코드**로 7개 UIImageView를 생성하고, 추가해서 카드 뒷면을 보여준다	
  - `UIImageView(frame: )` 메소드로 x,y,width,height 값을 적절히 주어서 ImageView를 생성
  - `UIScreen.main.bounds.size.width` : 디바이스의 width 











​		



