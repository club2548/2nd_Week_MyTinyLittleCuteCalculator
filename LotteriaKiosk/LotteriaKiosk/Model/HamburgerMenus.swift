//
//  HamburgerMenus.swift
//  LotteriaKiosk
//
//  Created by t2023-m0026 on 12/26/23.
//

import Foundation
var hamburgerMenus = HamburgerMenus()

struct HamburgerMenus: LotteriaMenu {
    
    let menuNames = [
        "더블클래식치즈버거",
        "더블치킨버거",
        "더블데리버거",
        "더블한우불고기버거",
        "한우불고기버거",
        "모짜렐라인더버거베이컨",
        "빅불버거",
        "더블리아미라클Ⅱ",
        "DoubleX2버거",
        "핫크리스피치킨버거",
        "사각새우더블버거",
        "리아미라클Ⅱ",
        "클래식치즈버거",
        "불고기버거",
        "새우버거",
        "T-REX",
        "치킨버거",
        "데리버거"
    ]
    
    let menuPrices = [
        "더블클래식치즈버거" : 6900,
        "더블치킨버거" : 5500,
        "더블데리버거" : 4500,
        "더블한우불고기버거" : 12400,
        "한우불고기버거" : 8400,
        "모짜렐라인더버거베이컨" : 7400,
        "빅불버거" : 7100,
        "더블리아미라클Ⅱ" : 6700,
        "DoubleX2버거" : 6800,
        "핫크리스피치킨버거" : 5900,
        "사각새우더블버거" : 5700,
        "리아미라클Ⅱ" : 5200,
        "클래식치즈버거" : 5200,
        "불고기버거" : 4700,
        "새우버거" : 4700,
        "T-REX" : 4700,
        "치킨버거" : 4000,
        "데리버거" : 3300
    ]
    
    let menuImages = [
        "더블클래식치즈버거" : "DoubleClassicCheeseBurger",
        "더블치킨버거" : "DoubleChickenBurger",
        "더블데리버거" : "DoubleTeriBurger",
        "더블한우불고기버거" : "DoubleKoreanBeefBurger",
        "한우불고기버거" : "KoreanBeefBurger",
        "모짜렐라인더버거베이컨" : "MozzarellaInTheBurgerBacon",
        "빅불버거" : "BigBullBurger",
        "더블리아미라클Ⅱ" : "DoubleRiaMiracleⅡ",
        "DoubleX2버거" : "DoubleX2Burger",
        "핫크리스피치킨버거" : "HotCrispyChickenBurger",
        "사각새우더블버거" : "ShrimpDoubleBurger",
        "리아미라클Ⅱ" : "RiaMiracleⅡ",
        "클래식치즈버거" : "ClassicCheeseBurger",
        "불고기버거" : "BeefBurger",
        "새우버거" : "ShrimpBurger",
        "T-REX" : "T-REX",
        "치킨버거" : "ChickenBurger",
        "데리버거" : "TeriBurger"
    ]
}
