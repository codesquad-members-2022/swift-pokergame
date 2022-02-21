# swift-pokergame
2주차 카드게임 저장소

---
## Step 1 - 게임보드 만들기 (Feb 21 Mon)

### ✅ StatusBar
   
* 상태표시줄
* 컨텐츠가 전체 화면일 경우, 상태 표시줄을 일시적으로 숨기는 것이 좋다. (사용자의 컨텐츠 집중을 위해)(Ex. 사진보거나, 동영상 볼 때)
* 다만, 영구적으로 숨겨서는 안된다. 상태 표시줄이 없으면 사람들은 시간을 확인하거나, WiFi 연결 확인을 위해 앱을 종료해야 한다.

| 스타일 | 설명 |
| --- | --- |
| Default | 유저의 인터페이스 스타일에 따라 자동으로 설정 |
| Dark Content | 밝은 배경, 검은 글씨 |
| Light Content | 어두운 배경, 하얀 글씨 |

    디바이스가 달라져도, 똑같이 구현되는것 확인

<img width="399" alt="pad 9" src="https://user-images.githubusercontent.com/92635121/154929872-44fffbce-a1fe-491e-8940-86cbccf7b2bf.png"> <img width="280" alt="13Pro" src="https://user-images.githubusercontent.com/92635121/154929892-cfa37469-916a-4002-8a2e-102d3d405944.png"> <img width="240" alt="13mini" src="https://user-images.githubusercontent.com/92635121/154929886-bfbb0454-70f4-45f9-af07-5953c4e317c0.png">

    App Name / App Icon 변경

<img width="300" alt="App Icon : Name" src="https://user-images.githubusercontent.com/92635121/154929833-b8073ff4-4756-4575-af90-9b3994a2be7b.png">


---

## Step 2 - 카드 클래스 구현하기 (Feb 21 Mon)

### ✅ 유니코드
      전 세계의 모든 문자를 다루도록 설계된 표준 문자 전산 처리 방식
* UTF, 문자 처리 알고리즘 등 전세계 모든 문자를 담는 ISO/IEC 10646 코드표를 사용함으로써, 각 언어의 충돌을 해결한다.
* 즉, 유니코드 사용시 한글/아랍어/간체 등을 통일된 환경에서 깨뜨리지 않고 사용
* let spade = "\u{2660}” 와 같이 코드 작성 후, print(shape.rawValue) 로 출력

### ✅ Class 혹은 객체 생성시 자꾸 잊는 것
      
      `객체지향`은 한 메서드가 하나의 일만 작업해야한다.
      `Card` 라는 객체 안에는 출력, 형변환, 타입 정의 등 여러 속성이 들어가게 된다.
      출력 메서드가 출력만 하기 위해서는, 메서드의 매개변수로 들어가야 할 변수를 Class 에 선언 -> init을 진행해 -> 인스턴스 생성시 값을 넣어줌 -> 그 값이 Print 메서드로 넘어가 출력
      하게 하는 것이다.
      
출력 결과물  
<img width="379" alt="스크린샷 2022-02-21 오후 11 18 55" src="https://user-images.githubusercontent.com/92635121/154974852-5167d023-a24d-49d0-9e41-d506ceb25387.png">
