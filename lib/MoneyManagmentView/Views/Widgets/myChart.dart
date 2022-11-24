import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../models/ChartData.dart';
import '../../providers/money_provider.dart';

class ChartApp extends StatelessWidget {
  String title = '';
  ChartApp(this.title);
  @override
  Widget build(BuildContext context) {
    return
        // MaterialApp(
        // theme: ThemeData(primarySwatch: Colors.blue),
        //home:
        _MyHomePage(title);
  }
}

class _MyHomePage extends StatefulWidget {
  String title = '';
  _MyHomePage(this.title);
  // ignore: prefer_const_constructors_in_immutables
  // _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState(title);
}

class _MyHomePageState extends State<_MyHomePage> {
  late List<ChartData> myData;
  late TooltipBehavior _tooltip;
  late String title;
  _MyHomePageState(this.title);
  @override
  void initState() {
    myData = [
      ChartData('No Expense Yet', 100,Color.fromARGB(255, 152, 169, 161))
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MoneyProvider>(builder: (context, provider, x) {

      return Center(
          child: Container(
              child: SfCircularChart(annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
            widget: Container(
                child: Text(title,
                    style: TextStyle(
                        color: Color.fromARGB(255, 91, 92, 87), fontSize: 12))))
      ], series: <CircularSeries>[
        DoughnutSeries<ChartData, String>(
            enableTooltip: true,
            dataSource: 
         //   (() {
              provider.getExpenseChart().isNotEmpty?
              provider.getExpenseChart():
              
                 myData
              
//}())
            
            
          // :myData
           ,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            pointColorMapper:(ChartData data,  _) => data.color,

            // Radius of doughnut's inner circle
            innerRadius: '60%')
      ])));
      // );
    });
  }
}


