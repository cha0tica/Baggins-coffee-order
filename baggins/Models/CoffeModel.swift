//
//  CoffeModel.swift
//  baggins
//
//  Created by Agata on 19.08.2023.
//

import SwiftUI

struct Coffee: Identifiable {
    var id: String = UUID().uuidString
    var image: String
    var coffee: String
    var sizes: [CoffeeSize]
    var description: String
}

struct CoffeeSize: Identifiable {
    var id: Int
    var size: Int
    var price: Int
    var value: String
}

struct CoffeeCartCard : Identifiable {
    var id: String = UUID().uuidString
    var image: String
    var coffee: String
    var size: Int
    var price: Int
    var selectedSizeIndex: Int
}

var ClassicItemsMenu = [
    Coffee(image: "Espresso",
           coffee: "Эспрессо",
           sizes: [
            CoffeeSize(id: 0, size: 25, price: 110, value: "Б 0,02 l Ж 0,00 l У 0,03 l кКал 0,18"),
            CoffeeSize(id: 1, size: 50, price: 160, value:"Б 0,04 l Ж 0,00 l У 0,05 l кКал 0,36")],
           description: "Состав: молотый кофе, вода"),
    
    Coffee(image: "Americano",
           coffee: "Американо",
           sizes: [
            CoffeeSize(id: 0, size: 250, price: 120, value: "Б 0,04 l Ж 0,00 l У 0,05 l кКал 0,36"),
            CoffeeSize(id: 1, size: 380, price: 170, value: "Б 0,05 l Ж 0,00 l У 0,08 l кКал 0,54"),
            CoffeeSize(id: 2, size: 510, price: 205, value:"Б 0,09 l Ж 0,00 l У 0,14 l кКал 0,90")],
           description: "Состав: молотый кофе, вода"),
    
    Coffee(image: "Cappuccino",
           coffee: "Капучино",
           sizes: [CoffeeSize(id: 0, size: 250, price: 140, value: "Б 5,34 l Ж 6,08 l У 8,96 l кКал 110,38"),
                   CoffeeSize(id: 1, size: 380, price: 200, value: "Б 7,04 l Ж 8,00 l У 11,80 l кКал 145,36"),
                   CoffeeSize(id: 2, size: 510, price: 245, value: "Б 9,85 l Ж 11,20 l У 16,53 l кКал 203,54")],
           description: "Состав: эспрессо, молоко"),
    
    Coffee(image: "Latte",
           coffee: "Латте",
           sizes: [
            CoffeeSize(id: 0, size: 250, price: 140, value: "Б 5,34 l Ж 6,08 l У 8,96 l кКал 110,38"),
            CoffeeSize(id: 1, size: 380, price: 200, value: "Б 7,04 l Ж 8,00 l У 11,80 l кКал 145,36"),
            CoffeeSize(id: 2, size: 510, price: 245, value: "Б 9,85 l Ж 11,20 l У 16,53 l кКал 203,54")],
           description: "Состав: эспрессо, молоко"),
    
    Coffee(image: "Raf",
           coffee: "Раф",
           sizes: [
            CoffeeSize(id: 0, size: 250, price: 170, value: "Б 4,20 l Ж 16,00 l У 15,19 l кКал 219,16"),
            CoffeeSize(id: 1, size: 380, price: 245, value: "Б 6,02 l Ж 23,00 l У 26,37 l кКал 331,76"),
            CoffeeSize(id: 2, size: 510, price: 275, value: "Б 8,62 l Ж 33,00 l У 38,87 l кКал 479,76")
           ],
           description: "Состав: эспрессо, сливки, сироп или ванильный сахар"),
    
    Coffee(image: "Cocoa",
           coffee: "Какао",
           sizes: [
            CoffeeSize(id: 0, size: 250, price: 175, value: "Б 8,30 l Ж 17,80 l У 19,60 l кКал 279,50"),
            CoffeeSize(id: 1, size: 380, price: 245, value: "Б 12,90 l Ж 28,60 l У 31,10 l кКал 446,50"),
            CoffeeSize(id: 2, size: 510, price: 295, value: "Б 17,50 l Ж 39,40 l У 42,60 l кКал 613,50")],
           description: "Состав: темный шоколад, молоко"),
    
    Coffee(image: "Hotchoc",
           coffee: "Горячий Шоколад",
           sizes: [
            CoffeeSize(id: 0, size: 250, price: 210, value: "Б 10,72 l Ж 28,88 l У 29,33 l кКал 437,20"),
            CoffeeSize(id: 1, size: 380, price: 280, value: "Б 15,72 l Ж 45,68 l У 45,28 l кКал 684,20")],
           description: "Состав: темный шоколад, молоко"),
    
    Coffee(image: "Flat",
           coffee: "Флэт Уайт",
           sizes: [
            CoffeeSize(id: 0, size: 250, price: 175, value: "Б 4,52 l Ж 5,12 l У 7,57 l кКал 93,16"),
            CoffeeSize(id: 1, size: 380, price: 240, value: "Б 6,76 l Ж 7,68 l У 11,33 l кКал 139,56")],
           description: "Состав: эспрессо, молоко")
]

var BrandedItemsMenu = [
    Coffee(image: "RafBounty",
           coffee: "Раф Баунти",
           sizes: [
            CoffeeSize(id: 0, size: 380, price: 255, value: "Б 6,47 l Ж 24,90 l У 28,07 l кКал 359,01"),
            CoffeeSize(id: 1, size: 510, price: 290, value: "Б 9,52 l Ж 36,80 l У 42,27 l кКал 534,26")],
           description: "Состав: эспрессо, сливки 10%, темный шоколад, сироп"),
    
    Coffee(image: "RafOrange",
           coffee: "Апельсиновый кофе",
           sizes: [
            CoffeeSize(id: 0, size: 380, price: 210, value: "380 мл: Б 0,04 l Ж 0 l У 31,55 l кКал 126,36"),
            CoffeeSize(id: 1, size: 510, price: 235, value: "510 мл: Б 0,04 l Ж 0 l У 42,05 l кКал 168,36")
           ],
           description: "Состав: эспрессо, Апельсиновый сок"),
    
    Coffee(image: "SaltedC",
           coffee: "Соленая Карамель",
           sizes: [
            CoffeeSize(id: 0, size: 380, price: 230, value: "380 мл: Б 7,04 l Ж 8,00 l У 28,00 l кКал 205,36"),
            CoffeeSize(id: 1, size: 510, price: 255, value: "510 мл: Б 9,84 l Ж 11,20 l У 40,80 l кКал 293,36")],
           description: "Состав: эспрессо, молоко, сироп, соль")
]

var SeasnonItemsMenu = [
    Coffee(image: "BerryLatte",
           coffee: "Латте Ягодный Пломбир",
           sizes: [CoffeeSize(id: 0, size: 450, price: 299, value: "Б 4,75 l Ж 5,84 l У 49,51 l кКал 229,74")],
           description: "Состав: Эспрессо, кокосовое молоко, концентрат черники, сироп Гренадин, сироп Черная смородина, лед"),
    
    Coffee(image: "CherryBumble",
           coffee: "Черри Бамбл",
           sizes: [CoffeeSize(id: 0, size: 450, price: 299, value: "Б 2,68 l Ж 2,61 l У 48,81 l кКал 196")],
           description: "Состав: эспрессо, вишневый сок, апельсиновый сок, свежий лимон, сироп Гренадин, лед"),
    
    Coffee(image: "OrangeBumble",
           coffee: "Оранж Бамбл",
           sizes: [CoffeeSize(id: 0, size: 450, price: 299, value: "Б 2,50 l Ж 2,59 l У 52,56 l кКал 204,8")],
           description: "эспрессо, апельсиновый сок, карамельный сироп, лед"),
    
    Coffee(image: "PeachLimeLemonade",
           coffee: "Лимонад Персик-лайм",
           sizes: [CoffeeSize(id: 0, size: 450, price: 299, value: "Б 0 l Ж 0 l У 48,78 l кКал 189")],
           description: "Состав: лед, яблочный сок, тоник, сироп \"персик\", сок лайма"
          )
]

extension Coffee: Equatable {
    static func ==(lhs: Coffee, rhs: Coffee) -> Bool {
        return lhs.id == rhs.id
    }
}
