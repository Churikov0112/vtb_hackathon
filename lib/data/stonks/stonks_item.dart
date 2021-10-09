import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/data/companies/gazprom.dart';

class StonksItem {
  StonksItem({
    required this.name,
    required this.buyAmount,
    required this.counter,
  });

  // Название компании
  String name;
  // Цена покупки акций
  double buyAmount;
  // Сколько акций в наличии
  int counter;

  String imageURI(BuildContext context) {
    // TODO добавить другие компании

    return Provider.of<Gazprom>(context, listen: false).imageURI;
  }

  double percentOfIncreasing(BuildContext context) {
    // TODO добавить другие компании

    return Provider.of<Gazprom>(context, listen: false).percentOfIncreasing;
  }
}
