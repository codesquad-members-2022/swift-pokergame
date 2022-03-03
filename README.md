# swift-pokergame
## ✅  Step1 게임보드 만들기
### **🧑🏼‍💻 작업 목록**

- [x]  PockerGame 프로젝트 생성
- [x]  Status Bar 색상 변경
- [x]  Background 패턴 추가
- [x]  (StackView 사용X) 직접 UIImageView 7개 생성
    - [x]  화면 크기를 구하고 7등분하여 이미지 표시
    - [x]  가로 세로 비율 = 1:1.27
- [ ]  PR 보낸 이후, 코드로 생성한 뷰 7개를 StackView 내부에 넣어 균등 분할하도록 변경 (재PR X)
---
### StatusBar의 스타일 변경

<img src="https://user-images.githubusercontent.com/92699723/155824951-e909ea76-3e8a-4fa3-ac68-3e11875bcfb6.png" width="500" height="100">

이 부분이 번역하자면 ‘상태표시줄’이고 StatusBar라고 표현한다.

→ HIG를 먼저 살펴본다.

- 화면의 상단 가장자리에 표시되며 시간, 이동통신사, 네트워크 상태 및 배터리 수준과 같은
**디바이스의 현재 상태에 대한 유용한 정보를 표시한다.**
- Use the system-provided [status.bar](http://status.bar) (시스템에서 제공하는 status Bar 사용)
- Coordinate the status bar style with your app design 
(status Bar 스타일을 앱 디자인과 함께 조정)
- Obscure content under the status bar. (status Bar 아래에 있는 내용을 흐리게 표시)
- Consider temporarily hiding the status bar when displaying full-screen media.
(전체 화면 미디어를 표시할 때 status Bar를 일시적으로 숨겨야한다.)
- Avoid permanently hiding the status bar. (status Bar를 영구적으로 숨기지 말아야한다.)
- Use the status bar to denote network activity. 
(status Bar를 사용하여 네트워크 활동을 나타내야한다.)
---
### UIStatusBarStyle

statusBar는 검정색(dark)이 될 수도있고 하얀색(light)이 될 수도 있다.

→ navigation Bar를 사용한다거나 그렇지 않은 상황이라면 status bar를 뒤에 있는 콘텐츠의 색상에 따라
바꿔줘야할 필요가 있다.

→ UIStatusBarStyle이 있는데 default - 검정색, lightContent - 하얀색이 된다.

<img src="https://user-images.githubusercontent.com/92699723/155824948-05597efa-a5e7-4baa-b67b-dc8ad2012831.png" width="500" height="200">

### preferredStatusBarStyle

preferredStatusBarStyle은 UIViewController의 인스턴스 프로퍼티이다.

<img src="https://user-images.githubusercontent.com/92699723/155824947-110a28a7-ed52-4e08-bf86-494e1ee6119b.png" width="600" height="100">

preferredStatusBarStyle은 위 UIStatusBarStyle 타입을 return하여 viewController안에서 정의하여 
아래와 같이 사용하면된다.

<img src="https://user-images.githubusercontent.com/92699723/155824945-e328cde7-01fd-4875-9767-bd8f02bace98.png" width="600" height="400">

[iOS ) UIStatusBar](https://zeddios.tistory.com/569)

---
### ViewController 클래스에서 self.view 배경이미지 변경하기

- 처음에 이미지를 다운로드받아서 봤을때 이 작은 이미지로 background 전체를 덮어야하나? 라는 고민으로 시작하였다.
    - UIImageView를 사용해서 변형해야할 것 같다고 학습키워드로 확인하였다.
    - 실제 UIImageView를 사용하기위해서는 ImageView가 필요한데 취지에 맞지 않았다.
    - viewDidLoad() 안에서 동작해야할 것으로 보았다.
    - 아래의 사이트를 참고하여 진행하였다.
    원하는 키워드인 ‘self.view’에 대한 내용을 확인할 수 있었다.

backgroundColor에는 **‘UIColor’**만 들어갈 수 있다!

→ ⭐️ UIColor 에서 **UIImage를 UIColor로 변형**해주는 이니셜라이저를 가지고 있다.

→ 이미지 파일을 이미지화 시키고 **UIColor(patternImage: )**에 적용하여 볼 수 있었다.

[[iOS] view background pattern image](https://poisonf2.tistory.com/37)
---
### ViewController 클래스에서 UIImageView 하드코딩

1. 카드 7개를 StackView를 사용하지 않고 직접 코딩하여 7개를 생성해야한다.
    1. UIImage를 직접 다뤄야하고 CGRect로 값을 지정해줘야한다.
    2. x, y축의 값을 알아내야한다.
        - UIViewController의 Bounds 또는 Frame값을 가져올 수도 있지만, UINavigationBar 또는 SafeArea때문에 화면의 크기를 제대로 가져올 수 없다.
        - 디스플레이(하드웨어)의 정보를 가져올 수 있는 UIScreen을 이용하였다.
            
            [[iOS] UIScreen으로 화면 크기(해상도) 가져오기](https://mildwhale.tistory.com/14)
---
## ✅  Step2 카드 클래스 구현하기
### **🧑🏼‍💻 작업 목록**   
 - [x]  Step1 게임보드 만들기
 - [x]  PR Comment 관련하여 수정하기
 - [ ]  Step2 카드 클래스 구현하기
     - [x]  학습자료
         - [x]  스위프트 타입별 메모리분석
     - [ ]  학습목표
         - [x]  OOP방식에 대해 학습하고 필요한 역할을 담당하는 객체를 설계
             
             객체지향 프로그래밍 → [22.01.13 Thursday](https://www.notion.so/22-01-13-Thursday-4c4df512783644bebdbf9d1af471b971) 
             
         - [ ]  데이터를 추상화하기 위한 설계 방식을 학습하고 원하는 구조로 표현
         - [ ]  객체 내부 데이터 타입과 출력할 때 사용할 데이터를 구분해서 사용
         - [x]  UniCode에 학습하고 코드에 활용
     - [ ]  기능 요구 사항
         - [x]  카드 데이터를 추상화하여 클래스로 구현하고 단계별로 다양한 상황에 확장해서 사용
         - [x]  클래스 이름, 변수, 함수 이름 Naming 규칙을 만든다.
             - [x]  Naming 관련한 학습자료 확인
             
             ****[Bool 변수 이름 제대로 짓기 위한 최소한의 영어 문법](https://soojin.ro/blog/naming-boolean-variables)****
             
             ****[Swift 개발자처럼 변수 이름 짓기](https://soojin.ro/blog/english-for-developers-swift)****
             
         - [x]  임의의 카드 객체 인스턴스를 하나 만들어서 출력한다.
     - [ ]  프로그래밍 요구사항
         - [x]  객체지향 프로그래밍 방식에 충실하게 카드 클래스(class)를 설계한다.
             - [x]  속성으로 모양 4개 중에서 하나, 숫자 1~13개 중에 하나를 가질 수 있다.
             - [x]  모양이나 숫자도 적당한 데이터 구조로 표현한다.
                 - [x]  클래스 혹은 Nested enum타입으로 표현해도 좋다.
                 - [x]  어떤 이유로 데이터 구조를 선택했는지 주석(comment)으로 구체적인 설명을 남긴다.
                 // 어떤 처리가 간단해서, 편리해서, 함께 표현하려고
             - [x]  카드 정보를 출력하기 위한 문자열을 반환하는 함수를 구현한다.
             - [x]  문자열에서 1은 A로, 11은 J로, 12는 Q로, 13은 K로 출력한다.
         - [x]  ViewController에서 특정한 카드 객체 인스턴스를 만들어서 콘솔에 출력
         - [x]  데이터를 처리하는 코드와 출력하는 코드를 분리한다.

- [ ]  코딩 이외의 해야할 것들
 - [x]  OOP 방식에 대해 학습하고 필요한 역할을 담당하는 객체 설계
     - [x]  수업자료(PDF)에서 1주차 2주차에 필요한 학습내용 확인하기
 - [x]  포커 게임을 어떻게 만들지 단계별 다이어그램으로 패턴화 그려보기([https://excalidraw.com](https://excalidraw.com/))
- [x]  Safari에 들어있는 책갈피 크롬으로 옮기기!   

[포커게임에 대한 로직생각](https://www.notion.so/a252998b580b467fb25d2361e8b4a908)   
[Bool 변수 이름 짓기](https://www.notion.so/Bool-c73e552b45ec4c7c8b50fc21c7514b88)   
[CustomStringConvertible](https://www.notion.so/CustomStringConvertible-e5bdef5cd4f24f8ba11339c9deadcf35)   

---

### 🟢 유니코드

ASCII 코드: 미국에서 정의하고 있는 표준으로 1Byte로 표현된다. (알파벳 + 확장문자)

Unicode: 2Byte로 표현되는 여러 문자들을 표현하기 위한 문자셋

문자셋: 약속된 문자의 표현방법

- SBCS: 문자표현에 1Byte
- MBCS: 1Byte로 되면 1Byte, 안되면 2Byte
- WBCS: 모든 문자를 2Byte로 처리, Unicode가 이에 해당된다.
![Screen Shot 2022-03-01 at 20 41 16 PM](https://user-images.githubusercontent.com/92699723/156374062-f62cab8b-35c3-4410-9a97-b4a9993d2350.png)

[시스템 프로그래밍 - 2부 아스키코드 vs 유니코드](https://velog.io/@jacod2/%EC%8B%9C%EC%8A%A4%ED%85%9C-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D-2%EB%B6%80-%EC%95%84%EC%8A%A4%ED%82%A4%EC%BD%94%EB%93%9C-vs-%EC%9C%A0%EB%8B%88%EC%BD%94%EB%93%9C)

### 🔴  포커게임에 대한 로직생각
[[파이썬 프로그래밍 19] 간단한 포커 게임 만들기 1. 튜플(tuple)과 목록을 연결하는 더하기(+) 기호 - 코딩, 데이터, 머신러닝](https://www.bwyoon.com/2018/07/16/%ed%8c%8c%ec%9d%b4%ec%8d%ac-%ed%94%84%eb%a1%9c%ea%b7%b8%eb%9e%98%eb%b0%8d-19/)

[[파이썬 프로그래밍 20] 간단한 포커 게임 만들기 2. 카드를 섞는(shuffling) 코드와 패가 무엇인지 알아내는 코드 - 코딩, 데이터, 머신러닝](https://www.bwyoon.com/2018/07/17/%ed%8c%8c%ec%9d%b4%ec%8d%ac-%ed%94%84%eb%a1%9c%ea%b7%b8%eb%9e%98%eb%b0%8d-20/)

[[파이썬 프로그래밍 21] 간단한 포커 게임 만들기 3: 함수 만들기 - 코딩, 데이터, 머신러닝](https://www.bwyoon.com/2018/07/25/%ed%8c%8c%ec%9d%b4%ec%8d%ac-%ed%94%84%eb%a1%9c%ea%b7%b8%eb%9e%98%eb%b0%8d-21/)

포커게임의 기본은 선수들이 나눠가진 카드 패(hand)의 순위(rank)를 정하는 것.

패(hand)는 포커게임의 종류에 따라 5개 또는 7개의 카드를 받기도하고, 5개의 카드는 공유하고 각자 2개의 
카드를 받아 결국은 각자 7개의 카드를 받는 등 몇 가지가 있다. 

### ✅  프로퍼티

Deck -  게임용 카드 한 팩

Suit

- Shape - ‘♥️’♦️’♠️’♣️’
- SuitNumber - `1 ~ 13'
    - SpecialNumber - ‘A = 1’ ‘J = 11’ ‘Q = 12’ ‘K = 13’

Card (suit 무늬 & 숫자) - ( 모양, 숫자 ) 튜플형식으로 나타낼 수 있다.

- (”heart”, 2) = 하트 무늬 , 숫자 2

### ✅  메서드

- 카드를 섞는 shuffling 코드
    
    ```swift
    deck = [(suit, k)  for suit in ["Heart", "Space", "Clover", "Diamond"] for k in range(1,14)]
    random.shuffle(deck)
    print(deck)
    
    cards = [deck[k] for k in range(5) ]
    print(cards)
    ```
    
- 패가 무엇인지 알아내는 checking 코드   
![PockerGameBlock](https://user-images.githubusercontent.com/92699723/156373731-ccb02aa7-254f-4d62-a51a-01a8bd0af3dc.png)   

### 실행결과
![Screen Shot 2022-03-02 at 22 41 36 PM](https://user-images.githubusercontent.com/92699723/156373670-4deeedf8-82cb-4d59-9c52-dfbd508c271a.png)   

## ✅  Step3 카드덱 구현하고 테스트하기
### **🧑🏼‍💻 작업 목록**   
- [ ]  Step3 카드덱 구현하고 테스트하기
  - [ ]  구조체와 클래스의 차이 학습 및 속성 변화시 어떤 변화가 있는지 확인
  - [ ]  참조 접근자를 활용해서 정보를 감추고 메소드 인터페이스를 통해 접근하는 방식 학습
  - [ ]  클래스 메모리 관리 방식에 대해 학습
  - [ ]  reset()할 때 이전에 만든 카드 객체는 어떻게 되는지 설명할  수 있어야한다.
  - [ ]  개발 환경에서 제공하는 메모리를 분석하는 디버깅 도구 확습