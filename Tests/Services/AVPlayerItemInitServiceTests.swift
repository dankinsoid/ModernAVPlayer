// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphrel@gmail.com>
//
// AVPlayerItemInitServiceTests.swift
// Created by raphael ankierman on 18/11/2019.
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

import AVFoundation
@testable
import ModernAVPlayer
import SwiftyMocky
import XCTest

final class AVPlayerItemInitServiceTests: XCTestCase {

    private var service: AVPlayerItemInitService!

    override func setUp() {
        service = ModernAVPlayerItemInitService()
    }

    func testURLInputSource() {
        // ARRANGE
        let url = URL(string: "https://en.wikipedia.org/wiki/Feminism")!
        let media = PlayerMediaMock()
        Given(media, .url(getter: url))

        // ACT
        let item = service.getItem(media: media, loadedAssetKeys: [], failedUsedItem: [])

        // ASSERT
        let itemURL = (item.asset as? AVURLAsset)?.url
        XCTAssertEqual(itemURL, url)
    }

    func testAVPlayerItemInputSource() {
        // ARRANGE
        let url = URL(string: "https://en.wikipedia.org/wiki/Feminism")!
        let source = AVPlayerItem(url: url)
        let media = PlayerMediaItemMock()
        Given(media, .item(getter: source))
        Given(media, .url(getter: url))

        // ACT
        let item = service.getItem(media: media, loadedAssetKeys: [], failedUsedItem: [])

        // ASSERT
        XCTAssert(source === item)
    }

    func testFailedAVPlayerItemInputSource() {
        // ARRANGE
        let url = URL(string: "https://en.wikipedia.org/wiki/Feminism")!
        let source = AVPlayerItem(url: url)
        let media = PlayerMediaItemMock()
        Given(media, .item(getter: source))
        Given(media, .url(getter: url))

        // ACT
        let item = service.getItem(media: media, loadedAssetKeys: [], failedUsedItem: [source])

        // ASSERT
        XCTAssert(source !== item)
    }

    func testURLFailedAVPlayerItemInputSource() {
        // ARRANGE
        let url = URL(string: "https://en.wikipedia.org/wiki/Feminism")!
        let source = AVPlayerItem(url: url)
        let media = PlayerMediaItemMock()
        Given(media, .item(getter: source))
        Given(media, .url(getter: url))

        // ACT
        let item = service.getItem(media: media, loadedAssetKeys: [], failedUsedItem: [source])

        // ASSERT
        let itemURL = (item.asset as? AVURLAsset)?.url
        XCTAssertEqual(itemURL, url)
    }
}
