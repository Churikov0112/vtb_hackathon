import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/home/main_screen/main_view_model.dart';
import 'package:vtb_hackathon/widgets/stonks_chart.dart';

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
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 15,
              left: 15,
              right: 15,
            ),
            child: Text(
              stonks[index].name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(15),
            child: StonksChart(),
          ),
        ],
      ),
    );
  }
}
