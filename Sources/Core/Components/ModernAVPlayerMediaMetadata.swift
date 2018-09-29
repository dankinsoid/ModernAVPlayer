// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphrel@gmail.com>
//
// ModernAVPlayerMediaMetadata.swift
// Created by raphael ankierman on 31/08/2018.
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

public struct ModernAVPlayerMediaMetadata: PlayerMediaMetadata, Equatable {
    public let title: String?
    public let albumTitle: String?
    public let artist: String?
    public let localPlaceHolderImageName: String?
    public let remoteImageUrl: URL?
    
    public init(title: String? = nil,
                albumTitle: String? = nil,
                artist: String? = nil,
                localImageName: String? = nil,
                remoteImageUrl: URL? = nil) {
        self.title = title
        self.albumTitle = albumTitle
        self.artist = artist
        self.localPlaceHolderImageName = localImageName
        self.remoteImageUrl = remoteImageUrl
    }
}

public func == (lhs: ModernAVPlayerMediaMetadata, rhs: ModernAVPlayerMediaMetadata) -> Bool {
    return lhs.title == rhs.title &&
        lhs.albumTitle == rhs.albumTitle &&
        lhs.artist == rhs.artist &&
        lhs.localPlaceHolderImageName == rhs.localPlaceHolderImageName &&
        lhs.remoteImageUrl == rhs.remoteImageUrl
}
