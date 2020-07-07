//
//  PieChartShape.swift
//  ChartsUI-iOS
//
//  Created by Alexandre Brispot on 05/06/2020.
//

import SwiftUI

/**
Represent a Segment, or Portion, of the PieChart
- parameter value: The value, or size, of the segment.
- parameter color: The colour used to fill the segment.
*/
public struct PieChartDataPoint: Identifiable, Equatable {
	public let id: UUID = UUID()
	let value: Double
	let color: Color
	let label: String? = nil
	
	public init(value: Double, color: Color = .red) {
		self.value = value
		self.color = color
	}
}

public class PieChartDataSet: ObservableObject {
	let dataPoints: [PieChartDataPoint]
	
	public init(dataPoints: [PieChartDataPoint]) {
		self.dataPoints = dataPoints
	}
	
	var totalValue: Double {
		dataPoints.map({$0.value}).reduce(0, +)
	}
	
	func percentage(for dataPoint: PieChartDataPoint) -> Double {
		dataPoint.value / totalValue * 100
	}
	
	func angle(for dataPoint: PieChartDataPoint) -> Angle {
		.degrees(percentage(for: dataPoint) / 100 * 360)
	}
	
	func startAngle(for dataPoint: PieChartDataPoint) -> Angle {
		var startAngle: Angle = .degrees(0)
		
		for point in dataPoints {
			if dataPoint.id == point.id {
				return startAngle
			}
			startAngle += angle(for: point)
		}
		return .degrees(0)
	}
	
	func endAngle(for dataPoint: PieChartDataPoint) -> Angle {
		startAngle(for: dataPoint) + angle(for: dataPoint)
	}
}

public struct PieChartView: View {
	private let dataSet: PieChartDataSet
	
	@State private var selectedDataPoint: PieChartDataPoint? = nil
	@State private var animationProgress: Double = 0
	
	public init(dataSet: PieChartDataSet) {
		self.dataSet = dataSet
	} 
	
	public var body: some View {
		ZStack {
			ForEach(dataSet.dataPoints) { dataPoint in
				PieChartSegmentShape(startAngle: self.dataSet.startAngle(for: dataPoint) * self.animationProgress,
									 endAngle: self.dataSet.endAngle(for: dataPoint) * self.animationProgress,
									 innerRadius: 120,
									 offset: dataPoint == self.selectedDataPoint ? 10 : 0)
					.fill()
					.foregroundColor(dataPoint.color)
					.opacity(dataPoint == self.selectedDataPoint ? 1 : 0.6)
					.onTapGesture {
						withAnimation(.linear) {
							self.selectedDataPoint = dataPoint
						}
				}
			}
		}
		.onAppear {
			withAnimation(.easeInOut(duration: 1)) {
				self.animationProgress = 1
			}
		}
	}
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
		let dataPoints: [PieChartDataPoint] = [PieChartDataPoint(value: 15, color: .blue),
											   PieChartDataPoint(value: 24, color: .red),
											   PieChartDataPoint(value: 34, color: .gray),
											   PieChartDataPoint(value: 42, color: .orange),
											   PieChartDataPoint(value: 51, color: .green),
											   PieChartDataPoint(value: 15, color: .blue),
											   PieChartDataPoint(value: 24, color: .red)]
		return PieChartView(dataSet: PieChartDataSet(dataPoints: dataPoints))
			.padding()
    }
}
