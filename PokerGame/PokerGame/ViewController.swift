//
//  ViewController.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: Image.backgroundPatternImage) //ViewBackground Pattern
        
        let inset:CGFloat = 3
        let xPosition:CGFloat = 0 //x위치만 바뀌기 떄문에 var로 선언해주었다
        let yPosition:CGFloat = 40.0
        
        putCardsOnView(originX: xPosition, y: yPosition, inset: inset, count: 7) //여러개의 카드 View에 올리기
        
    }
    
    //putCardOnView함수를 몇번 실행할지 정하는 함수
    //ViewDidLoad를 좀 더 깔끔하게 만들기 위해 만들었다.
    //여러개의 카드를 View에 올리기 때문에 x라는 변수명 대신 originX라는 변수명을 정했다.
    func putCardsOnView(originX:CGFloat,y:CGFloat,inset:CGFloat, count:Int) {
        var xPosition:CGFloat = originX
        for _ in 0..<count {
            putCardOnView(x: xPosition, y: y,inset: inset)
            xPosition += 390 / 7.0 //카드를 하나 둘떄마다 둔 카드의 너비+ inset을 더한만큼 이동하게 만들고자 했다.
        }
    }

    //View의 원하는 좌표 x,y에 width,height를 크기의 사각형의 카드를 올리기
    func putCardOnView(x:CGFloat,y:CGFloat,inset:CGFloat) {
        let width:CGFloat = 390.0 / 8.0
        let height:CGFloat = width * 1.27
        let card = UIImageView(frame: CGRect(x: x + inset, y: y, width: width, height: height))
        card.image = Image.backImageOfCard
        self.view.addSubview(card)
    }

}

