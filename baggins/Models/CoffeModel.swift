//
//  CoffeModel.swift
//  baggins
//
//  Created by Agata on 19.08.2023.
//

import SwiftUI

struct Category: Identifiable {
    var id: String = UUID().uuidString
    var name: String
}

var categories = [
    Category(name: "Классика"),
    Category(name: "Фирменные напитки"),
    Category(name: "Сезонные напитки")]


struct Coffee: Identifiable {
    var id: String = UUID().uuidString
    var image: String
    var coffee: String
    var size: Int
    var price: Int
    var description: String
    var value: String
}

var ClassicItemsMenu = [
    Coffee(image: "Espresso",
           coffee: "Эспрессо",
           size: 25,
           price: 110,
           description: "Состав: молотый кофе, вода",
           value: "Б 0,02 l Ж 0,00 l У 0,03 l кКал 0,18"),
    
    Coffee(image: "Americano",
           coffee: "Американо",
           size: 250,
           price: 120,
           description: "Состав: молотый кофе, вода",
           value: "Б 0,04 l Ж 0,00 l У 0,05 l кКал 0,36"),
    
    Coffee(image: "Cappuccino",
           coffee: "Капучино",
           size: 250,
           price: 120,
           description: "Состав: эспрессо, молоко",
           value: "Б 5,34 l Ж 6,08 l У 8,96 l кКал 110,38"),
    
    Coffee(image: "Latte",
           coffee: "Латте",
           size: 250,
           price: 120,
           description: "Состав: эспрессо, молоко",
           value: "Б 5,34 l Ж 6,08 l У 8,96 l кКал 110,38"),
    
    Coffee(image: "Raf",
           coffee: "Раф",
           size: 250,
           price: 120,
           description: "Состав: эспрессо, сливки, сироп или ванильный сахар",
           value: "Б 4,20 l Ж 16,00 l У 15,19 l кКал 219,16"),
    
    Coffee(image: "Cocoa",
           coffee: "Какао",
           size: 250, price: 120,
           description: "Состав: темный шоколад, молоко",
           value: "Б 8,30 l Ж 17,80 l У 19,60 l кКал 279,50"),
    
    Coffee(image: "Hotchoc",
           coffee: "Горячий Шоколад",
           size: 250,
           price: 120,
           description: "Состав: темный шоколад, молоко",
           value: "Б 10,72 l Ж 28,88 l У 29,33 l кКал 437,20"),
    
    Coffee(image: "Flat",
           coffee: "Флэт Уайт",
           size: 250, price: 120,
           description: "Состав: эспрессо, молоко",
           value: "Б 4,52 l Ж 5,12 l У 7,57 l кКал 93,16")
]

var SeasnonItemsMenu = [
    Coffee(image: "BerryLatte",
           coffee: "Латте Ягодный Пломбир",
           size: 500,
           price: 299,
           description: "Состав: Эспрессо, кокосовое молоко, концентрат черники, сироп Гренадин, сироп Черная смородина, лед",
           value: "Б 4,75 l Ж 5,84 l У 49,51 l кКал 229,74"),
    
    Coffee(image: "CherryBumble",
           coffee: "Черри Бамбл",
           size: 500,
           price: 299,
           description: "Состав: эспрессо, вишневый сок, апельсиновый сок, свежий лимон, сироп Гренадин, лед",
           value: "Б 2,68 l Ж 2,61 l У 48,81 l кКал 196")
]

var BrandedItemsMenu = [
    Coffee(image: "RafBounty",
           coffee: "Раф Баунти",
           size: 380,
           price: 255,
           description: "Состав: эспрессо, сливки 10%, темный шоколад, сироп",
           value: "Б 6,47 l Ж 24,90 l У 28,07 l кКал 359,01"),
    
    Coffee(image: "RafOrange",
           coffee: "Апельсиновый кофе",
           size: 380,
           price: 210,
           description: "Состав: эспрессо, Апельсиновый сок",
           value: "380 мл: Б 0,04 l Ж 0 l У 31,55 l кКал 126,36"),
    
    Coffee(image: "SaltedC",
           coffee: "Соленая Карамель",
           size: 380,
           price: 230,
           description: "Состав: эспрессо, молоко, сироп, соль",
           value: "Б 7,04 l Ж 8,00 l У 28,00 l кКал 205,36")
]
