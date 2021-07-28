//
//  CustomCorner.swift
//  CustomCorner
//
//  Created by シェイミ on 27/07/2021.
//
// From Kavsoft https://youtu.be/hmifqxD7seI

import SwiftUI

struct CustomCorner: Shape {
    
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}
