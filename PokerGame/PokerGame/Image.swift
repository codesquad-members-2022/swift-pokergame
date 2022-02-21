//
//  Images.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/21.
//

import UIKit

//카드게임에 필요한 이미지들 중 배경과 카드 뒷면은 카드 종류에 상관없이 일정하므로 Struck와 static을 이용해서 구현시 좀더 보기쉽게 만들어 보았다
struct Image {
    
    //카드 뒷면
    static var backImageOfCard:UIImage {
        guard let cardBack = UIImage(named: "card-back") else { return UIImage() }
        return cardBack
    }
    
    //옵셔널 바인딩도 struct에서 처리하여 구현시 더 깔끔하게 보이도록 한다.
    static var backgroundPatternImage:UIImage {
        guard let patternImage = UIImage(named: "bg_pattern") else { return UIImage() }
        return patternImage
    }
}



