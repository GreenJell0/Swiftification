//
// Copyright (c) 2016 Hilton Campbell
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

import XCTest
import Swiftification

class StringTests: XCTestCase {
    
    func testLength() {
        let string = "123456789"
        XCTAssertTrue(string.length == 9)
    }
    
    func testTrimmed() {
        let string = "\n       Test        "
        XCTAssertEqual(string.trimmed(), "Test")
    }
    
    func testRandomZeroLength() {
        for _ in 0...500 {
            XCTAssertTrue(String.random(0) == "")
        }
    }

    func testRandomDefaultLength() {
        for _ in 0...500 {
            let random = String.random()
            XCTAssertTrue(random.length >= 8)
            XCTAssertTrue(random.length <= 64)
        }
    }
    
    func testRandomLength() {
        for i in 0...500 {
            XCTAssertTrue(String.random(i).length == i)
        }
    }

    func testRandomZeroCharacters() {
        for _ in 0...500 {
            XCTAssertTrue(String.random(characters: "") == "")
        }
    }
    
    func testRandomDefaultCharacters() {
        let characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz012345789"
        let random = String.random(500)
        for i in 0..<random.length {
            let index = random.characters.index(random.startIndex, offsetBy: i)
            let character = random.substring(with: index..<random.characters.index(index, offsetBy: 1))
            XCTAssertNotNil(characters.range(of: character))
        }
    }
    
    func testRandomCharacters() {
        let characters = "ABCDE"
        let random = String.random(500, characters: characters)
        for i in 0..<random.length {
            let index = random.characters.index(random.startIndex, offsetBy: i)
            let character = random.substring(with: index..<random.characters.index(index, offsetBy: 1))
            XCTAssertNotNil(characters.range(of: character))
        }
    }
    
    func testSafeSubscript() {
        let str = "Hi"
        XCTAssertEqual(str[str.characters.index(str.startIndex, offsetBy: 1)], str[safe: str.characters.index(str.startIndex, offsetBy: 1)]!)
    }
    
    func testAppendAndPrependOptionalString() {
        let str1: String? = "Hi"
        let str2: String? = " Bob "
        let strNil: String? = nil
        let nonNilString = "I'm not Nil!"
        XCTAssertEqual(str1 + str2, "Hi Bob ")
        XCTAssertEqual(str2 + str1, " Bob Hi")
        XCTAssertEqual(str1 + strNil, "Hi")
        XCTAssertEqual(strNil + str1, "Hi")
        XCTAssertEqual(nonNilString + str1, "I'm not Nil!Hi")
        XCTAssertEqual(str1 + nonNilString, "HiI'm not Nil!")
        XCTAssertEqual(strNil + nonNilString, "I'm not Nil!")
        XCTAssertEqual(nonNilString + strNil, "I'm not Nil!")
    }
    
    func testInsertAtIndex() {
        XCTAssertEqual("string".insert("TEST", at: 0), "TESTstring")
        XCTAssertEqual("string".insert("TEST", at: 3), "strTESTing")
        XCTAssertEqual("string".insert("TEST", at: 100), "stringTEST")
    }
    
}
