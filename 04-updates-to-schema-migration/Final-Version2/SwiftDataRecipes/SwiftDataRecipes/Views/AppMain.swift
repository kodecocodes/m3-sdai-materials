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

@Model
class User
{
  var name: String
  
  init(name: String) {
    self.name = name
  }
}

enum RecipesSchemaV1: VersionedSchema {
  static var versionIdentifier: Schema.Version { Schema.Version(1, 0, 0) }
  static var models: [any PersistentModel.Type] {
    [Recipe.self, Ingredient.self]
  }
  
//  @Model
//  class Recipe: Hashable {
//    @Attribute(.unique)
//    var name: String
//    var summary: String = ""
//    var instructions: String = ""
//
//    @Relationship(deleteRule: .cascade)
//    var ingredients: [Ingredient] = []
//
//    init(name: String, summary: String = "", instructions: String = "", ingredients: [Ingredient] = []) {
//      self.name = name
//      self.summary = summary
//      self.instructions = instructions
//      self.ingredients = ingredients
//    }
//  }
}

@available(iOS 26, *)
enum RecipesSchemaV2: VersionedSchema {
  static var versionIdentifier: Schema.Version { Schema.Version(2, 0, 0) }

  static var models: [any PersistentModel.Type] {
    [
//      Recipe.self,
      Ingredient.self,
      User.self,
      BakedGood.self,
      Beverage.self
    ]
  }
  
//  @Model
//  class Recipe: Hashable {
//    @Attribute(.unique)
//    var name: String
//    var summary: String = ""
//    var instructions: String = ""
//    var plannedDate: Date
//
//    @Relationship(deleteRule: .cascade)
//    var ingredients: [Ingredient] = []
//
//    init(name: String, summary: String = "", instructions: String = "", ingredients: [Ingredient] = [], plannedDate: Date = Date()) {
//      self.name = name
//      self.summary = summary
//      self.instructions = instructions
//      self.ingredients = ingredients
//      self.plannedDate = plannedDate
//    }
//  }
}

enum RecipesMigrationPlan: SchemaMigrationPlan {
  static var schemas: [any VersionedSchema.Type] {
    var currentSchemas: [any VersionedSchema.Type] =
    [RecipesSchemaV1.self]
    if #available(iOS 26, *) {
      currentSchemas.append(RecipesSchemaV2.self)
    }
    return currentSchemas
  }

//  @available(iOS 26, *)
//  static let migrateV1toV2 = MigrationStage.custom(
//      fromVersion: RecipesSchemaV1.self,
//      toVersion: RecipesSchemaV2.self,
//      willMigrate: { context in
//          print("resolving conflicts...\(context)")
//      }, didMigrate: {context in
//        print("migration complete")
//      }
//  )
  
  @available(iOS 26, *)
  static let migrateV1toV2 = MigrationStage.lightweight(
    fromVersion: RecipesSchemaV1.self,
    toVersion: RecipesSchemaV2.self
  )

  static var stages: [MigrationStage] {
    var currentStages: [MigrationStage] = []
    if #available(iOS 26, *) {
      currentStages.append(migrateV1toV2)
    }
    return currentStages
  }
}

@main
struct AppMain: App {
  
  let modelContainer: ModelContainer = {
    var container: ModelContainer
    do {
//      let schema = Schema(versionedSchema: RecipesSchemaV1.self)
//      let container = try ModelContainer(for: schema)
      let schema = Schema(versionedSchema: RecipesSchemaV2.self)
      let container = try ModelContainer(
        for: schema, migrationPlan: RecipesMigrationPlan.self)
      return container
    } catch {
      fatalError("Could not create ModelContainer: \(error)")
    }
  }()

  var body: some Scene {
    WindowGroup {
      ContentView(recipeType: .all)
//        .modelContainer(for: [Recipe.self, Ingredient.self, Beverage.self/*, BakedGood.self*/])
        .modelContainer(modelContainer)
    }
  }
}

