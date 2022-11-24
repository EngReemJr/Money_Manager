import 'package:flutter/material.dart';

import '../../models/CurrencyModel.dart';

class CurrencyWidget extends StatefulWidget {
  CurrencyModel currencymodel;

  CurrencyWidget(this.currencymodel);

  @override
  State<CurrencyWidget> createState() => _CurrencyWidgetState();
}

class _CurrencyWidgetState extends State<CurrencyWidget> {
  Color _SelectedcolorContainer = Colors.white;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Ink(
        child: InkWell(
            onTap: () {
              _SelectedcolorContainer = Color(0xff89ba8b);
              setState(() {});
            },
            child: Container(
                decoration: BoxDecoration(
                  color: _SelectedcolorContainer,
                ),
                margin: EdgeInsets.only(left: 35, right: 35, bottom: 32),
                child: Row(
                  children: [
                    Text(
                      widget.currencymodel.currencyCode,
                      style: TextStyle(
                          fontFamily: "Noto Naskh Arabic",
                          fontSize: 24.0,
                          color: Color.fromARGB(255, 36, 37, 31)),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Text(widget.currencymodel.currencyName,
                        style: TextStyle(
                            fontFamily: "Noto Naskh Arabic",
                            fontSize: 24.0,
                            color: Color.fromARGB(255, 36, 37, 31)))
                  ],
                ))));
  }
}
