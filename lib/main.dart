import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/home/feed_screen/feed_view_model.dart';
import 'package:vtb_hackathon/home/finance_screen/finance_view_model.dart';
import 'package:vtb_hackathon/home/home_view.dart';
import 'package:vtb_hackathon/home/home_view_model.dart';
import 'package:vtb_hackathon/home/main_screen/main_view_model.dart';
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
          value: MainViewModel(),
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
