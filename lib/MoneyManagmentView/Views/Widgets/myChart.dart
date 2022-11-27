import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/dummy_data.dart';
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
        _MyChart(title);
  }
}

class _MyChart extends StatefulWidget {
  String title = '';
  _MyChart(this.title);

  @override
  _MyChartState createState() => _MyChartState(title);
}

class _MyChartState extends State<_MyChart> {
  late List<ChartData> myData;
  late TooltipBehavior _tooltip;
  late String title;
  _MyChartState(this.title);
  @override
  void initState() {
    myData = [
      ChartData('No Expense Yet', 100, Color.fromARGB(255, 152, 169, 161))
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
                child: Text(
                    provider.expenses
                                .where((element) =>
                                    element.account_ID ==
                                    provider.balances
                                        .elementAt(provider.selectedbalance!)!
                                        .account_ID)
                                .toList()
                                .length ==
                            0
                        ? title
                        : (() {
                            if (title ==
                                'لم تكن هناك نفقات\n في هذا الأسبوع ') {
                              return provider.totalExpense.toString() +
                                  currency[provider.balances
                                          .elementAt(provider.selectedbalance!)!
                                          .currency!]
                                      .symbol;
                            } else {
                              return provider.totalIncome.toString() +
                                  currency[provider.balances
                                          .elementAt(provider.selectedbalance!)!
                                          .currency!]
                                      .symbol;
                            }
                          }()),
                    style: TextStyle(
                        color: Color.fromARGB(255, 91, 92, 87), fontSize: 18))))
      ], series: <CircularSeries>[
        DoughnutSeries<ChartData, String>(
            enableTooltip: true,
            dataSource:
                //   (() {

                (() {
              if (provider.getExpenseChart().isNotEmpty &&
                  title == 'لم تكن هناك نفقات\n في هذا الأسبوع ') {
                return provider.getExpenseChart();
              } else if (provider.getIncomeChart().isNotEmpty &&
                  title == 'لم يكن هناك\n دخل في هذا الأسبوع ') {
                return provider.getIncomeChart();
              } else {
                return myData;
              }
            }())

//}())

            // :myData
            ,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            pointColorMapper: (ChartData data, _) => data.color,

            // Radius of doughnut's inner circle
            innerRadius: '60%')
      ])));
      // );
    });
  }

  showwidget() {
    if (Provider.of<MoneyProvider>(context, listen: false)
            .expenses
            .where((element) =>
                element.account_ID ==
                Provider.of<MoneyProvider>(context, listen: false)
                    .balances
                    .elementAt(
                        Provider.of<MoneyProvider>(context, listen: false)
                            .selectedbalance!)!
                    .account_ID)
            .toList()
            .length ==
        0) {
      return Text(title);
    } else if (Provider.of<MoneyProvider>(context, listen: false)
            .incomes
            .where((element) =>
                element.account_ID ==
                Provider.of<MoneyProvider>(context, listen: false)
                    .balances
                    .elementAt(
                        Provider.of<MoneyProvider>(context, listen: false)
                            .selectedbalance!)!
                    .account_ID)
            .toList()
            .length >
        0) {
      if (title == 'لم تكن هناك نفقات\n في هذا الأسبوع ') {
        return Text(
          Provider.of<MoneyProvider>(context, listen: false)
                  .totalExpense
                  .toString() +
              currency[Provider.of<MoneyProvider>(context, listen: false)
                      .balances
                      .elementAt(
                          Provider.of<MoneyProvider>(context, listen: false)
                              .selectedbalance!)!
                      .currency!]
                  .symbol,
        );
      } else {
        return Text(
          Provider.of<MoneyProvider>(context, listen: false)
                  .totalIncome
                  .toString() +
              currency[Provider.of<MoneyProvider>(context, listen: false)
                      .balances
                      .elementAt(
                          Provider.of<MoneyProvider>(context, listen: false)
                              .selectedbalance!)!
                      .currency!]
                  .symbol,
        );
      }
    }
  }
}
