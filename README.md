# swift-pokergame  


<details>
<summary> STEP1 : 백그라운드 설정 및 카드 정렬 </summary>

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
   
</details>

<details>
<summary> STEP2 : [카드 클래스 만들기]</summary>

## [작업목록]
- [X] 카드 데이터를 추상화해서 클래스로 구현
- [X] 클래스 이름, 변수 이름, 함수 이름에서 자신만의 규칙을 만들기
- [X] 임의의 카드 객체 인스턴스를 하나 만들어서 출력

## [주요 작업 내용]
- Card class
   - 2개의 열거형 프로퍼티를 카드의 suit , rank 를 표현하기 위해 작성. 
   - info 프로퍼티에 카드의 정보 할당. 
   - ViewController 에 임의 의 카드 객체 생성후 정보를 프린트해주는 함수 작성.


### **- 결과 ** 
   <p align="center">
   <img src="https://user-images.githubusercontent.com/36659877/155194905-76905bde-50e9-4e3a-96c8-bd8035827273.png" width="250" height="250"> 
   </p>
</details>



<details>
<summary> STEP3 : [카드덱 구현하고 테스트하기]</summary>

## [작업목록]
- [X] 앞서 만든 모든 종류의 카드 객체 인스턴스를 포함하는 카드덱 구조체를 구현한다.
- [X] 객체지향 설계 방식에 맞도록 내부 속성을 모두 감추고 다음 인터페이스만 보이도록 구현한다.
- [X] count 갖고 있는 카드 개수를 반환한다.
- [X] shuffle 기능은 전체 카드를 랜덤하게 섞는다.
- [X] removeOne 기능은 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
- [X] reset 처음처럼 모든 카드를 다시 채워넣는다.
  
## [작업 진행]
### 1. Deck 설계 
- Assumption & House keeping  
    - 카드 게임이 시작되면 하나의 deck 이 생성이 된다.
    - 처음 덱은 섞이지 않은 순서로 spade -> club -> heart -> diamond 순서와, 오름차순 순의 rank 로 생성이 된다. 
    - shuffle : 덱에 있는 카드들의 순서를 메소드로 무작위로 섞는다
    - removeOne : 카드뭉치의 맨 위에 있는카드를 뽑아 반환하고 삭제하는것으로 가정하고 함수 구현.
    - count : 덱에 현재 존재하는 카드 개수를 반환한다.
    - reset : 덱의 카드를 처음과같이 다시 채워 넣는다.
    - shuffle, removeOne, count, reset, 의 기능들만 제외한 나머지 기능들과 프로퍼티 들은 은닉화 시킨다. 
    
- 위 의 내용을 종합해본 결과, 하나의 덱은 항상 최근의 카드의 정보를 가지고 있어야하므로 참조 타입인 class 를 사용하여 구현. (아래 그림 참조) 
   <p align="center">
   <img src="https://user-images.githubusercontent.com/36659877/155356641-4eb4873a-b854-4e3e-8dfe-bbeb38201326.png" width="550" height="350"> 
   </p>

   
### 2. 기능 구현 
### 함수 vs Computed Property 
- 프로퍼티로 기능을 구현 하는 경우는 아래의 경우를 따랐다. 
    - Does not throw 
    - Has a O(1) complexity 
    - is cheap to calculate 
    - returns the saem result over invocations

- 카드 생성 : 해당 클래스가 생성되는순간 52개의 카드를 정리된 순서대로 가지고 있음. 
    - 인덱스를 이용한 shuffle 과 마지막에 있는 카드를 삭제해주는 과정을 쉽게해주기 위해 배열 타입으로 정의.
    - Deck 의 init() 안에 generateCards 라는 함수 는 Card 구조체 에 있는 suits, ranks 를 순환하여 52개의 카드를 생성함. 

- count : Deck 에 존재하는 카드개수를 반환.  
    - Deck 의 Cards 배열의 갯수를 새는 것으로 O(1) 의 시간 복잡도를 가지고 있음. 
    - 에러를 발생하지 않는다.
    - 따라서 Property 로 구현.
    
- shuffle : 덱에 있는 카드들의 순서를 메소드로 무작위로 섞는다
    - 대표적인 Shuffle 알고리즘 
    - 1.0 Fisher-Yates Shuffle
    요약 : 1~N 까지의 숫자중 랜덤한 숫자를 뽑아 리스트에 적어두고, 뽑힌 번호는 삭제한다. 이방법을 남는 숫자가 없을때 까지 반복한다. (뽑힌 번호는 리스트 마지막에 기제) -> 두개의 리스트를 계속 순회 하기 때문에 O(n^2) 의 시간 복잡도 를 가지고있다.  
    - 2.0 Mordern algorithm by Durstenfeld
    요약 : 1~N 까지의 숫자중 랜덤한 숫자를 뽑아 검색 범위의 마지막 숫자와 위치를 swap 해준다. 검색범위를 1 씩 줄이며 남은 숫자가 1개 가 될때까지 반복. 
    -> 한개의 리스트만 순회 하기 떄문에 O(n) 의 시간복잡도 를 가지고 있다. 
    
    - 시간 복잡도에 의거하여 Mordern algorithm 으로 채택. 
    - 해당 덱에있는 카드들의 순서를 무작위로 바꾼뒤, 해당 덱의 카드뭉치 로 다시 할당. 
   <p align="center">
   <img src="https://user-images.githubusercontent.com/36659877/155402019-be323da1-ada6-444a-ab27-1b481eadd5e7.png" width="550" height="350"> 
   </p>

- removeOne : 카드뭉치의 맨 위에 있는카드를 뽑아 반환하고 삭제하는것으로 가정하고 함수 구현.
    - 마지막 배열의 요소를 지우고 리턴함. 
    
- reset : 덱의 카드를 처음과같이 다시 채워 넣는다.
    - 현재 남아 있는 카드뭉치를 전부 제거한뒤, 새로운 카드뭉치 생성.

</detailes>

<details>
<summary> STEP4 [게임로직 구현하기]</summary>
</details>
