import XCTest
@testable import StringMetric

class StringMetricTests: XCTestCase {
    func testLevenshteinDistance() {
        XCTAssertEqual("".LevenshteinDistance(between: "sitting"), 7)
        XCTAssertEqual("kitten".LevenshteinDistance(between: ""), 6)
        XCTAssertEqual("kitten".LevenshteinDistance(between: "sitting"), 3)

        XCTAssertEqual("君子和而不同".LevenshteinDistance(between: "小人同而不和"), 4)
    }

    func testDamerauLevenshteinDistance() {
        XCTAssertEqual("".DamerauLevenshteinDistance(between: "sitting"), 7)
        XCTAssertEqual("kitten".DamerauLevenshteinDistance(between: ""), 6)
        XCTAssertEqual("kitten".DamerauLevenshteinDistance(between: "sitting"), 3)

        XCTAssertEqual("CA".DamerauLevenshteinDistance(between: "AC"), 1)
        XCTAssertEqual("specter".DamerauLevenshteinDistance(between: "spectre"), 1)
        XCTAssertEqual("CA".DamerauLevenshteinDistance(between: "ABC"), 2)

        XCTAssertEqual("君子和而不同".DamerauLevenshteinDistance(between: "小人同而不和"), 4)
    }

    func testHammingDistance() {
        let isError = false
        do {
            try _ = "".HammingDistance("YO")
        } catch ArgumentError.Error(let _) {
            isError = true
        }
        XCTAssertEqual(isError, true)

        XCTAssertEqual("korolin".HammingDistance(between: "kathrin"), 3)
        XCTAssertEqual("karolin".HammingDistance(between: "kerstin"), 3)
        XCTAssertEqual("1011101".HammingDistance(between: "1001001"), 2)
        XCTAssertEqual("2173896".HammingDistance(between: "2233796"), 3)
    }

    static let allTests = [
        ("testLevenshteinDistance", testLevenshteinDistance),
        ("testDamerauLevenshteinDistance", testDamerauLevenshteinDistance),
    ]
}
