/// Copyright (c) 2025 Kodeco Inc.
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Foundation
import SwiftData

@available(iOS 26, *)
@Model
class Beverage: Recipe {
  var season: Season // a summer drink or a winter drink?
  var caffienated: Bool

  init(name: String, summary: String = "", instructions: String = "", ingredients: [Ingredient] = [], season: Season, caffienated: Bool) {
    self.season = season
    self.caffienated = caffienated
    super.init(name: name, summary: summary, instructions: instructions, ingredients: ingredients)
  }

  static let sampleBeverageData: [Beverage] = [
    Beverage(
      name: "Iced Mint Lemonade",
      summary: "A refreshing summer drink with fresh mint and tangy lemon juice.",
      instructions: "Muddle mint leaves in a glass. Add lemon juice, simple syrup, and ice. Top with sparkling water and stir well.",
      ingredients: [
        Ingredient(name: "Fresh mint leaves", amount: "10 leaves"),
        Ingredient(name: "Lemon juice", amount: "1 cup"),
        Ingredient(name: "Simple syrup", amount: "1/2 cup"),
        Ingredient(name: "Sparkling water", amount: "2 cups"),
        Ingredient(name: "Ice cubes", amount: "As needed")
      ],
      season: .summer,
      caffienated: false,
    ),
    Beverage(
      name: "Classic Hot Chocolate",
      summary: "A warm and cozy winter drink with rich chocolate flavor.",
      instructions: "Heat milk in a saucepan. Stir in cocoa powder and sugar until dissolved. Pour into mugs and top with whipped cream or marshmallows.",
      ingredients: [
        Ingredient(name: "Milk", amount: "2 cups"),
        Ingredient(name: "Cocoa powder", amount: "2 tbsp"),
        Ingredient(name: "Sugar", amount: "2 tbsp"),
        Ingredient(name: "Whipped cream", amount: "Optional"),
        Ingredient(name: "Marshmallows", amount: "Optional")
      ],
      season: .winter,
      caffienated: false
    ),
    Beverage(
      name: "Chai Latte",
      summary: "A spiced tea latte with a creamy and warming flavor for chilly days.",
      instructions: "Brew strong black tea with chai spices. Heat milk and froth it. Combine tea and milk, sweeten with honey if desired.",
      ingredients: [
        Ingredient(name: "Black tea", amount: "1 cup"),
        Ingredient(name: "Chai spice mix", amount: "1 tsp"),
        Ingredient(name: "Milk", amount: "1 cup"),
        Ingredient(name: "Honey", amount: "1 tbsp"),
        Ingredient(name: "Cinnamon stick", amount: "1")
      ],
      season: .winter,
      caffienated: true
    ),
    Beverage(
      name: "Peach Iced Tea",
      summary: "Sweet and fruity iced tea perfect for hot summer afternoons.",
      instructions: "Brew black tea and chill. Blend fresh peaches to make puree. Mix tea, peach puree, and ice before serving.",
      ingredients: [
        Ingredient(name: "Black tea", amount: "2 cups"),
        Ingredient(name: "Fresh peaches", amount: "2 large"),
        Ingredient(name: "Sugar", amount: "2 tbsp"),
        Ingredient(name: "Ice cubes", amount: "As needed"),
        Ingredient(name: "Lemon wedges", amount: "For garnish")
      ],
      season: .summer,
      caffienated: true,
    ),
    Beverage(
      name: "Eggnog",
      summary: "A rich and creamy holiday drink with eggs, milk, spices, and a hint of alcohol.",
      instructions: "Beat eggs and sugar. Heat milk with cinnamon and nutmeg. Slowly combine and chill. Add rum or bourbon if desired.",
      ingredients: [
        Ingredient(name: "Eggs", amount: "4"),
        Ingredient(name: "Sugar", amount: "3/4 cup"),
        Ingredient(name: "Milk", amount: "2 cups"),
        Ingredient(name: "Ground cinnamon", amount: "1 tsp"),
        Ingredient(name: "Nutmeg", amount: "1/2 tsp"),
        Ingredient(name: "Rum or bourbon", amount: "1/2 cup (optional)")
      ],
      season: .winter,
      caffienated: false
    ),
    Beverage(
      name: "Watermelon Cooler",
      summary: "A hydrating and sweet summer drink with fresh watermelon and lime.",
      instructions: "Blend watermelon chunks until smooth. Mix in lime juice and mint leaves. Serve chilled with ice cubes.",
      ingredients: [
        Ingredient(name: "Watermelon", amount: "3 cups, cubed"),
        Ingredient(name: "Lime juice", amount: "2 tbsp"),
        Ingredient(name: "Fresh mint leaves", amount: "5 leaves"),
        Ingredient(name: "Ice cubes", amount: "As needed")
      ],
      season: .summer,
      caffienated: false
    ),
    Beverage(
      name: "Pumpkin Spice Latte",
      summary: "A seasonal autumn favorite combining espresso, pumpkin, and spices with steamed milk.",
      instructions: "Combine espresso with pumpkin puree and spices. Heat and froth milk then mix with espresso. Top with whipped cream and cinnamon.",
      ingredients: [
        Ingredient(name: "Espresso", amount: "1 shot"),
        Ingredient(name: "Pumpkin puree", amount: "2 tbsp"),
        Ingredient(name: "Pumpkin pie spice", amount: "1 tsp"),
        Ingredient(name: "Milk", amount: "1 cup"),
        Ingredient(name: "Whipped cream", amount: "For topping")
      ],
      season: .winter,
      caffienated: true,
    ),
    Beverage(
      name: "Cucumber Lime Sparkler",
      summary: "A light and bubbly summer drink with cucumber and lime zest.",
      instructions: "Muddle cucumber slices with lime juice. Add sparkling water and ice. Garnish with cucumber and lime slices.",
      ingredients: [
        Ingredient(name: "Cucumber", amount: "1/2, sliced"),
        Ingredient(name: "Lime juice", amount: "2 tbsp"),
        Ingredient(name: "Sparkling water", amount: "2 cups"),
        Ingredient(name: "Ice cubes", amount: "As needed")
      ],
      season: .summer,
      caffienated: false
    ),
    Beverage(
      name: "Mulled Wine",
      summary: "A warm and spiced red wine drink perfect for cold winter nights.",
      instructions: "Heat red wine with orange slices, cinnamon sticks, cloves, and sugar. Simmer gently and serve warm.",
      ingredients: [
        Ingredient(name: "Red wine", amount: "1 bottle"),
        Ingredient(name: "Orange slices", amount: "1 orange"),
        Ingredient(name: "Cinnamon sticks", amount: "2"),
        Ingredient(name: "Cloves", amount: "5"),
        Ingredient(name: "Sugar", amount: "1/4 cup")
      ],
      season: .winter,
      caffienated: false
    ),
    Beverage(
      name: "Strawberry Basil Lemonade",
      summary: "A sweet and herbal lemonade with fresh strawberries and basil.",
      instructions: "Blend strawberries and basil leaves. Mix with lemon juice, simple syrup, and water. Serve over ice.",
      ingredients: [
        Ingredient(name: "Fresh strawberries", amount: "1 cup"),
        Ingredient(name: "Basil leaves", amount: "8 leaves"),
        Ingredient(name: "Lemon juice", amount: "1 cup"),
        Ingredient(name: "Simple syrup", amount: "1/2 cup"),
        Ingredient(name: "Water", amount: "3 cups"),
        Ingredient(name: "Ice cubes", amount: "As needed")
      ],
      season: .summer,
      caffienated: false
    ),
    Beverage(
      name: "Ginger Turmeric Tea",
      summary: "A warming, anti-inflammatory tea with fresh ginger and turmeric.",
      instructions: "Simmer sliced ginger and turmeric in water. Strain and add honey and lemon to taste.",
      ingredients: [
        Ingredient(name: "Fresh ginger", amount: "2 inches, sliced"),
        Ingredient(name: "Fresh turmeric", amount: "1 inch, sliced"),
        Ingredient(name: "Water", amount: "3 cups"),
        Ingredient(name: "Honey", amount: "1 tbsp"),
        Ingredient(name: "Lemon juice", amount: "1 tbsp")
      ],
      season: .winter,
      caffienated: false
    )
  ]
}
