//
//  DrinkMenus.swift
//  LotteriaKiosk
//
//  Created by t2023-m0026 on 12/27/23.
//

import Foundation
var drinkMenus = DrinkMenus()

struct DrinkMenus: LotteriaMenu {

    let menuNames = [
        "콜라 PET(1.25L)",
        "사이다 PET(1.25L)",
        "레모네이드",
        "아이스티",
        "오렌지주스 PET",
        "아이스카페라떼",
        "카페라떼",
        "아이스아메리카노 L",
        "아이스아메리카노 R",
        "아메리카노",
        "콜라(L)",
        "사이다(L)",
        "제로슈거콜라 L",
        "콜라(R)",
        "사이다(R)",
        "제로슈거콜라 R"
    ]
    
    let menuPrices = [
        "콜라 PET(1.25L)" : 3000,
        "사이다 PET(1.25L)" : 3000,
        "레모네이드" : 2700,
        "아이스티" : 2300,
        "오렌지주스 PET" : 2500,
        "아이스카페라떼" : 3000,
        "카페라떼" : 3000,
        "아이스아메리카노 L" : 3000,
        "아이스아메리카노 R" : 2500,
        "아메리카노" : 2500,
        "콜라(L)" : 2200,
        "사이다(L)" : 2200,
        "제로슈거콜라 L" : 2200,
        "콜라(R)" : 2000,
        "사이다(R)" : 2000,
        "제로슈거콜라 R" : 2000
    ]
    
    let menuImages = [
        "콜라 PET(1.25L)" : "CokePET",
        "사이다 PET(1.25L)" : "SpritePET",
        "레모네이드" : "Lemonade",
        "아이스티" : "IcedTea",
        "오렌지주스 PET" : "OrangeJuicePET",
        "아이스카페라떼" : "IcedCaffeLatte",
        "카페라떼" : "CaffeLatte",
        "아이스아메리카노 L" : "IcedAmericanL",
        "아이스아메리카노 R" : "IcedAmericanoR",
        "아메리카노" : "Americano",
        "콜라(L)" : "CokeL",
        "사이다(L)" : "SpriteL",
        "제로슈거콜라 L" : "ZeroCokeL",
        "콜라(R)" : "CokeR",
        "사이다(R)" : "SpriteR",
        "제로슈거콜라 R" : "ZeroCokeR"
    ]
}
