//
//  File.swift
//  
//
//  Created by AbdelAli J. on 1/6/2022.
//

@testable import Unboxing
import XCTest

class AnyDecodableTests: XCTestCase {
    func testJSONDecoding() throws {
        let json = """
            {"type": "soda", "sugar_content": 5, "alcoholic_drink": false, "description": null}
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        let dictionary = try decoder.decode([String: AnyDecodable].self, from: json)

        XCTAssertEqual(dictionary["type"]?.value as! String, "soda")
        XCTAssertEqual(dictionary["sugar_content"]?.value as! Int, 5)
        XCTAssertEqual(dictionary["alcoholic_drink"]?.value as! Bool, false)
        XCTAssertEqual(dictionary["description"]?.value as! NSNull, NSNull())
    }
}
