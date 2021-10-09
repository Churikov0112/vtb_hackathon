import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/consts/vtb_colors.dart';
import 'package:vtb_hackathon/data/companies/gazprom.dart';
import 'package:vtb_hackathon/home/finance_screen/finance_item_view.dart';
import 'package:vtb_hackathon/home/finance_screen/finance_view_model.dart';

class FinanceView extends StatelessWidget {
  const FinanceView({Key? key}) : super(key: key);

  Widget buildList(
    BuildContext context,
    List<FinanceItem> data,
  ) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: data.length,
      itemBuilder: (context, index) => stonksItem(
        context,
        Container(
          margin: const EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: 8,
            top: 8,
          ),
          child: Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: NetworkImage(data[index].imageURI),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(data[index].name),
              const Expanded(child: SizedBox()),
              Text(
                data[index].percentOfIncreasing(context) >= 0
                    ? "+ " +
                        data[index]
                            .percentOfIncreasing(context)
                            .toStringAsFixed(3) +
                        " %"
                    : "- " +
                        data[index]
                            .percentOfIncreasing(context)
                            .abs()
                            .toStringAsFixed(3) +
                        " %",
              ),
              const SizedBox(width: 10),
              SizedBox(
                height: 20,
                width: 20,
                child: data[index].percentOfIncreasing(context) >= 0
                    ? Image.asset('lib/assets/images/profit.png')
                    : Image.asset('lib/assets/images/not_stonks.png'),
              ),
            ],
          ),
        ),
        VTBColors.color9,
        index,
      ),
    );
  }

  Widget stonksItem(
    BuildContext context,
    Widget child,
    Color color,
    int index,
  ) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => FinanceItemView(index),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2.5),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<FinanceItem> stonks = [
      FinanceItem(
        name: Gazprom.name,
        imageURI: Gazprom.imageURI,
        amount: Provider.of<Gazprom>(context).stonksData.last.open,
      ),
    ];
    return Scaffold(
      body: Column(
        children: [
          // Заголовок
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 27,
              left: 15,
              right: 15,
              bottom: 20,
            ),
            child: Row(
              children: const [
                Text(
                  'Биржа',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: VTBColors.color5,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).padding.top) -
                  135,
              child: buildList(context, stonks)),
        ],
      ),
    );
  }
}
