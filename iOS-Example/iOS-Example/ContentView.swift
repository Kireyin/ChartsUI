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
	let dataPoints: [PieChartDataPoint] = [PieChartDataPoint(value: 15, color: .blue),
										   PieChartDataPoint(value: 24, color: .red),
										   PieChartDataPoint(value: 34, color: .gray),
										   PieChartDataPoint(value: 42, color: .orange),
										   PieChartDataPoint(value: 51, color: .green),
										   PieChartDataPoint(value: 15, color: .blue),
										   PieChartDataPoint(value: 24, color: .red)]
	
    var body: some View {
		PieChartView(dataSet: PieChartDataSet(dataPoints: dataPoints))
			.padding()
	}
}
