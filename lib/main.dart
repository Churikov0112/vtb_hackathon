import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/data/companies/gazprom.dart';
import 'package:vtb_hackathon/data/player/player.dart';
import 'package:vtb_hackathon/data/system/date.dart';
import 'package:vtb_hackathon/home/feed_screen/feed_view_model.dart';
import 'package:vtb_hackathon/home/finance_screen/finance_view_model.dart';
import 'package:vtb_hackathon/home/home_view.dart';
import 'package:vtb_hackathon/home/home_view_model.dart';
import 'package:vtb_hackathon/home/other_screen/other_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HomeViewModel(),
        ),
        ChangeNotifierProvider.value(
          value: Player(),
        ),
        ChangeNotifierProvider.value(
          value: FeedViewModel(),
        ),
        ChangeNotifierProvider.value(
          value: FinanceViewModel(),
        ),
        ChangeNotifierProvider.value(
          value: OtherViewModel(),
        ),
        ChangeNotifierProvider.value(
          value: Date(),
        ),
        ChangeNotifierProvider.value(
          value: Gazprom(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: HomeView(),
      ),
    );
  }
}
