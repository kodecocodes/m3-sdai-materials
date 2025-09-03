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

import SwiftUI
import SwiftData

//typealias Recipe = RecipesSchemaV2.Recipe

enum RecipeType: String, CaseIterable, Identifiable {
  case all = "All"
  case bakedGoods = "Baked Goods"
  case beverages = "Beverages"

  var id: String { self.rawValue }
}


struct ContentView: View {

  @State private var recipeType: RecipeType = .all
  @State private var searchString: String = ""
  
  func getPredicate(for type: RecipeType) -> Predicate<Recipe>? {
      // Base predicate for recipe type
      let typePredicate: Predicate<Recipe>?
      switch type {
      case .all:
        typePredicate = nil
      case .bakedGoods:
        typePredicate = #Predicate<Recipe> { $0 is BakedGood }
      case .beverages:
        typePredicate = #Predicate<Recipe> { $0 is Beverage }
      }
    
    // Search predicate (contains in name, instructions, or any ingredient's name or amount)
      let trimmedSearch = searchString.trimmingCharacters(in: .whitespacesAndNewlines)
      let hasSearch = !trimmedSearch.isEmpty
      let searchPredicate: Predicate<Recipe>? = hasSearch ? #Predicate<Recipe> { recipe in
        recipe.name.contains(trimmedSearch) ||
        recipe.instructions.contains(trimmedSearch) ||
        recipe.ingredients.contains { ingredient in
          ingredient.name.contains(trimmedSearch) ||
          ingredient.amount.contains(trimmedSearch)
        }
      } : nil

    // Compose predicates
      switch (typePredicate, searchPredicate) {
      case (nil, nil):
        return nil
      case (let typePredicate?, nil):
        return typePredicate
      case (nil, let searchPredicate?):
        return searchPredicate
      case (let typePredicate?, let searchPredicate?):
        return #Predicate<Recipe> { typePredicate.evaluate($0) && searchPredicate.evaluate($0) }
      }
  }
  
  init(recipeType: RecipeType) {
    _recipeType = State(initialValue: recipeType)
  }
  
  
  var body: some View {
    NavigationStack {
      VStack {
        Picker("Recipe Type", selection: $recipeType) {
          ForEach(RecipeType.allCases) { recipeType in
            Text(recipeType.rawValue)
              .tag(recipeType)
          }
        }
        .pickerStyle(SegmentedPickerStyle())
        RecipeListView(predicate: getPredicate(for: recipeType))
      }
      .navigationTitle("Swift Recipes")
      .searchable(text: $searchString, placement: .automatic, prompt: "Search for a recipe")
      .autocapitalization(.none)
    }
  }
}

struct RecipeListView: View {
  var predicate: Predicate<Recipe>?
  @Query var recipes: [Recipe]
  @Environment(\.modelContext) private var modelContext
  
  init(predicate: Predicate<Recipe>?) {
    self.predicate = predicate
    if predicate != nil {
      _recipes = Query(filter: predicate, sort: \.name, order: .forward)
    }
  }

  var body: some View {
    List {
        ForEach(recipes) { recipe in
          NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
            Text(recipe.name)
          }
        }
        .onDelete(perform: deleteRecipes)
    }
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        EditButton()
      }
      ToolbarItem {
        Button(action: addRecipe) {
          Label("Add Recipe", systemImage: "plus")
        }
      }
    }
  }
  
  private func addRecipe() {
    withAnimation {
      for recipe in Recipe.sampleData {
        modelContext.insert(recipe)
      }
      for recipe in BakedGood.sampleBakedGoodData {
        modelContext.insert(recipe)
      }
      for recipe in Beverage.sampleBeverageData {
        modelContext.insert(recipe)
      }
      
      do {
        try modelContext.save()
      } catch
      {
        print("error saving context")
      }
    }
  }

  private func deleteRecipes(offsets: IndexSet) {
    withAnimation {
      for index in offsets {
        modelContext.delete(recipes[index])
      }
    }
  }
}

//struct ContentView_Previews: PreviewProvider {
//  static var previews: some View {
//    NavigationStack {
//      ContentView(recipeType: .all)
//        .modelContainer(SampleData.shared.modelContainer)
//    }
//  }
//}

