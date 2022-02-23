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







---



## Step2 (22.02.22 / 20:00)

![스크린샷 2022-02-22 오후 5.50.21](/Users/choeyeju/Desktop/스크린샷 2022-02-22 오후 5.50.21.png)



### 🎯진행사항 

- 객체지향 프로그래밍 방식에 충실하게 카드 클래스(class)를 설계한다. 
  - 속성 : `symbol` `number` 
  - 두개의 속성 모두 제한적이기 때문에 enum으로 구현했다. 
- 카드 객체 인스턴스를 하나 만들어 출력한다. 
  - Card 클래스에 `CustomStringConvertible` 프로토콜을 채택해서 구현했다. 



rank를 어떻게 구현해야할지 어려웠다. 처음에는 딕셔너리를 사용하셔 구현했는데, 현재 카드 정보를 출력할때는 키값을 얻어와야해서 결론적으로 속성을 하나 더 만들어야 했기때문에 좋은 방법이 아니라고 생각이들었다. 

어차피 rank 딕셔너리의 값은 변하지 않기도 해서 enum으로 구현하는것이 더 좋다고 판단했다. 



---

# Step3 



![스크린샷 2022-02-23 오후 4.57.12](/Users/choeyeju/Library/Application Support/typora-user-images/스크린샷 2022-02-23 오후 4.57.12.png)

### 🎯진행사항  

- 카드덱 struct 구현 
  - 카드 배열 선언 
    - 객체지향 설계 방식에 맞게 외부에서 접근할 수 없도록 private 로 선언 
  - count() 
  - shuffle() 
    - Knuth Shuffle 알고리즘을 이용하여 구현 

- 카드덱을 만들기 위해 Card Class에서 CaseeIterable Protocol을 채택하도록 함. 

#### CaseIterable Protocol & allcases

- CaseItereable Protocol 을 채택하면 해당 enum의 모든 case를 까지는 allcases 속성을 만들어서, 접근할 수 있다. 



​		



