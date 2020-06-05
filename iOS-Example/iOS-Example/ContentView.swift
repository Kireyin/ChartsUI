//
//  ContentView.swift
//  iOS-Example
//
//  Created by Alexandre Brispot on 05/06/2020.
//  Copyright © 2020 Kireyin. All rights reserved.
//

import SwiftUI
import ChartsUI

struct ContentView: View {
	let dataPoints: [PieChartDataPoint] = [PieChartDataPoint(id: 0, value: 15, color: .blue),
										   PieChartDataPoint(id: 1, value: 24, color: .red),
										   PieChartDataPoint(id: 2, value: 34, color: .gray),
										   PieChartDataPoint(id: 3, value: 42, color: .orange),
										   PieChartDataPoint(id: 4, value: 51, color: .green),
										   PieChartDataPoint(id: 5, value: 15, color: .blue),
										   PieChartDataPoint(id: 6, value: 24, color: .red)]
	
    var body: some View {
		PieChartView(dataSet: PieChartDataSet(dataPoints: dataPoints))
			.padding()
	}
}
