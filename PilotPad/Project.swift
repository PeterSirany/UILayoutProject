import ProjectDescription
import ProjectDescriptionHelpers

/*
                +-------------+
                |             |
                |     App     | Contains PilotPad App target and PilotPad unit-test target
                |             |
         +------+-------------+-------+
         |         depends on         |
         |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+

 */

// MARK: - Project

// Creates our project using a helper function defined in ProjectDescriptionHelpers
//let project = Project.app(name: "PilotPad",
//                          platform: .iOS,
//                          additionalTargets: ["PilotPadKit", "PilotPadUI"])

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
  sources: .paths(["Targets/ViewModels/**"]),
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
  sources: .paths(["Targets/Sources/**"]),
  dependencies: [.target(name: "Common"), .target(name: "ViewModels"), .target(name: "Models"), .target(name: "Views")]
)

let project = Project(
  name: "PilotPad",
  organizationName: "Peter.Sirany",
  options: .options(
    automaticSchemesOptions: .disabled,
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
