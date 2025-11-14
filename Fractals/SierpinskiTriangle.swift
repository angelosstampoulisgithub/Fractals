//
//  SierpinskiTriangle.swift
//  Fractals
//
//  Created by Angelos Staboulis on 14/11/25.
//

import Foundation
import SwiftUI

struct SierpinskiTriangle: Shape {
    var depth: Int

    func path(in rect: CGRect) -> Path {
        var path = Path()

        func addTriangle(_ p1: CGPoint, _ p2: CGPoint, _ p3: CGPoint, _ level: Int) {
            if level == 0 {
                path.move(to: p1)
                path.addLine(to: p2)
                path.addLine(to: p3)
                path.addLine(to: p1)
            } else {
                let mid12 = CGPoint(x: (p1.x + p2.x)/2, y: (p1.y + p2.y)/2)
                let mid23 = CGPoint(x: (p2.x + p3.x)/2, y: (p2.y + p3.y)/2)
                let mid31 = CGPoint(x: (p3.x + p1.x)/2, y: (p3.y + p1.y)/2)

                addTriangle(p1, mid12, mid31, level - 1)
                addTriangle(mid12, p2, mid23, level - 1)
                addTriangle(mid31, mid23, p3, level - 1)
            }
        }

        let p1 = CGPoint(x: rect.midX, y: rect.minY)
        let p2 = CGPoint(x: rect.minX, y: rect.maxY)
        let p3 = CGPoint(x: rect.maxX, y: rect.maxY)

        addTriangle(p1, p2, p3, depth)
        return path
    }
}
