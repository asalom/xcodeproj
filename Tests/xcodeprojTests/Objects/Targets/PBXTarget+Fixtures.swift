import Foundation

@testable import xcodeproj

extension PBXTarget {
    static func fixture(name: String = "Test",
                        buildConfigurationList: XCConfigurationList = XCConfigurationList.fixture(),
                        buildPhases: [PBXBuildPhase] = [],
                        buildRules: [PBXBuildRule] = [],
                        dependencies: [PBXTargetDependency] = [],
                        productName: String? = "Test",
                        product: PBXFileReference = PBXFileReference.fixture(name: "Test.app"),
                        productType: PBXProductType = PBXProductType.application) -> PBXTarget {
        return PBXTarget(name: name,
                         buildConfigurationList: buildConfigurationList,
                         buildPhases: buildPhases,
                         buildRules: buildRules,
                         dependencies: dependencies,
                         productName: productName,
                         product: product,
                         productType: productType)
    }
}
