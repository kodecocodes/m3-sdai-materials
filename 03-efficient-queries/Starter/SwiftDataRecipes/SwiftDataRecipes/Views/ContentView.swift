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

enum RecipeType: String, CaseIterable, Identifiable {
  case all = "All"
  case bakedGoods = "Baked Goods"
  case beverages = "Beverages"

  var id: String { self.rawValue }
}


struct ContentView: View {

  @State private var recipeType: RecipeType = .all
  var body: some View {

    VStack {
      Picker("Recipe Type", selection: $recipeType) {
        ForEach(RecipeType.allCases) { recipeType in
          Text(recipeType.rawValue)
            .tag(recipeType)
        }
      }
      .pickerStyle(SegmentedPickerStyle())
      RecipeListView(recipeType: $recipeType)
    }
    .navigationTitle("Swift Recipes")      
  }
}

struct RecipeListView: View {
  @Binding var recipeType: RecipeType
  @Query var recipes: [Recipe]
  @Query var beverages: [Beverage]
  @Query var bakedGoods: [BakedGood]
  @Environment(\.modelContext) private var modelContext

  var body: some View {
    List {
      switch recipeType {
        case .all:
          ForEach(recipes) { recipe in
            NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
              Text(recipe.name)
            }
          }
          .onDelete(perform: deleteRecipes)
        case .bakedGoods:
          ForEach(bakedGoods) { recipe in
            NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
              Text(recipe.name)
            }
          }
          .onDelete(perform: deleteRecipes)
        case .beverages:
          ForEach(beverages) { recipe in
            NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
              Text(recipe.name)
            }
          }
          .onDelete(perform: deleteRecipes)
      }
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
      let newRecipe = Recipe(name: "New Recipe")
        modelContext.insert(newRecipe)
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

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      ContentView()
        .modelContainer(SampleData.shared.modelContainer)  
    }
  }
}

