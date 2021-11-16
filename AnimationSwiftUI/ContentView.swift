//
//  ContentView.swift
//  AnimationSwiftUI
//
//  Created by Александр on 15.11.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geomenry in
            topPath
            bottomPath
        }
    }
}

private var topPath: some View {
    GeometryReader { geometry in
        let width = geometry.size.width
        let height = geometry.size.height
        let size = min(width, height)
        let thirdPath = size / 3
        let popularSize = size / 10
        let middle = size / 2
        let smallSize = thirdPath * 1.6
        
        Path { path in
            path.move(to: CGPoint(x: middle, y: thirdPath * 2.5))
            path.addLine(to: CGPoint(x: middle, y: thirdPath * 1.6))
            path.addQuadCurve(
                to: CGPoint(x: thirdPath * 1.1, y: thirdPath * 2),
                control: CGPoint(x: thirdPath * 1.2, y: smallSize)
            )
            path.addLine(to: CGPoint(x: middle, y: size - thirdPath))
        }
        .stroke(Color.black, lineWidth: 3)
        
        Path { path in
            path.move(to: CGPoint(x: smallSize, y: smallSize))
            path.addLine(to: CGPoint(x: smallSize, y: size - thirdPath))
            path.addLine(to: CGPoint(x: thirdPath * 2.3, y: size - thirdPath))
            path.addQuadCurve(
                to: CGPoint(x: smallSize, y: smallSize),
                control: CGPoint(x: thirdPath * 2.3, y: smallSize)
            )
        }
        .stroke(Color.black, lineWidth: 3)
        
        Path { path in
            path.move(to: CGPoint(x: thirdPath * 1.4, y: thirdPath * 2.2))
            path.addLine(to: CGPoint(x: thirdPath + popularSize, y: thirdPath * 2.2))
            path.addQuadCurve(
                to: CGPoint(x: thirdPath + popularSize, y: thirdPath * 2.1),
                control: CGPoint(x: popularSize * 4, y: thirdPath * 2.15)
            )
            path.addLine(to: CGPoint(x: thirdPath * 1.4, y: thirdPath * 2.1))
            path.addQuadCurve(
                to: CGPoint(x: thirdPath * 1.4, y: thirdPath * 2.2),
                control: CGPoint(x: middle, y: thirdPath * 2.15)
            )
        }
        .stroke(Color.black, lineWidth: 3)
        
        Path { path in
            path.move(to: CGPoint(x: popularSize, y: thirdPath * 2.5))
            path.addQuadCurve(
                to: CGPoint(x: popularSize, y: thirdPath * 2.3),
                control: CGPoint(x: popularSize / 2, y: thirdPath * 2.4)
            )
            path.addLine(to: CGPoint(x: popularSize, y: thirdPath * 2.5))
            path.addQuadCurve(
                to: CGPoint(x: thirdPath * 0.7, y: size - thirdPath),
                control: CGPoint(x: popularSize, y: size - thirdPath)
            )
            path.addQuadCurve(
                to: CGPoint(x: thirdPath * 1.2, y: smallSize),
                control: CGPoint(x: thirdPath, y: size - thirdPath)
            )
            path.addQuadCurve(
                to: CGPoint(x: middle, y: thirdPath * 1.4),
                control: CGPoint(x: thirdPath * 1.3, y: thirdPath * 1.4)
            )
            path.addQuadCurve(
                to: CGPoint(x: size - popularSize, y: thirdPath * 2.5),
                control: CGPoint(x: size - popularSize, y: thirdPath * 1.3)
            )
            path.addQuadCurve(
                to: CGPoint(x: size - popularSize, y: size - popularSize),
                control: CGPoint(x: thirdPath * 2.85, y: thirdPath + smallSize)
            )
        }
        .stroke(Color.black, lineWidth: 3)
    }
}

private var bottomPath: some View {
    GeometryReader { geometry in
        let width = geometry.size.width
        let height = geometry.size.height
        let size = min(width, height)
        let thirdPath = size / 3
        let minStep = size / 60
        let popularSize = size / 10
        let smallSize = thirdPath * 1.6
        
        Path { path in
            path.move(to: CGPoint(x: size - popularSize, y: size - popularSize))
            path.addLine(to: CGPoint(x: popularSize, y: size - popularSize))
            path.addQuadCurve(
                to: CGPoint(x: popularSize, y: thirdPath * 2.5),
                control: CGPoint(x: 3 * minStep, y: thirdPath + smallSize)
            )
            path.addLine(to: CGPoint(x: size - popularSize, y: thirdPath * 2.5))
        }
        .stroke(Color.black, lineWidth: 3)
        
        Path { path in
            path.addArc(
                center: CGPoint(x: popularSize * 3, y: thirdPath + smallSize),
                radius: popularSize,
                startAngle: .degrees(0),
                endAngle: .degrees(360),
                clockwise: true)
        }
        .stroke(Color.black, lineWidth: 3)
        
        Path { path in
            path.addArc(
                center: CGPoint(x: popularSize * 3, y: thirdPath + smallSize),
                radius: minStep * 4,
                startAngle: .degrees(0),
                endAngle: .degrees(360),
                clockwise: true)
        }
        
        Path { path in
            path.addArc(
                center: CGPoint(x: thirdPath * 2.1, y: thirdPath + smallSize),
                radius: minStep * 4,
                startAngle: .degrees(0),
                endAngle: .degrees(360),
                clockwise: true)
        }
        
        Path { path in
            path.addArc(
                center: CGPoint(x: popularSize * 7 , y: thirdPath + smallSize),
                radius: popularSize,
                startAngle: .degrees(0),
                endAngle: .degrees(360),
                clockwise: true)
        }
        .stroke(Color.black, lineWidth: 3)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(width: 300, height: 300)
    }
}
