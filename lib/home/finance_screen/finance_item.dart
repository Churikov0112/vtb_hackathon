import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/data/companies/gazprom.dart';

// класс для купленных пользователем акций
class FinanceItem {
  FinanceItem({
    required this.name,
    required this.buyAmount,
  });

  // Название компании
  String name;
  // Цена покупки акций
  double buyAmount;

  double percentOfIncreasing(BuildContext context) {
    // TODO добавить другие компании
    return Provider.of<Gazprom>(context, listen: false).percentOfIncreasing;
  }
}
