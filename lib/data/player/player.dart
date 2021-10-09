import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/data/companies/gazprom.dart';
import 'package:vtb_hackathon/data/stonks/stonks_item.dart';
import 'package:vtb_hackathon/home/home_view_model.dart';

class Player with ChangeNotifier {
  double _safetyPillow = 0;

  double get safetyPillow {
    double copy = _safetyPillow;
    return copy;
  }

  double _freeMoney = 100000;

  double get freeMoney {
    double copy = _freeMoney;
    return copy;
  }

  void increaseSafetyPillow() {
    _safetyPillow += _freeMoney * 0.1;
    _freeMoney = _freeMoney * 0.9;
    notifyListeners();
  }

  void decreaseSafetyPillow() {
    _freeMoney += _safetyPillow * 0.1;
    _safetyPillow = _safetyPillow * 0.9;
    notifyListeners();
  }

  void buyStonk(
    String name,
    double buyAmount,
  ) {
    stonks.add(StonksItem(
      name: name,
      buyAmount: buyAmount,
      counter: 1,
    ));
    _freeMoney -= buyAmount;
    notifyListeners();
  }

  void sellStonk(
    int index,
    double sellAmount,
    BuildContext context,
  ) {
    stonks.removeAt(index);
    _freeMoney += sellAmount;

    notifyListeners();
  }

  List<StonksItem> stonks = [
    StonksItem(
      name: 'Газпром',
      buyAmount: 112.17,
      counter: 1,
    ),

    // StonksItem(
    //   name: 'Apple',
    //   imageURI: 'https://clck.ru/Y6qVx',
    //   buyAmount: 9891.01,
    //   nowAmount: 10197.46,
    //   counter: 10,
    //   stonksData: <ChartSampleData>[
    //     ChartSampleData(
    //         x: DateTime(2020, 01, 11),
    //         open: 9898.97,
    //         high: 10981.19,
    //         low: 9598.36,
    //         close: 9798.13),
    //     ChartSampleData(
    //         x: DateTime(2020, 01, 18),
    //         open: 9898.41,
    //         high: 10981.46,
    //         low: 9398.42,
    //         close: 10981.42),
    //     ChartSampleData(
    //         x: DateTime(2020, 01, 25),
    //         open: 10981.52,
    //         high: 10981.53,
    //         low: 9298.39,
    //         close: 9798.34),
    //     ChartSampleData(
    //         x: DateTime(2020, 02, 01),
    //         open: 9698.47,
    //         high: 9798.33,
    //         low: 9398.69,
    //         close: 9498.02),
    //     ChartSampleData(
    //         x: DateTime(2020, 02, 08),
    //         open: 9398.13,
    //         high: 9698.35,
    //         low: 9298.59,
    //         close: 9398.99),
    //     ChartSampleData(
    //         x: DateTime(2020, 02, 15),
    //         open: 9198.02,
    //         high: 9498.89,
    //         low: 9098.61,
    //         close: 9298.04),
    //     ChartSampleData(
    //         x: DateTime(2020, 02, 22),
    //         open: 9898.0237,
    //         high: 9898.0237,
    //         low: 9898.0237,
    //         close: 9898.0237),
    //     ChartSampleData(
    //         x: DateTime(2020, 02, 29),
    //         open: 9998.86,
    //         high: 10986.75,
    //         low: 9998.65,
    //         close: 10986.01),
    //     ChartSampleData(
    //         x: DateTime(2020, 03, 07),
    //         open: 10982.39,
    //         high: 10982.83,
    //         low: 10980.15,
    //         close: 10982.26),
    //     ChartSampleData(
    //         x: DateTime(2020, 03, 14),
    //         open: 10981.91,
    //         high: 10986.5,
    //         low: 10981.78,
    //         close: 10985.92),
    //     ChartSampleData(
    //         x: DateTime(2020, 03, 21),
    //         open: 10985.93,
    //         high: 10987.65,
    //         low: 10984.89,
    //         close: 10985.67),
    //     ChartSampleData(
    //         x: DateTime(2020, 03, 28),
    //         open: 10986,
    //         high: 11980.42,
    //         low: 10984.88,
    //         close: 10989.99),
    //     ChartSampleData(
    //         x: DateTime(2020, 04, 04),
    //         open: 11980.42,
    //         high: 11982.19,
    //         low: 10988.121,
    //         close: 10988.66),
    //     ChartSampleData(
    //         x: DateTime(2020, 04, 11),
    //         open: 10988.97,
    //         high: 11982.39,
    //         low: 10988.66,
    //         close: 10989.85),
    //     ChartSampleData(
    //         x: DateTime(2020, 04, 18),
    //         open: 10988.89,
    //         high: 10988.95,
    //         low: 10984.62,
    //         close: 10985.68),
    //     ChartSampleData(
    //         x: DateTime(2020, 04, 25),
    //         open: 10985,
    //         high: 10985.65,
    //         low: 9298.51,
    //         close: 9398.74),
    //     ChartSampleData(
    //         x: DateTime(2020, 05, 02),
    //         open: 9398.965,
    //         high: 9598.9,
    //         low: 9198.85,
    //         close: 9298.72),
    //     ChartSampleData(
    //         x: DateTime(2020, 05, 09),
    //         open: 9398,
    //         high: 9398.77,
    //         low: 8998.47,
    //         close: 9098.52),
    //     ChartSampleData(
    //         x: DateTime(2020, 05, 16),
    //         open: 9298.39,
    //         high: 9598.43,
    //         low: 9198.65,
    //         close: 9598.22),
    //     ChartSampleData(
    //         x: DateTime(2020, 05, 23),
    //         open: 9598.87,
    //         high: 10980.73,
    //         low: 9598.67,
    //         close: 10980.35),
    //     ChartSampleData(
    //         x: DateTime(2020, 05, 30),
    //         open: 9998.6,
    //         high: 10980.4,
    //         low: 9698.63,
    //         close: 9798.92),
    //     ChartSampleData(
    //         x: DateTime(2020, 06, 06),
    //         open: 9798.99,
    //         high: 10981.89,
    //         low: 9798.55,
    //         close: 9898.83),
    //     ChartSampleData(
    //         x: DateTime(2020, 06, 13),
    //         open: 9898.69,
    //         high: 9998.12,
    //         low: 9598.3,
    //         close: 9598.33),
    //     ChartSampleData(
    //         x: DateTime(2020, 06, 20),
    //         open: 9698,
    //         high: 9698.89,
    //         low: 9298.65,
    //         close: 9398.4),
    //     ChartSampleData(
    //         x: DateTime(2020, 06, 27),
    //         open: 9398,
    //         high: 9698.465,
    //         low: 9198.5,
    //         close: 9598.89),
    //     ChartSampleData(
    //         x: DateTime(2020, 07, 04),
    //         open: 9598.39,
    //         high: 9698.89,
    //         low: 9498.37,
    //         close: 9698.68),
    //     ChartSampleData(
    //         x: DateTime(2020, 07, 11),
    //         open: 9698.75,
    //         high: 9998.3,
    //         low: 9698.73,
    //         close: 9898.78),
    //     ChartSampleData(
    //         x: DateTime(2020, 07, 18),
    //         open: 9898.7,
    //         high: 10981,
    //         low: 9898.31,
    //         close: 9898.66),
    //     ChartSampleData(
    //         x: DateTime(2020, 07, 25),
    //         open: 9898.25,
    //         high: 10984.55,
    //         low: 9698.42,
    //         close: 10984.21),
    //     ChartSampleData(
    //         x: DateTime(2020, 08, 01),
    //         open: 10984.41,
    //         high: 10987.65,
    //         low: 10984,
    //         close: 10987.48),
    //     ChartSampleData(
    //         x: DateTime(2020, 08, 08),
    //         open: 10987.52,
    //         high: 10988.94,
    //         low: 10987.16,
    //         close: 10988.18),
    //     ChartSampleData(
    //         x: DateTime(2020, 08, 15),
    //         open: 10988.14,
    //         high: 11980.23,
    //         low: 10988.08,
    //         close: 10989.36),
    //     ChartSampleData(
    //         x: DateTime(2020, 08, 22),
    //         open: 10988.86,
    //         high: 10989.32,
    //         low: 10986.31,
    //         close: 10986.94),
    //     ChartSampleData(
    //         x: DateTime(2020, 08, 29),
    //         open: 10986.62,
    //         high: 10988,
    //         low: 10985.5,
    //         close: 10987.73),
    //     ChartSampleData(
    //         x: DateTime(2020, 09, 05),
    //         open: 10987.9,
    //         high: 10988.76,
    //         low: 10983.13,
    //         close: 10983.13),
    //     ChartSampleData(
    //         x: DateTime(2020, 09, 12),
    //         open: 10982.65,
    //         high: 11986.13,
    //         low: 10982.53,
    //         close: 11984.92),
    //     ChartSampleData(
    //         x: DateTime(2020, 09, 19),
    //         open: 11985.19,
    //         high: 11986.18,
    //         low: 11981.55,
    //         close: 11982.71),
    //     ChartSampleData(
    //         x: DateTime(2020, 09, 26),
    //         open: 11981.64,
    //         high: 11984.64,
    //         low: 11981.55,
    //         close: 11983.05),
    //     ChartSampleData(
    //         x: DateTime(2020, 10, 03),
    //         open: 11982.71,
    //         high: 11984.56,
    //         low: 11982.28,
    //         close: 11984.06),
    //     ChartSampleData(
    //         x: DateTime(2020, 10, 10),
    //         open: 11985.02,
    //         high: 11988.69,
    //         low: 11984.72,
    //         close: 11987.63),
    //     ChartSampleData(
    //         x: DateTime(2020, 10, 17),
    //         open: 11987.33,
    //         high: 11988.21,
    //         low: 11983.8,
    //         close: 11986.6),
    //     ChartSampleData(
    //         x: DateTime(2020, 10, 24),
    //         open: 11987.1,
    //         high: 11988.36,
    //         low: 11983.31,
    //         close: 11983.72),
    //     ChartSampleData(
    //         x: DateTime(2020, 10, 31),
    //         open: 11983.65,
    //         high: 11984.23,
    //         low: 10988.11,
    //         close: 10988.84),
    //     ChartSampleData(
    //         x: DateTime(2020, 11, 07),
    //         open: 11980.08,
    //         high: 11981.72,
    //         low: 10985.83,
    //         close: 10988.43),
    //     ChartSampleData(
    //         x: DateTime(2020, 11, 14),
    //         open: 10987.71,
    //         high: 11980.54,
    //         low: 10984.08,
    //         close: 11980.06),
    //     ChartSampleData(
    //         x: DateTime(2020, 11, 21),
    //         open: 11985.42,
    //         high: 11985.42,
    //         low: 11985.42,
    //         close: 11985.42),
    //     ChartSampleData(
    //         x: DateTime(2020, 11, 28),
    //         open: 11981.43,
    //         high: 11982.465,
    //         low: 10988.85,
    //         close: 10989.9),
    //     ChartSampleData(
    //         x: DateTime(2020, 12, 05),
    //         open: 11980,
    //         high: 11984.7,
    //         low: 10988.25,
    //         close: 11983.95),
    //     ChartSampleData(
    //         x: DateTime(2020, 12, 12),
    //         open: 11983.29,
    //         high: 11986.73,
    //         low: 11982.49,
    //         close: 11985.97),
    //     ChartSampleData(
    //         x: DateTime(2020, 12, 19),
    //         open: 11985.8,
    //         high: 11987.5,
    //         low: 11985.59,
    //         close: 11986.52),
    //     ChartSampleData(
    //         x: DateTime(2020, 12, 26),
    //         open: 11986.52,
    //         high: 11988.0166,
    //         low: 11985.43,
    //         close: 11985.82),
    //     ChartSampleData(
    //         x: DateTime(2021, 01, 03),
    //         open: 11986.52,
    //         high: 11988.0166,
    //         low: 11985.43,
    //         close: 11985.82),
    //   ],
    // ),
    // StonksItem(

    // ),
    // StonksItem(
    //   name: 'Microsoft',
    //   imageURI: 'https://pbs.twimg.com/profile_images/1072427015612063744/H2-TQKDY.jpg',
    //   buyAmount: 20000.17,
    //   nowAmount: 21164.53,
    //   counter: 1,
    // ),
    // StonksItem(
    //   name: 'РКК "Энергия"',
    //   imageURI: 'https://clck.ru/Y6qdG',
    //   buyAmount: 8000,
    //   nowAmount: 7290.00,
    //  counter:  1,
    // ),
    // StonksItem(
    //   name: 'Coca Cola',
    //   imageURI: 'https://clck.ru/Y6xkc',
    //   buyAmount: 850,
    //   nowAmount: 861.76,
    //   counter: 100,
    // ),
    // StonksItem(
    //   name: 'Яндекс',
    //   imageURI: 'https://clck.ru/Y6xyf',
    //   buyAmount: 5600,
    //   nowAmount: 5701.60,
    //   counter: 1,
    // ),
    // StonksItem(
    //   name: 'Bank of America',
    //   imageURI: 'https://clck.ru/Y6yfc',
    //   buyAmount: 3200,
    //   nowAmount: 3184.19,
    //   counter: 10,
    // ),
    // StonksItem(
    //   name: 'Tesla',
    //   imageURI: 'https://clck.ru/Y6yjJ',
    //   buyAmount: 50000,
    //   nowAmount: 56408.47,
    //  counter:  1,
    // ),
  ];

  // сколько всего денег вложено в акции
  // TODO добавить другие компании
  double howMuchMoneyInStonks(
    BuildContext context,
    int gazpromCount,
  ) {
    return Provider.of<Gazprom>(context, listen: false).stonksData.last.open *
        gazpromCount;
  }
}
