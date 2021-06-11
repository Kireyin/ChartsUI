//
//  BarChartView.swift
//  
//
//  Created by Alexandre on 11/06/2021.
//

import SwiftUI

public struct BarChartDataPoint: Identifiable, Equatable {
    public let id: UUID = UUID()
    let value: Double
    let color: Color
    
    public init(value: Double, color: Color = .red) {
        self.value = value
        self.color = color
    }
}

public class BarChartDataSet: ObservableObject {
    let dataPoints: [BarChartDataPoint]
    
    public init(dataPoints: [BarChartDataPoint]) {
        self.dataPoints = dataPoints
    }
}

struct BarChartView: View {
    private let dataSet: BarChartDataSet
    @State private var selectedDataPoint: BarChartDataPoint? = nil
    @State private var animationProgress: Double = 0
    
    public init(dataSet: BarChartDataSet) {
        self.dataSet = dataSet
    }
    
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .bottom, spacing: 0) {
                ForEach(dataSet.dataPoints) { dataPoint in
                    BarChartSegmentShape(height: CGFloat(CGFloat(dataPoint.value) * geometry.size.height / 100),
                                         width: geometry.size.width / CGFloat(dataSet.dataPoints.count))
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
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        let dataPoints: [BarChartDataPoint] = [BarChartDataPoint(value: 15, color: .blue),
                                               BarChartDataPoint(value: 24, color: .red),
                                               BarChartDataPoint(value: 34, color: .gray),
                                               BarChartDataPoint(value: 42, color: .orange),
                                               BarChartDataPoint(value: 51, color: .green),
                                               BarChartDataPoint(value: 15, color: .blue),
                                               BarChartDataPoint(value: 24, color: .red)]
        return BarChartView(dataSet: BarChartDataSet(dataPoints: dataPoints))
            
    }
}
