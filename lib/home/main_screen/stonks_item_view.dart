import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/consts/vtb_colors.dart';
import 'package:vtb_hackathon/home/main_screen/main_view_model.dart';
import 'package:vtb_hackathon/home/main_screen/stonks_chart.dart';

class StonksItemView extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  StonksItemView(this.index);

  int index;

  @override
  Widget build(BuildContext context) {
    List<StonksItem> stonks = Provider.of<MainViewModel>(context).stonks;
    return Scaffold(
      body: Column(
        children: [
          // Заголовок
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 15,
                left: 15,
                right: 15,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.chevron_left_sharp,
                    size: 32,
                    color: VTBColors.color5,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    stonks[index].name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: VTBColors.color5,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(right: 30, left: 15, top: 30),
            child: StonksChart(),
          ),

          // Цена на момент покупки
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 15,
              right: 15,
            ),
            child: Row(
              children: [
                const Text(
                  "Цена на момент покупки: ",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  stonks[index].buyAmount.toStringAsFixed(2) + " ₽",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Цена сейчас
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 15,
              right: 15,
            ),
            child: Row(
              children: [
                const Text(
                  "Цена сейчас: ",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  stonks[index].nowAmount.toStringAsFixed(2) + " ₽",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Сколько акций куплено
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 15,
              right: 15,
            ),
            child: Row(
              children: [
                const Text(
                  "Количество купленных акций: ",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  stonks[index].counter.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Процент прибыли
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 15,
              right: 15,
            ),
            child: Row(
              children: [
                const Text(
                  "Процент прибыли: ",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  stonks[index].percentOfIncreasing.toStringAsFixed(3) + " %",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Сумма прибыли
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 15,
              right: 15,
            ),
            child: Row(
              children: [
                const Text(
                  "Сумма прибыли: ",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  ((stonks[index].nowAmount - stonks[index].buyAmount) *
                              stonks[index].counter)
                          .toStringAsFixed(2) +
                      " ₽",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
