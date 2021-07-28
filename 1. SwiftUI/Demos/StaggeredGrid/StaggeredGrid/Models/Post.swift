//
//  Post.swift
//  Post
//
//  Created by Xianmo on 16/07/2021.
//
// From Kavsoft https://youtu.be/VrwINubmq5g

import SwiftUI

struct Post: Identifiable, Hashable {
    var id = UUID().uuidString
    var imageURL: String
    
}
