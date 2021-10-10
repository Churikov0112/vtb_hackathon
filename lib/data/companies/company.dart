import 'package:vtb_hackathon/data/stonks/chart_sample_data.dart';

class Company {
  Company(
      {required this.name, required this.imageURI, required this.stonksData});

  final String name;
  final String imageURI;
  List<ChartSampleData> stonksData;
}
