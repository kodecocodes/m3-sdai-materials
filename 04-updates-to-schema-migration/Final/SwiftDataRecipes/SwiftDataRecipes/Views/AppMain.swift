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

enum RecipesSchemaV1: VersionedSchema {
  static var versionIdentifier: Schema.Version { Schema.Version(1, 0, 0) }
  static var models: [any PersistentModel.Type] {
    [Recipe.self]
  }
}

@available(iOS 26, *)
enum RecipesSchemaV2: VersionedSchema {
  static var versionIdentifier: Schema.Version { Schema.Version(2, 0, 0) }

  static var models: [any PersistentModel.Type] {
    [
      Recipe.self,
      BakedGood.self,
      Beverage.self
    ]
  }
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
  //  let container: ModelContainer = {
  //    var container2: ModelContainer
  //    do {
  //      let schema = Schema(versionedSchema: RecipesSchemaV2.self)
  //      let container2 = try ModelContainer(
  //        for: schema, migrationPlan: RecipesMigrationPlan.self)
  //      return container2
  //    } catch {
  //      fatalError("Could not create ModelContainer: \(error)")
  //    }
  //  }()

  var body: some Scene {
    WindowGroup {
      ContentView(recipeType: .all)
        .modelContainer(for: [Recipe.self, Beverage.self, BakedGood.self]) // non migration container
      // .modelContainer(container)  // for migration
    }
  }
}
