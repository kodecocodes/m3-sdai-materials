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
class BakedGood: Recipe {
  var panSize: PanSize
  
  init(name: String, summary: String = "", instructions: String = "", ingredients: [Ingredient] = [], panSize: PanSize = .medium) {
    self.panSize = panSize
    super.init(name: name, summary: summary, instructions: instructions, ingredients: ingredients)
  }
  
  static let sampleBakedGoodData = [
    BakedGood(
      name: "Mom's Banana Nut Bread",
      summary: "A moist and nut filled banana bread",
      instructions: "Preheat oven to 350°F (175°C). Grease a 9x5 loaf pan. Mash bananas in a large bowl. Add brown sugar, eggs, vanilla extract, and mix well. Stir in flour, walnuts, and baking soda. Pour batter into the prepared pan. Bake for 50-60 minutes, or until a toothpick inserted into the center comes out clean. Let the bread cool in the pan for about 10 minutes",
      ingredients: [
        .init(name: "Bananas", amount: "3 large"),
        .init(name: "Granulated sugar", amount: "1 cup"),
        .init(name: "Brown sugar packed", amount: "1 cup"),
        .init(name: "Large eggs", amount: "2"),
        .init(name: "Vanilla extract", amount: "1 teaspoon")
      ],
      panSize: .medium,
    ),
    BakedGood(
      name: "Classic Chocolate Chip Cookies",
      summary: "Crispy edges with chewy centers, loaded with chocolate chips.",
      instructions: "Preheat oven to 375°F (190°C). Cream together butter, white sugar, and brown sugar until smooth. Beat in eggs and vanilla. Stir in flour, baking soda, and salt. Fold in chocolate chips. Drop by spoonfuls onto ungreased baking sheets. Bake for 8-10 minutes or until golden brown around edges.",
      ingredients: [
        .init(name: "Butter", amount: "1 cup"),
        .init(name: "White sugar", amount: "1 cup"),
        .init(name: "Brown sugar", amount: "1 cup"),
        .init(name: "Eggs", amount: "2"),
        .init(name: "Vanilla extract", amount: "2 teaspoons"),
        .init(name: "All-purpose flour", amount: "3 cups"),
        .init(name: "Baking soda", amount: "1 teaspoon"),
        .init(name: "Salt", amount: "0.5 teaspoon"),
        .init(name: "Chocolate chips", amount: "2 cups")
      ],
      panSize: .small
    ),
    BakedGood(
      name: "Lemon Drizzle Cake",
      summary: "A light and tangy lemon cake with a sweet glaze.",
      instructions: "Preheat oven to 350°F (175°C). Grease and flour a 9-inch round cake pan. Beat butter and sugar until fluffy. Add eggs one at a time, then mix in lemon zest and juice. Fold in flour and baking powder. Pour batter into pan. Bake for 35-40 minutes until golden and a skewer comes out clean. Mix lemon juice and powdered sugar to make glaze and pour over warm cake.",
      ingredients: [
        .init(name: "Butter", amount: "0.5 cup"),
        .init(name: "Sugar", amount: "1 cup"),
        .init(name: "Eggs", amount: "3"),
        .init(name: "Lemon zest", amount: "2 teaspoons"),
        .init(name: "Lemon juice", amount: "0.25 cup"),
        .init(name: "All-purpose flour", amount: "2 cups"),
        .init(name: "Baking powder", amount: "1.5 teaspoons"),
        .init(name: "Powdered sugar", amount: "0.5 cup")
      ],
      panSize: .large
    ),
    BakedGood(
      name: "Maple Pecan Scones",
      summary: "Flaky scones with a rich maple glaze and crunchy pecans.",
      instructions: "Preheat oven to 400°F (200°C). Mix flour, sugar, baking powder, and salt. Cut in cold butter until mixture resembles coarse crumbs. Stir in chopped pecans. Whisk eggs and maple syrup, then add to dry ingredients. Knead lightly and form into triangles. Bake 15-18 minutes until golden. Drizzle with maple glaze once cooled.",
      ingredients: [
        .init(name: "All-purpose flour", amount: "2 cups"),
        .init(name: "Sugar", amount: "1/4 cup"),
        .init(name: "Baking powder", amount: "1 tablespoon"),
        .init(name: "Salt", amount: "0.5 teaspoon"),
        .init(name: "Cold butter", amount: "0.5 cup"),
        .init(name: "Chopped pecans", amount: "0.75 cup"),
        .init(name: "Eggs", amount: "2"),
        .init(name: "Maple syrup", amount: "0.33 cup")
      ],
      panSize: .small
    ),
    BakedGood(
      name: "Rustic Apple Galette",
      summary: "A free-form tart with cinnamon-spiced apples and flaky crust.",
      instructions: "Preheat oven to 375°F (190°C). Roll out pie dough into a circle. Toss sliced apples with sugar, cinnamon, and lemon juice. Arrange apples in center of dough, leaving a border. Fold dough edges over apples. Brush crust with egg wash and sprinkle sugar. Bake 40-45 minutes until crust is golden and apples are tender.",
      ingredients: [
        .init(name: "Pie crust dough", amount: "1 sheet"),
        .init(name: "Apples", amount: "4 medium"),
        .init(name: "Sugar", amount: "0.5 cup"),
        .init(name: "Ground cinnamon", amount: "1 teaspoon"),
        .init(name: "Lemon juice", amount: "1 tablespoon"),
        .init(name: "Egg wash", amount: "1 egg beaten"),
        .init(name: "Coarse sugar", amount: "2 tablespoons")
      ],
      panSize: .large,
    ),
    BakedGood(
      name: "Cinnamon Swirl Bread",
      summary: "Sweet yeast bread with a cinnamon and sugar swirl.",
      instructions: "Prepare yeast dough and let rise until doubled. Roll dough into rectangle, sprinkle cinnamon sugar evenly, and roll up tightly. Place in loaf pan and let rise again. Bake at 350°F (175°C) for 30-35 minutes until golden brown. Cool before slicing.",
      ingredients: [
        .init(name: "All-purpose flour", amount: "4 cups"),
        .init(name: "Active dry yeast", amount: "2 1/4 teaspoons"),
        .init(name: "Milk", amount: "1 cup warm"),
        .init(name: "Sugar", amount: "0.25 cup"),
        .init(name: "Salt", amount: "1 teaspoon"),
        .init(name: "Butter", amount: "0.25 cup"),
        .init(name: "Eggs", amount: "2"),
        .init(name: "Ground cinnamon", amount: "2 tablespoons"),
        .init(name: "Brown sugar", amount: "0.5 cup")
      ],
      panSize: .medium
    ),
    BakedGood(
      name: "Blueberry Muffins",
      summary: "Moist muffins bursting with fresh blueberries and a crumbly topping.",
      instructions: "Preheat oven to 375°F (190°C). Mix dry ingredients except blueberries. In a separate bowl, combine milk, eggs, and melted butter. Fold wet ingredients into dry. Gently fold in blueberries. Spoon into muffin tins and sprinkle crumb topping. Bake 20-25 minutes until golden.",
      ingredients: [
        .init(name: "All-purpose flour", amount: "2 cups"),
        .init(name: "Sugar", amount: "0.75 cup"),
        .init(name: "Baking powder", amount: "2 teaspoons"),
        .init(name: "Salt", amount: "0.5 teaspoon"),
        .init(name: "Milk", amount: "1 cup"),
        .init(name: "Eggs", amount: "2"),
        .init(name: "Butter melted", amount: "0.5 cup"),
        .init(name: "Blueberries", amount: "1 cup"),
        .init(name: "Brown sugar (for topping)", amount: "0.25 cup"),
        .init(name: "Flour (for topping)", amount: "0.25 cup"),
        .init(name: "Butter (for topping)", amount: "3 tablespoons")
      ],
      panSize: .small,
    ),
    BakedGood(
      name: "Pumpkin Spice Cupcakes",
      summary: "Soft and fluffy cupcakes infused with pumpkin and warm spices.",
      instructions: "Preheat oven to 350°F (175°C). Combine flour, baking soda, salt, and pumpkin pie spice. Mix pumpkin puree, sugar, oil, eggs, and vanilla. Slowly add dry ingredients. Fill cupcake liners 2/3 full. Bake 18-20 minutes until a toothpick comes out clean. Cool and frost as desired.",
      ingredients: [
        .init(name: "All-purpose flour", amount: "1 3/4 cups"),
        .init(name: "Baking soda", amount: "1 teaspoon"),
        .init(name: "Salt", amount: "0.5 teaspoon"),
        .init(name: "Pumpkin pie spice", amount: "2 teaspoons"),
        .init(name: "Pumpkin puree", amount: "1 cup"),
        .init(name: "Sugar", amount: "1 cup"),
        .init(name: "Vegetable oil", amount: "0.5 cup"),
        .init(name: "Eggs", amount: "2"),
        .init(name: "Vanilla extract", amount: "1 teaspoon")
      ],
      panSize: .small
    ),
    BakedGood(
      name: "Cheddar Chive Biscuits",
      summary: "Fluffy biscuits flavored with sharp cheddar and fresh chives.",
      instructions: "Preheat oven to 425°F (220°C). Combine flour, baking powder, salt, and baking soda. Cut in cold butter until mixture resembles coarse crumbs. Stir in shredded cheddar and chopped chives. Add buttermilk and stir just until combined. Drop spoonfuls onto baking sheet and bake 12-15 minutes until golden.",
      ingredients: [
        .init(name: "All-purpose flour", amount: "2 1/4 cups"),
        .init(name: "Baking powder", amount: "1 tablespoon"),
        .init(name: "Baking soda", amount: "0.5 teaspoon"),
        .init(name: "Salt", amount: "1 teaspoon"),
        .init(name: "Cold butter", amount: "0.5 cup"),
        .init(name: "Shredded cheddar cheese", amount: "1 cup"),
        .init(name: "Chopped fresh chives", amount: "2 tablespoons"),
        .init(name: "Buttermilk", amount: "1 cup")
      ],
      panSize: .medium
    ),
    BakedGood(
      name: "Classic Pound Cake",
      summary: "Dense and buttery pound cake with a golden crust.",
      instructions: "Preheat oven to 350°F (175°C). Cream butter and sugar until fluffy. Add eggs one at a time. Mix in flour and salt. Pour batter into greased loaf pan and bake 60-70 minutes until a toothpick comes out clean. Let cool before slicing.",
      ingredients: [
        .init(name: "Unsalted butter", amount: "1 cup"),
        .init(name: "Sugar", amount: "2 cups"),
        .init(name: "Eggs", amount: "4"),
        .init(name: "All-purpose flour", amount: "3 cups"),
        .init(name: "Salt", amount: "0.5 teaspoon")
      ],
      panSize: .large
    ),
    BakedGood(
      name: "Carrot Cake Muffins",
      summary: "Moist muffins packed with grated carrots and warm spices, topped with cream cheese frosting.",
      instructions: "Preheat oven to 350°F (175°C). Combine flour, baking soda, salt, cinnamon, and nutmeg. Mix sugar, oil, eggs, and vanilla. Gradually add dry ingredients. Fold in grated carrots and chopped walnuts. Spoon into muffin liners and bake 20-25 minutes. Cool and frost if desired.",
      ingredients: [
        .init(name: "All-purpose flour", amount: "2 cups"),
        .init(name: "Baking soda", amount: "1 teaspoon"),
        .init(name: "Salt", amount: "0.5 teaspoon"),
        .init(name: "Ground cinnamon", amount: "1 teaspoon"),
        .init(name: "Ground nutmeg", amount: "0.5 teaspoon"),
        .init(name: "Sugar", amount: "1 cup"),
        .init(name: "Vegetable oil", amount: "0.5 cup"),
        .init(name: "Eggs", amount: "2"),
        .init(name: "Vanilla extract", amount: "1 teaspoon"),
        .init(name: "Grated carrots", amount: "1 1/2 cups"),
        .init(name: "Chopped walnuts", amount: "0.5 cup")
      ],
      panSize: .small
    ),
    BakedGood(
      name: "Chocolate Marble Cake",
      summary: "A beautiful cake with swirls of chocolate and vanilla batter.",
      instructions: "Preheat oven to 350°F (175°C). Prepare vanilla and chocolate batters separately. Alternate spoonfuls of each batter into a greased bundt pan. Swirl with a knife to create marbled effect. Bake 45-50 minutes until a toothpick comes out clean. Cool before serving.",
      ingredients: [
        .init(name: "All-purpose flour", amount: "2 1/2 cups"),
        .init(name: "Sugar", amount: "1 3/4 cups"),
        .init(name: "Baking powder", amount: "2 teaspoons"),
        .init(name: "Salt", amount: "0.5 teaspoon"),
        .init(name: "Butter", amount: "1 cup"),
        .init(name: "Eggs", amount: "4"),
        .init(name: "Milk", amount: "1 cup"),
        .init(name: "Vanilla extract", amount: "2 teaspoons"),
        .init(name: "Cocoa powder", amount: "0.75 cup")
      ],
      panSize: .large
    )
  ]
}
