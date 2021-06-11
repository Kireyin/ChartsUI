//
//  PieChartSegmentShape.swift
//  ChartsUI-iOS
//
//  Created by Alexandre Brispot on 05/06/2020.
//

import SwiftUI

struct PieChartSegmentShape: Shape {
	var startAngle: Angle
	var endAngle: Angle
	let innerRadius: CGFloat
	var offset: CGFloat
	
	var animatableData: AnimatablePair<CGFloat, AnimatablePair<Double, Double>> {
		get {
			AnimatablePair(offset, AnimatablePair(startAngle.degrees, endAngle.degrees))
		}
		set {
			offset = newValue.first
			startAngle = .degrees(newValue.second.first)
			endAngle = .degrees(newValue.second.second)
		}
	}
	
	init(startAngle: Angle, endAngle: Angle, innerRadius: CGFloat = 0.0, offset: CGFloat = 0) {
		self.startAngle = startAngle
		self.endAngle = endAngle
		self.innerRadius = innerRadius
		self.offset = offset
	}
	
	func path(in rect: CGRect) -> Path {
		let center = CGPoint(x: rect.midX, y: rect.midY)
		let radius: CGFloat = (min(rect.width, rect.height) + offset) / 2
		var path = Path()
		path.addArc(center: center,
					radius: radius,
					startAngle: startAngle,
					endAngle: endAngle,
					clockwise: false)
		path.addArc(center: center,
					radius: innerRadius,
					startAngle: endAngle,
					endAngle: startAngle,
					clockwise: true)
		path.closeSubpath()
		return path
	}
}

struct PieChartSegmentShape_Previews: PreviewProvider {
    static var previews: some View {
		PieChartSegmentShape(startAngle: Angle.degrees(300),
							 endAngle: Angle.degrees(360),
							 innerRadius: 120)
			.stroke()
			.padding()
    }
}
