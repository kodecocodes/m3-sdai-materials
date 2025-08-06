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

//@Model
//class Recipe {
//  @Attribute(.unique)
//  var name: String
//  var summary: String = ""
//  var instructions: String = ""
//
//  @Relationship(deleteRule: .cascade)
//  var ingredients: [Ingredient] = []
//
//  init(name: String, summary: String = "", instructions: String = "", ingredients: [Ingredient] = []) {
//    self.name = name
//    self.summary = summary
//    self.instructions = instructions
//    self.ingredients = ingredients
//  }
extension Recipe {
  static let sampleData = [
    Recipe(
      name: "Mom's Spaghetti",
      summary: "A great old fashioned spagehtti",
      instructions: "Cook the spaghetti according to package instructions.  In a large pan, heat olive oil over medium heat.  Add the onion and garlic and sauté until softened.  Add the canned tomatoes, basil, oregano, and salt.  Simmer for 15 minutes.  Add the cooked spaghetti and toss to coat.  Serve hot.",
      ingredients: [
        Ingredient(name: "Spaghetti", amount: "1 box"),
        Ingredient(name: "Onion", amount: "1 medium, diced"),
        Ingredient(name: "Garlic", amount: "4 cloves"),
        Ingredient(name: "Olive oil", amount: "2 Tbsp"),
        Ingredient(name: "Canned tomatoes", amount: "1 Large can"),
        Ingredient(name: "Basil", amount: "5 leaves"),
        Ingredient(name: "Oregano", amount: "2 Tbsp")
      ]
    ),
    Recipe(
      name: "Classic Pancakes",
      summary: "Fluffy and light pancakes perfect for breakfast",
      instructions: "In a bowl, mix flour, baking powder, sugar, and salt. In another bowl, whisk milk, eggs, and melted butter. Combine wet and dry ingredients until just mixed. Heat a griddle and pour batter, cooking until bubbles form. Flip and cook until golden brown. Serve with syrup.",
      ingredients: [
        Ingredient(name: "All-purpose flour", amount: "1 1/2 cups"),
        Ingredient(name: "Baking powder", amount: "3 1/2 tsp"),
        Ingredient(name: "Sugar", amount: "1 tbsp"),
        Ingredient(name: "Salt", amount: "1 tsp"),
        Ingredient(name: "Milk", amount: "1 1/4 cups"),
        Ingredient(name: "Egg", amount: "1 large"),
        Ingredient(name: "Butter, melted", amount: "3 tbsp")
      ]
    ),
    Recipe(
      name: "Chicken Caesar Salad",
      summary: "Crisp romaine with grilled chicken and creamy Caesar dressing",
      instructions: "Grill chicken breasts until cooked through and slice. Toss romaine lettuce with Caesar dressing, croutons, and Parmesan cheese. Top with sliced chicken. Serve immediately.",
      ingredients: [
        Ingredient(name: "Chicken breast", amount: "2 pieces"),
        Ingredient(name: "Romaine lettuce", amount: "1 head"),
        Ingredient(name: "Caesar dressing", amount: "1/2 cup"),
        Ingredient(name: "Croutons", amount: "1 cup"),
        Ingredient(name: "Parmesan cheese", amount: "1/4 cup, grated")
      ]
    ),
    Recipe(
      name: "Beef Stroganoff",
      summary: "Tender beef in a creamy mushroom sauce served over noodles",
      instructions: "Sauté sliced mushrooms and onions in butter until soft. Add strips of beef and brown. Stir in sour cream and beef broth, simmer until sauce thickens. Serve over cooked egg noodles.",
      ingredients: [
        Ingredient(name: "Beef sirloin", amount: "1 lb, sliced"),
        Ingredient(name: "Mushrooms", amount: "8 oz, sliced"),
        Ingredient(name: "Onion", amount: "1 medium, chopped"),
        Ingredient(name: "Butter", amount: "3 tbsp"),
        Ingredient(name: "Sour cream", amount: "1 cup"),
        Ingredient(name: "Beef broth", amount: "1 cup"),
        Ingredient(name: "Egg noodles", amount: "12 oz")
      ]
    ),
    Recipe(
      name: "Vegetable Stir Fry",
      summary: "Quick and healthy veggie stir-fry with a savory sauce",
      instructions: "Heat oil in a wok over high heat. Add garlic and ginger, then toss in vegetables. Stir-fry until crisp-tender. Add soy sauce and sesame oil, cook another minute. Serve with steamed rice.",
      ingredients: [
        Ingredient(name: "Broccoli florets", amount: "1 cup"),
        Ingredient(name: "Carrots", amount: "1 cup, sliced"),
        Ingredient(name: "Bell pepper", amount: "1 medium, sliced"),
        Ingredient(name: "Garlic", amount: "3 cloves, minced"),
        Ingredient(name: "Ginger", amount: "1 tsp, grated"),
        Ingredient(name: "Soy sauce", amount: "2 tbsp"),
        Ingredient(name: "Sesame oil", amount: "1 tsp"),
        Ingredient(name: "Vegetable oil", amount: "2 tbsp")
      ]
    ),
    Recipe(
      name: "Shrimp Scampi",
      summary: "Succulent shrimp cooked in garlic butter sauce over pasta",
      instructions: "Sauté garlic in butter and olive oil. Add shrimp and cook until pink. Stir in lemon juice and parsley. Toss with cooked linguine and serve warm.",
      ingredients: [
        Ingredient(name: "Shrimp", amount: "1 lb, peeled and deveined"),
        Ingredient(name: "Garlic", amount: "4 cloves, minced"),
        Ingredient(name: "Butter", amount: "4 tbsp"),
        Ingredient(name: "Olive oil", amount: "2 tbsp"),
        Ingredient(name: "Lemon juice", amount: "2 tbsp"),
        Ingredient(name: "Parsley", amount: "2 tbsp, chopped"),
        Ingredient(name: "Linguine pasta", amount: "12 oz")
      ]
    ),
    Recipe(
      name: "Tomato Basil Soup",
      summary: "Creamy and comforting tomato soup with fresh basil",
      instructions: "Cook onions and garlic in olive oil until softened. Add canned tomatoes, vegetable broth, and basil. Simmer for 20 minutes. Blend until smooth, then stir in cream. Warm through and serve.",
      ingredients: [
        Ingredient(name: "Onion", amount: "1 medium, chopped"),
        Ingredient(name: "Garlic", amount: "3 cloves, minced"),
        Ingredient(name: "Canned tomatoes", amount: "28 oz"),
        Ingredient(name: "Vegetable broth", amount: "2 cups"),
        Ingredient(name: "Fresh basil", amount: "1/4 cup, chopped"),
        Ingredient(name: "Heavy cream", amount: "1/2 cup"),
        Ingredient(name: "Olive oil", amount: "2 tbsp")
      ],
    ),
    Recipe(
      name: "French Toast",
      summary: "Golden and crispy french toast with a hint of cinnamon",
      instructions: "Whisk eggs, milk, cinnamon, and vanilla. Dip bread slices in mixture and cook on a buttered griddle until golden on both sides. Serve with maple syrup and fresh berries.",
      ingredients: [
        Ingredient(name: "Bread slices", amount: "6"),
        Ingredient(name: "Eggs", amount: "3"),
        Ingredient(name: "Milk", amount: "1 cup"),
        Ingredient(name: "Ground cinnamon", amount: "1 tsp"),
        Ingredient(name: "Vanilla extract", amount: "1 tsp"),
        Ingredient(name: "Butter", amount: "2 tbsp"),
        Ingredient(name: "Maple syrup", amount: "For serving"),
        Ingredient(name: "Fresh berries", amount: "For serving")
      ]
    ),
    Recipe(
      name: "Guacamole",
      summary: "Creamy avocado dip with fresh lime and cilantro",
      instructions: "Mash ripe avocados in a bowl. Stir in diced tomatoes, onions, jalapeños, lime juice, cilantro, and salt. Serve immediately with tortilla chips.",
      ingredients: [
        Ingredient(name: "Ripe avocados", amount: "2"),
        Ingredient(name: "Tomato", amount: "1 small, diced"),
        Ingredient(name: "Red onion", amount: "1/4 cup, diced"),
        Ingredient(name: "Jalapeño", amount: "1, seeded and minced"),
        Ingredient(name: "Lime juice", amount: "2 tbsp"),
        Ingredient(name: "Fresh cilantro", amount: "2 tbsp, chopped"),
        Ingredient(name: "Salt", amount: "1/2 tsp")
      ]
    ),
    Recipe(
      name: "Margherita Pizza",
      summary: "Classic pizza topped with fresh mozzarella, tomatoes, and basil",
      instructions: "Roll out pizza dough. Spread tomato sauce evenly. Add sliced mozzarella and tomatoes. Bake at 475°F for 12-15 minutes. Top with fresh basil leaves and a drizzle of olive oil before serving.",
      ingredients: [
        Ingredient(name: "Pizza dough", amount: "1 ball"),
        Ingredient(name: "Tomato sauce", amount: "1/2 cup"),
        Ingredient(name: "Fresh mozzarella", amount: "8 oz, sliced"),
        Ingredient(name: "Tomato", amount: "1 medium, sliced"),
        Ingredient(name: "Fresh basil leaves", amount: "Handful"),
        Ingredient(name: "Olive oil", amount: "1 tbsp")
      ]
    )
  ]
}

