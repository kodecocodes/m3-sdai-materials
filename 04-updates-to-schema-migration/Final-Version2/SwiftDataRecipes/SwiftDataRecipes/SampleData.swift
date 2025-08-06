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
import Playgrounds

@MainActor
class SampleData {
  static let shared = SampleData()
  let modelContainer: ModelContainer

  var context: ModelContext {
    modelContainer.mainContext
  }

  private init() {
    let schema = Schema([
      Recipe.self, Ingredient.self, Cookbook.self, BakedGood.self, Beverage.self
    ])
    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

    do {
      modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])

      insertSampleData()
      try context.save()
    } catch {
      fatalError("Could not create ModelContainer: \(error)")
    }
  }

  private func insertSampleData() {
    for recipe in Recipe.sampleData {
      context.insert(recipe)
    }
    
    for bakedGood in BakedGood.sampleBakedGoodData {
      context.insert(bakedGood)
    }
    
    for beverage in Beverage.sampleBeverageData {
      context.insert(beverage)
    }
  }
}

#Playground {
  // Widget code to get next recipe to prepare

  @MainActor
  func getUpcomingRecipes() -> [Recipe] {
    let now = Date()
    var fetchDesc = FetchDescriptor(sortBy: [SortDescriptor(\Recipe.plannedDate, order: .forward)])
    // Use a constant for 'now' outside the predicate; only literal values are allowed inside #Predicate
    fetchDesc.predicate = #Predicate { ($0.plannedDate /*?? now*/) > now }
    
    fetchDesc.fetchLimit = 1
    
    let modelContext = ModelContext(SampleData.shared.modelContainer)
    if let upcomingRecipes: [Recipe] = try? modelContext.fetch (fetchDesc) {
      if let recipe = upcomingRecipes.first {
        return [recipe]
      }
    }
    return []
  }
  
  let nextRecipe = getUpcomingRecipes()[0]
  print("next recipe to make is \(nextRecipe.name) \(String(describing: nextRecipe.plannedDate))")
}
