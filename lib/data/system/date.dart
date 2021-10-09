import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/data/companies/gazprom.dart';

class Date with ChangeNotifier {
  DateTime currentDate = DateTime(2020, 12, 26);

  void rollDate(BuildContext context) {
    currentDate = currentDate.add(const Duration(days: 7));
    Provider.of<Gazprom>(context, listen: false).rollTime(context);
    notifyListeners();
  }
}
