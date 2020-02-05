import 'package:flutter/material.dart';
import 'package:mp_chart/mp/chart/line_chart.dart';
import 'package:mp_chart/mp/controller/line_chart_controller.dart';
import 'package:mp_chart/mp/core/data/line_data.dart';
import 'package:mp_chart/mp/core/data_set/line_data_set.dart';
import 'package:mp_chart/mp/core/entry/entry.dart';
import 'package:mp_chart/mp/core/enums/mode.dart';
import 'package:mp_chart/mp/core/enums/axis_dependency.dart';
import 'package:mp_chart/mp/core/enums/x_axis_position.dart';
import 'package:mp_chart/mp/core/description.dart';

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  LineChartController _controller;

  @override
  void initState() {
    super.initState();
    _initController();
    _initData();
  }

  void _initController() {
    _controller = LineChartController(
      xAxisSettingFunction: (xAxis, controller) {
        xAxis..position = XAxisPosition.BOTTOM;
      },
      legendSettingFunction: (legend, controller) {
        legend.enabled = false;
      },
      description: Description()..enabled = false,
    );
  }

  void _initData() {
    final LineData data = LineData();
    final List<Entry> entries = List();

    for (var i = 0; i < 10; i++) {
      entries.add(
        Entry(
          x: i.toDouble(),
          y: 0.81,
        ),
      );
    }

    entries.add(
      Entry(
        x: 10,
        y: 0.80,
      ),
    );

    final LineDataSet dataset = LineDataSet(entries, '');
    final Color dataColor = Color(0xFF03A9F4);
    dataset.setColor1(dataColor);
    dataset.setLineWidth(2.5);
    dataset.setCircleColor(Color.fromARGB(0, 0, 0, 0));
    dataset.setCircleRadius(1);
    dataset.setCircleSize(0);
    dataset.setMode(Mode.LINEAR);
    dataset.setDrawValues(false);
    dataset.setDrawFilled(true);
    dataset.setFillColor(dataColor);
    dataset.setAxisDependency(AxisDependency.LEFT);
    data.addDataSet(dataset);

    _controller.data = data;
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(_controller);
  }
}
