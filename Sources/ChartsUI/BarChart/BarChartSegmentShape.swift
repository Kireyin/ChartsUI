//
//  BarChartSegmentShape.swift
//  
//
//  Created by Alexandre on 11/06/2021.
//

import SwiftUI

struct BarChartSegmentShape: Shape {
    var height: CGFloat
    var width: CGFloat = 28
    var cornerRadius: CGFloat = 6
    
    var animatableData: CGFloat {
        get {
            height
        }
        set {
            height = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.width / 2 - width / 2,
                              y: rect.height))
        path.addLine(to: CGPoint(x: rect.width / 2 + width / 2,
                                 y: rect.height))
        path.addLine(to: CGPoint(x: rect.width / 2 + width / 2,
                                 y: rect.height - height + cornerRadius))
        
        path.addArc(center: CGPoint(x: rect.width / 2 + width / 2 - cornerRadius,
                                    y: rect.height - height + cornerRadius),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: -90),
                    clockwise: true)
        path.addLine(to: CGPoint(x: rect.width / 2 - width / 2 + cornerRadius,
                                 y: rect.height - height))
        path.addArc(center: CGPoint(x: rect.width / 2 - width / 2 + cornerRadius,
                                    y: rect.height - height + cornerRadius),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: -90),
                    endAngle: Angle(degrees: 180),
                    clockwise: true)
        path.closeSubpath()
        return path
    }
}

struct BarChartSegmentShape_Previews: PreviewProvider {
    static var previews: some View {
        BarChartSegmentShape(height: 120)
            .stroke()
            .padding()
    }
}
