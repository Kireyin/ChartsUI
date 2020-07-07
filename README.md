# ChartsUI

<img src="https://github.com/Kireyin/ChartsUI/blob/master/Screenshots/piechart.jpg" alt="PieChart" width="150">

## Usage
### Donut chart

Start by creating your DataPoints and DataSet
```swift
let dataPoints: [PieChartDataPoint] = [PieChartDataPoint(value: 15, color: .blue)]
let dataSet: PieChartDataSet = PieChartDataSet(dataPoints: dataPoints)
```

Then add a `PieChartView` to your view hierarchy
```swift
var body: some View {
  PieChartView(dataSet: dataSet)
}
```
