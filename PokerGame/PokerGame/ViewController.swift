//
//  ViewController.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/21.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: Image.backgroundPatternImage) //ViewBackground Pattern
        putCardsOnView(originX: 0, y: 40, count: 7,inset: 10) //여러개의 카드 View에 올리기

        //카드 만들기
       let deck = Deck()
        deck.count
        deck.shuffle()
        deck.removeOne()
        deck.removeOne()
        deck.reset()
        
        
    }
    
    //putCardOnView함수를 몇번 실행할지 정하는 함수
    //ViewDidLoad를 좀 더 깔끔하게 만들기 위해 만들었다.
    //여러개의 카드를 View에 올리기 때문에 x라는 변수명 대신 originX라는 변수명을 정했다.
    func putCardsOnView(originX:CGFloat,y:CGFloat,count:CGFloat,inset: CGFloat) {
        
        let inset:CGFloat = 10
        var currentXPosition:CGFloat = originX + inset                       //시작 OriginX에 inset을 더함으로써 좌측에 여백을 줄 수있다
        //현재 시작점에서부터 전체Frame의 크기를 다시 계산한다.
        let superViewFrame = self.view.frame.width - currentXPosition //인자로 들어오는 originX값에서 부터 count나 inset에 상관없이 동일한 뷰를 보여줌
        
        //핸드폰 기종에 상관없이 View의 크기를 기준으로 frame을 분할하고자 정의했다.
        let width:CGFloat = (superViewFrame / count) - inset //크기를 inset만큼 줄이면 그러지는 좌표x는 inset만큼 커지므로 여백을 줄수 있다.
        let height:CGFloat = width * 1.27
        
        //루프를 돌면서 한장 한장 View에 넣는다.
        for _ in 0..<Int(count) {
            putCardOnView(x: currentXPosition, y: 40.0, width: width, height: height)
            currentXPosition += superViewFrame / count //카드를 하나 둘떄마다 둔 카드의 너비 + inset을 더한만큼 x 값을 이동하게 만들고자 했다.
        }
    }

    //View의 원하는 좌표 x,y에 width,height를 크기의 사각형의 카드를 올리기
    func putCardOnView(x:CGFloat,y:CGFloat,width:CGFloat, height:CGFloat) {
        let card = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
        card.image = Image.backImageOfCard
        self.view.addSubview(card)
    }
    
    //데이터 처리가 완료된 Card를 print하는 함수
    func printCardInfo(card:Card) {
        print(card)
    }

}

