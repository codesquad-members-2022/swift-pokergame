//
//  Card.swift
//  PokerGame
//
//  Created by 김상혁 on 2022/02/22.
//

import Foundation

struct Card {

    //다른 객체에 의해 카드값이 변경되면 안되므로 let으로 선언했습니다.
    
    //Card 구조체에서 제공해주는 방식으로만 faceData와 numericData에 접근할 수 있도록 private으로 선언했습니다.
        //다른 객체는 Card 객체의 faceData 값에만, 혹은 numericData 값에만 개별적으로 접근할 수 없고,
        //아래에 선언된 Card 구조체가 제공해주는 extension의 프로퍼티를 통해서
        //faceData와 numericData가 결합되어 표현된 하나의 String 형식으로만 받아볼 수 있게하기 위함입니다.

    private let faceData: CardData.FaceData
    private let numericData: CardData.NumericData
    
    init(faceData: CardData.FaceData, numericData: CardData.NumericData) {
        self.faceData = faceData
        self.numericData = numericData
    }
}

//함수가 아닌 extension을 이용했습니다.
//단순히 Card 객체가 갖는 두 프로퍼티의 값을 붙여서 String 타입으로 반환해주기만 하면 되므로
//메소드의 반환값으로 받는 것 보다 extension을 통해 프로퍼티 형식으로 바로 접근하는 것이 더 직관적일 것 같다고 생각했습니다.
extension Card: CustomStringConvertible {
    var description: String {
        return "\(self.faceData)\(self.numericData)"
    }
}
