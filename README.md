# 포커게임 Ebony

----

## 게임보드 만들기.

### 구현과정
1. UIStatusBar lightContent로 변경.
2. view 패턴이미지 설정.
3. 카드뷰 한장 화면에 추가해보기.
4. 카드뷰 크기 확인 및 비율 설정.
5. 카드뷰 간 간격 계산해서 반복문으로 추가하기.

### 기능 요구 사항
> [x] 앱 기본 설정을 지정해서 StatusBar 스타일을 LightContent로 보이도록 한다.
>
> [x] ViewController 클래스에서 self.view 배경을 다음 이미지 패턴으로 지정한다. 
> 
> [x] ViewController 클래스에서 코드로 7개 UIImageView를 생성하고, 추가해서 카드 뒷면을 보여준다
>
> [x] 화면 크기를 구하고 균등하게 7등분해서 이미지를 표시해야 한다
> 
> [x] 카드 가로와 세로 비율은 1:1.27로 지정한다
> 

### 실행화면
<img width="281" alt="스크린샷 2022-02-21 오후 2 22 46" src="https://user-images.githubusercontent.com/62687919/154894266-6d3dc726-90f3-4afd-88f1-988e4a80547c.png">


### 공부내용
1. UIStatusBar에는 default, darkContent, lightContent가 있으며 이는 상단의 배터리잔량표시 등 상태 텍스트색을 변경합니다.
2. view.backgroundColor를 통해 pattern을 지정할 수 있으며 이는 이미지를 사용할 수 있습니다.
3. UIView가 생성될때 인자값으로 입력받는 CGRect를 통하여 view의 좌표값 및 크기 설정이 가능합니다.

### 추가학습거리
- 앱 기본 설정(Info.plist)을 변경하는 방식에 대해 학습하고 앱 표시 이름을 변경한다

<img width="70" alt="스크린샷 2022-02-21 오전 11 19 56" src="https://user-images.githubusercontent.com/62687919/154878469-c6e46dd8-c1cb-4ee3-8234-f4cfcb58544b.png">

<img width="497" alt="스크린샷 2022-02-21 오전 11 20 10" src="https://user-images.githubusercontent.com/62687919/154878487-fad5946e-2f33-4338-afec-9eb73d4bb3fe.png">
