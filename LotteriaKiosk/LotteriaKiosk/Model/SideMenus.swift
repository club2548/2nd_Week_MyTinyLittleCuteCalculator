//
//  SideMenus.swift
//  LotteriaKiosk
//
//  Created by t2023-m0026 on 12/27/23.
//

import Foundation
var sideMenus = SideMenus()

struct SideMenus: LotteriaMenu {
    let menuNames = [
        "깡돼후 돼지후라이드",
        "지파이 고소한맛(S)",
        "쉑쉑치킨",
        "통오징어링",
        "치킨너겟",
        "치즈스틱",
        "양념감자",
        "모짜크림치즈볼",
        "포테이토(L)",
        "웨지포테이토",
        "롱치즈스틱",
        "콘샐러드",
        "포테이토(R)",
        "토네이도 초코쿠키",
        "토네이도 스트로베리",
        "토네이도 허쉬초코",
    ]
    
    let menuPrices = [
        "깡돼후 돼지후라이드" : 6500,
        "지파이 고소한맛(S)" : 4300,
        "쉑쉑치킨" : 2900,
        "통오징어링" : 2600,
        "치킨너겟" : 2700,
        "치즈스틱" : 2400,
        "양념감자" : 2300,
        "모짜크림치즈볼" : 2300,
        "포테이토(L)" : 2200,
        "웨지포테이토" : 2100,
        "롱치즈스틱" : 2000,
        "콘샐러드" : 1900,
        "포테이토(R)" : 1800,
        "토네이도 초코쿠키" : 2800,
        "토네이도 스트로베리" : 2800,
        "토네이도 허쉬초코" : 2800,
    ]
    
    let menuImages = [
        "깡돼후 돼지후라이드" : "PorkFried",
        "지파이 고소한맛(S)" : "JiPai",
        "쉑쉑치킨" : "ShakeShakeChicken",
        "통오징어링" : "SquidRing",
        "치킨너겟" : "ChickenNugget",
        "치즈스틱" : "CheeseStick",
        "양념감자" : "SpicedPotato",
        "모짜크림치즈볼" : "MozzarellaCreamCheeseball",
        "포테이토(L)" : "PotatoL",
        "웨지포테이토" : "WedgePotato",
        "롱치즈스틱" : "LongCheeseStick",
        "콘샐러드" : "CornSalad",
        "포테이토(R)" : "PotatoR",
        "토네이도 초코쿠키" : "TornadoChocoCookie",
        "토네이도 스트로베리" : "TornadoStrawberry",
        "토네이도 허쉬초코" : "TornadoHersheyChoco"
    ]
}
