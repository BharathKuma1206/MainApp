//
//  MainAppOneTests.swift
//  MainAppOneTests
//
//  Created by APPLE on 18/01/24.
//

import XCTest
@testable import MainAppOne
@testable import IPInfoPackage

class MainAppOneTests: XCTestCase {

    func testFetchIp() {
        let expectation = XCTestExpectation(description: "Fetching IP")

        let viewModel = IPViewModel()
        viewModel.$ipInfo
            .dropFirst() // Skip initial value
            .sink { _ in
                expectation.fulfill()
            }
            .store(in: &viewModel.cancellables)

        viewModel.fetchIP()

        wait(for: [expectation], timeout: 5.0)

        XCTAssertNotNil(viewModel.ipInfo)
        XCTAssertNil(viewModel.error)
    }

}
