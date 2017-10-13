import Foundation
import XCTest
import xcproj

final class PBXContainerItemProxySpec: XCTestCase {

    var subject: PBXContainerItemProxy!

    override func setUp() {
        super.setUp()
        subject = PBXContainerItemProxy(reference: "reference", containerPortal: "container", remoteGlobalIDString: "remote", remoteInfo: "remote_info")
    }

    func test_itHasTheCorrectIsa() {
        XCTAssertEqual(PBXContainerItemProxy.isa, "PBXContainerItemProxy")
    }

    func test_init_shouldReturnTheCorrectEntity_ifAllTheParametersAreCorrect() {
        XCTAssertEqual(subject.reference, "reference")
        XCTAssertEqual(subject.containerPortal, "container")
        XCTAssertEqual(subject.remoteGlobalIDString, "remote")
        XCTAssertEqual(subject.remoteInfo, "remote_info")
    }

    func test_init_shouldFail_ifContainerPortalIsMissing() {
        var dictionary = testDictionary()
        dictionary.removeValue(forKey: "containerPortal")
        let data = try! JSONSerialization.data(withJSONObject: dictionary, options: [])
        let decoder = JSONDecoder()
        do {
            _ = try decoder.decode(PBXContainerItemProxy.self, from: data)
            XCTAssertTrue(false, "Expected to throw an error but it didn't")
        } catch {}
    }

    func test_equal_shouldReturnTheCorrectValue() {
        let one = PBXContainerItemProxy(reference: "reference", containerPortal: "portal", remoteGlobalIDString: "globalid", remoteInfo: "info")
        let another = PBXContainerItemProxy(reference: "reference", containerPortal: "portal", remoteGlobalIDString: "globalid", remoteInfo: "info")
        XCTAssertEqual(one, another)
    }

    func test_hash_returnsTheRightValue() {
        XCTAssertEqual(subject.hashValue, subject.reference.hashValue)
    }

    private func testDictionary() -> [String: Any] {
        return [
            "containerPortal": "containerPortal",
            "remoteGlobalIDString": "remoteGlobalIDString",
            "remoteInfo": "remoteInfo",
            "reference": "reference"
        ]
    }

}
