import 'package:flutter/material.dart';

class MainViewModel with ChangeNotifier {
  // ! Ниже идет все для Date

  // ignore: prefer_final_fields
  DateTime _currentDate = DateTime.now();

  DateTime get currentDate {
    DateTime copy = _currentDate;
    return copy;
  }

  void timeRoll() {
    _currentDate.add(const Duration(days: 1));
    notifyListeners();
  }

  // ! Ниже идет все для Stonks

  // ignore: prefer_final_fields
  List<StonksItem> _stonks = [
    StonksItem(
      'Газпром',
      'https://www.gazprom.ru/f/1/gazprom-logo-ru-3.png',
      352.17,
      366.17,
    ),
    StonksItem(
      'Apple',
      'https://clck.ru/Y6qVx',
      9891.01,
      10197.46,
    ),
    StonksItem(
      'Microsoft',
      'https://pbs.twimg.com/profile_images/1072427015612063744/H2-TQKDY.jpg',
      20000.17,
      21164.53,
    ),
    StonksItem(
      'РКК "Энергия"',
      'https://clck.ru/Y6qdG',
      8000,
      7290.00,
    ),
    StonksItem(
      'Coca Cola',
      'https://clck.ru/Y6xkc',
      850,
      861.76,
    ),
    StonksItem(
      'Яндекс',
      'https://clck.ru/Y6xyf',
      5600,
      5701.60,
    ),
    StonksItem(
      'Bank of America',
      'https://clck.ru/Y6yfc',
      3200,
      3184.19,
    ),
    StonksItem(
      'Tesla',
      'https://clck.ru/Y6yjJ',
      50000,
      56408.47,
    ),
  ];

  List<StonksItem> get stonks {
    List<StonksItem> copy = _stonks;
    return copy;
  }
}

// для отображения в main
class StonksItem {
  StonksItem(
    this.name,
    this.imageURI,
    this.buyAmount,
    this.nowAmount,
  );

  String name;
  String imageURI;
  double buyAmount;
  double nowAmount;

  // процент роста с момента покупки акции
  double get percentOfIncreasing {
    return (nowAmount != buyAmount)
        ? 100 * (nowAmount - buyAmount) / buyAmount
        : 0;
  }
}

// данные по ценам каждой акции за 1 день
class ChartSampleData {
  ChartSampleData({
    required this.x,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
  });

  DateTime x;
  double open;
  double high;
  double low;
  double close;
}
