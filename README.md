# 1. 게임보드 만들기



## 과정

1. statusBar 스타일 lightContent로 설정

   <img src="https://user-images.githubusercontent.com/78553659/154930589-22c6196f-0204-46c8-99bd-c7085f4eb81a.png" width="725" height="300"/>

2. Assets 에 "bg_patter.png", "card-back.png" 저장

3. ViewController 배경을 "bg_patter.png" 으로 지정

4. ViewContoller에 UIImageView 7개 생성 및 추가

5. Info.plist 에서 앱 표시 이름 "pokepoke"로 변경

   <img src="https://user-images.githubusercontent.com/78553659/154931719-a82457a6-eed5-4176-b6b8-457e9aa9e3da.png" width="50" height="50"/>



## 실행화면

<img src="https://user-images.githubusercontent.com/78553659/154931428-3223f936-3a79-43f4-b04d-189e4633b601.png" width="213" height="400"/>



# 2. 카드 클래스 구현하기

## 과정

1. 정해진 범위내에서 카드의 모양과 숫자를 결정하기 위해 enum 으로 Shape와 number 선언
2. Init() 함수의 파라미터로 enum Shape, Number를 받을수 있도록 구현
3. Card에 CustomStringConvertible 프로토콜을 채택함으로써 Card 인스턴스 가 string을 반환하도록 구현





# 3. 카드덱 구현하고 테스트하기

## 과정

1. 카드를 담을수 있는 배열 cards 변수를 private으로 선언
2. CardDeck 초기화시 Card.shape. Card.number 의 모든 케이스에 대해 카드를 생성하여 cards에 담아주도록 init() 구현
3. 가지고있는 카드 갯수를 반환하는 count 메소드 구현 
4. 가지고있는 카드를 랜덤하게 섞도록하는 shuffle 메소드 구현
5. 가지고있는 카드의 마지막 카드를 반환하는 removeOne 메소드 구현
6. 카드를 초기화 상태로 돌리기위해 reset 메소드 구현
   1. originDeck 을 선언하여 초기에 카드덱 생성시 생성된 카드덱을 저장하고 reset시 이를 가져오도록 구현





