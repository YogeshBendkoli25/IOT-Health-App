import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DataVisualizationScreen extends StatefulWidget {
  @override
  _DataVisualizationScreenState createState() => _DataVisualizationScreenState();
}

class _DataVisualizationScreenState extends State<DataVisualizationScreen> {
  List<FlSpot> _dataPoints = [];

  @override
  void initState() {
    super.initState();
    _dataPoints = _generateData();
  }

  List<FlSpot> _generateData() {
    final now = DateTime.now();
    return List.generate(10, (index) {
      return FlSpot(index.toDouble(), (50 + index * 3).toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Real-Time Data Visualization')),
      body: Center(
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: _dataPoints,
                isCurved: true,
                color: Colors.blue,
                barWidth: 2,
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
