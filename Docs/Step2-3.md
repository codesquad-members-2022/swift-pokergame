# Step2-3. 카드덱 구현하고 테스트하기

## 💻 작업 목록

- [x] Step2-2의 PR 리뷰 반영
- [x] 카드덱 구조체 구현
- [x] 카드덱 기능 확인하는 테스트 코드 추가
- [x] Step2-3 README.md 작성


## 📱 실행 화면

![스크린샷 2022-02-23 오후 6 00 39](https://user-images.githubusercontent.com/95578975/155288380-9aaed106-8a21-4952-941a-471958ddb001.png)

## 🤔 고민과 해결

### 1️⃣ shuffle 함수

❌ 시도 1 - 중복이 나왔다. #3에서 tempIndex를 인덱스로 넣어줘서 발생한 오류.

```swift
for index in 0..<count - 1 {
    let tempIndex = index
    let randomIndex = Int.random(in: index..<count) // #1
    cards[index] = cards[randomIndex] // #2
    cards[randomIndex] = cards[tempIndex] // #3 
}
```



⭕️ 시도 2 - #1에서 temp에 cards[index]를 저장하고, #2에서 cards[randomIndex]에 temp값을 저장하여 해결.

```swift
for index in 0..<count - 1 {
    let temp = cards[index] // #1
    let randomIndex = Int.random(in: index..<count)
    cards[index] = cards[randomIndex]
    cards[randomIndex] = temp // #2
}
```



### 2️⃣ 테스트 시나리오 작성

아직은 테스트 시나리오 작성이 어려워서 print 문과 카드 갯수를 if 문으로 확인하는 식으로 구현하였는데, 다른 방식을 더 찾아봐야할 것 같습니다.



## 💡 학습 키워드

- Struct
- Class
- 메모리 분석 도구
- 참조 접근자
- ARC
- CaseIterable
