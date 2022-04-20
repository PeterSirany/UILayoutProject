import ProjectDescription
import ProjectDescriptionHelpers

let infoPlist: [String: InfoPlist.Value] = [
    "CFBundleShortVersionString": "1.0",
    "CFBundleVersion": "1",
    "UIMainStoryboardFile": "",
    ]

let common = Target(
  name: "Common",
  platform: .iOS,
  product: .framework,
  bundleId: "com.petersirany.pilotpad.common",
  infoPlist: .default,
  sources: .paths(["Targets/Common/**"])
)

let models = Target(
  name: "Models",
  platform: .iOS,
  product: .framework,
  bundleId: "com.petersirany.pilotpad.models",
  infoPlist: .default,
  sources: .paths(["Targets/Models/**"]),
  dependencies: [.target(name: "Common")]
)

let viewModels = Target(
  name: "ViewModels",
  platform: .iOS,
  product: .framework,
  bundleId: "com.petersirany.pilotpad.viewmodels",
  infoPlist: .default,
  sources: .paths(["Targets/ViewModels/Sources/**"]),
  dependencies: [.target(name: "Common"), .target(name: "Models")]
)

let views = Target(
  name: "Views",
  platform: .iOS,
  product: .framework,
  bundleId: "com.petersirany.pilotpad.views",
  sources: .paths(["Targets/Views/**"]),
  dependencies: [.target(name: "Common"), .target(name: "Models"), .target(name: "ViewModels")]
)

let mainAppTarget = Target(
  name: "PilotPad",
  platform: .iOS,
  product: .app,
  bundleId: "com.petersirany.pilotpad",
  infoPlist: .extendingDefault(with: infoPlist),
  sources: .paths(["Targets/PilotPad/Sources/**"]),
  resources: [
    "Targets/PilotPad/Resources/**"
  ],
  dependencies: [.target(name: "Common"), .target(name: "ViewModels"), .target(name: "Models"), .target(name: "Views")],
  coreDataModels: [
    CoreDataModel("Targets/PilotPad/CoreData/Model.xcdatamodeld"),
    CoreDataModel("Targets/PilotPad/CoreData/Main.xcdatamodeld")
  ]
)

let project = Project(
  name: "PilotPad",
  organizationName: "Peter.Sirany",
  options: .options(
    automaticSchemesOptions: .enabled(
      targetSchemesGrouping: .singleScheme,
      codeCoverageEnabled: false,
      testingOptions: .parallelizable
    ),
    developmentRegion: nil,
    disableBundleAccessors: false,
    disableShowEnvironmentVarsInScriptPhases: false,
    disableSynthesizedResourceAccessors: false,
    textSettings: .textSettings(
      usesTabs: true,
      indentWidth: 2,
      tabWidth: 2,
      wrapsLines: true
    ),
    xcodeProjectName: nil
  ),
  targets: [common, models, views, viewModels, mainAppTarget]
)
