//
//  Post.swift
//  SyncedCarouselList
//
//  Created by Xianmo on 21/10/2021.
//
//
// Demo by Kavsoft https://youtu.be/8MrJwlvfGHQ

import SwiftUI

// Post Model
struct Post: Identifiable, Hashable {
    var id = UUID().uuidString
    var postImage: String
}


