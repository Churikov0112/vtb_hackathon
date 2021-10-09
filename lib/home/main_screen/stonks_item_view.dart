import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/consts/vtb_colors.dart';
import 'package:vtb_hackathon/data/companies/gazprom.dart';
import 'package:vtb_hackathon/data/player/player.dart';
import 'package:vtb_hackathon/data/stonks/stonks_item.dart';
import 'package:vtb_hackathon/home/main_screen/stonks_chart.dart';
import 'package:vtb_hackathon/widgets/half_long_button.dart';

class StonksItemView extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const StonksItemView(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    List<StonksItem> stonks = Provider.of<Player>(context).stonks;
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
                top: MediaQuery.of(context).padding.top + 27,
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
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: VTBColors.color5,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 30, left: 15, top: 30),
            child: StonksChart('Газпром'),
          ),

          // Цена покупки
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 15,
              right: 15,
            ),
            child: Row(
              children: [
                const Text(
                  "Цена покупки: ",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  // TODO добавить другие компании
                  stonks[index].buyAmount.toStringAsFixed(
                      2), // stonks[index].nowAmount.toStringAsFixed(2) + " ₽",
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
                  // TODO добавить другие компании

                  Provider.of<Gazprom>(context)
                      .stonksData
                      .last
                      .open
                      .toStringAsFixed(
                          2), // stonks[index].nowAmount.toStringAsFixed(2) + " ₽",
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
                  // TODO добавить другие компании
                  ((Provider.of<Gazprom>(context).stonksData.last.open -
                              stonks[index].buyAmount) /
                          stonks[index].buyAmount)
                      .toStringAsFixed(2),
                  //stonks[index].percentOfIncreasing.toStringAsFixed(3) + " %",
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
                  // TODO добавить другие компании

                  ((Provider.of<Gazprom>(context).stonksData.last.open -
                                  stonks[index].buyAmount) *
                              stonks[index].counter)
                          .toStringAsFixed(2) +
                      " ₽",
                  // ((stonks[index].nowAmount - stonks[index].buyAmount) *
                  //             stonks[index].counter)
                  //         .toStringAsFixed(2) +
                  //     " ₽",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const Expanded(child: SizedBox()),

          // продажа и покупка акций
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    Navigator.of(context).pop();
                    Provider.of<Player>(context, listen: false).sellStonk(
                      index,
                      Provider.of<Gazprom>(context, listen: false)
                          .stonksData
                          .last
                          .open,
                      context,
                    );
                  },
                  child: HalfLongButton(
                    Colors.red,
                    true,
                    const Text(
                      'Продать',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () {
                    Provider.of<Player>(context, listen: false).buyStonk(
                      stonks[index].name,
                      Provider.of<Gazprom>(context, listen: false)
                          .stonksData
                          .last
                          .open,
                    );
                  },
                  child: HalfLongButton(
                    VTBColors.color5,
                    true,
                    const Text(
                      'Купить',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
