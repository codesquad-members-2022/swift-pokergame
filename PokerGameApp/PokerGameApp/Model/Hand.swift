import Foundation

enum Hand: Comparable {
    //MARK: 이번 미션에서 A 는 항상 1로 값을 매기기 때문에 로얄 스트레이트 플러시와 마운틴은 없다. 나무위키 참조
    case highCard
    case onePair
    case twoPair
    case triple
    case straight
    case backStraight
    case flush
    case fullHouse
    case fourCard
    case straightFlush
    case backStraightFlush
}

