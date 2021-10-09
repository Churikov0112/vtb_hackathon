import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/data/companies/gazprom.dart';
import 'package:vtb_hackathon/data/player/player.dart';

class FinanceViewModel with ChangeNotifier {
  // TODO добавить другие компании
  void buyStonk(String name, double buyAmount, BuildContext context) {
    Provider.of<Player>(context, listen: false).buyStonk('Газпром', buyAmount);
    notifyListeners();
  }
}

class FinanceItem {
  FinanceItem({
    required this.name,
    required this.imageURI,
    required this.amount,
  });
  String name;
  String imageURI;
  double amount;

  double percentOfIncreasing(BuildContext context) {
    // TODO добавить другие компании
    return Provider.of<Gazprom>(context, listen: false).percentOfIncreasing;
  }
}
