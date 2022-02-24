//
//  InputView.swift
//  PokerGameApp
//
//  Created by Selina on 2022/02/24.
//

import Foundation

struct InputView {
    static func readGameInfo() -> [String] {
        print("카드게임 방식와 인원 수를 입력하세요.")
        let input = readLine() ?? ""
        return input.split(separator: " ").map { String($0) }
    }
}
