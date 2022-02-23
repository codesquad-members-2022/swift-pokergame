# swift-pokergame : STEP3 [카드덱 구현하고 테스트하기]

## [작업목록]
앞서 만든 모든 종류의 카드 객체 인스턴스를 포함하는 카드덱 구조체를 구현한다.

객체지향 설계 방식에 맞도록 내부 속성을 모두 감추고 다음 인터페이스만 보이도록 구현한다.

count 갖고 있는 카드 개수를 반환한다.

shuffle 기능은 전체 카드를 랜덤하게 섞는다.

removeOne 기능은 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.

reset 처음처럼 모든 카드를 다시 채워넣는다.

메소드 매개변수와 리턴값은 어떤 타입이 좋을지, 속성으로 무엇이 필요한지, 불변 Immutable 인지 가변 mutable 인지 판단해야 한다.
  
## [작업 진행]
1. Deck 설계 
- Assumption & House keeping  
    - 카드 게임이 시작되면 하나의 deck 이 생성이 된다.
    - 처음 덱은 섞이지 않은 순서로 spade -> club -> heart -> diamond 순서와, 오름차순 순의 rank 로 생성이 된다. 
    - shuffle() : 덱에 있는 카드들의 순서를 메소드로 무작위로 섞는다
    - removeOne() : 덱에 위에있는 카드 부터 removeOne 메소드로 플레이어들에게 나누어줄수 있다.
    - count() : 덱에 현재 존재하는 카드 개수를 반환한다.
    - reset() : 덱의 카드를 처음과같이 다시 채워 넣는다.
    - shuffle, removeOne, count, reset, 의 기능들만 제외한 나머지 기능들과 프로퍼티 들은 은닉화 시킨다. 
    
- 위 의 내용을 종합해본 결과, 하나의 덱은 항상 최근의 카드의 정보를 가지고 있어야하므로 참조 타입인 class 를 사용하여 구현. (아래 그림 참조) 
   <p align="center">
   <img src="https://user-images.githubusercontent.com/36659877/155356641-4eb4873a-b854-4e3e-8dfe-bbeb38201326.png" width="550" height="350"> 
   </p>

   

