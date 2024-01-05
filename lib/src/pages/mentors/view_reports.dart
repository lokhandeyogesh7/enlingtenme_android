import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../theme/colors.dart';
import '../../widgets/sub_titile_text.dart';
import '../../widgets/title_text.dart';

class ViewReportsScreen extends StatefulWidget {
  const ViewReportsScreen({Key? key}) : super(key: key);

  @override
  State<ViewReportsScreen> createState() => _ViewReportsScreenState();
}

class _ViewReportsScreenState extends State<ViewReportsScreen> {
  List<ChartData> data = [
    ChartData("Allocation", 10, Colors.red),
    ChartData("Registration", 9, Colors.green),
    ChartData("Attendees", 9, Colors.cyan),
  ];

  final dataMap = <String, double>{
    "Allocation": 10,
    "Registration": 9,
    "Attendees": 9,
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text("View Reports")),
      body: SingleChildScrollView(
          child: Column(
        children: [
          topContainer(context),
          SizedBox(height: 20,),
          TitleText(text: "Graphical Representation"),
          Padding(
            padding: const EdgeInsets.all(10),
            child: PieChart(dataMap: dataMap),
          )
        ],
      )),
    ));
  }

  Container topContainer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 8, 10, 5),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TitleText(
              text: "Web design Course",
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            const Divider(
              color: AppColors.lightGrey,
            ),
            TitleText(
              text: "Description:",
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            SubTitleText(
              text:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            const Divider(
              color: AppColors.lightGrey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.date_range_rounded,
                      color: AppColors.darkGrey,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const SubTitleText(
                      text: "12/12/23, 12-1 PM",
                      fontSize: 14,
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.supervised_user_circle_outlined,
                      color: AppColors.darkGrey,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const SubTitleText(
                      text: "10 Persons",
                      fontSize: 14,
                    )
                  ],
                )
              ],
            ),
            const Divider(
              color: AppColors.lightGrey,
            ),
            Row(
              children: [
                TitleText(
                  text: "Total Allocation:",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                SubTitleText(
                  text: " 10",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ],
            ),
            Row(
              children: [
                TitleText(
                  text: "Total Registrations:",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                SubTitleText(
                  text: " 9",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ],
            ),
            Row(
              children: [
                TitleText(
                  text: "Total Attendees:",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                SubTitleText(
                  text: " 9",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.title, this.value, this.color);

  final String title;
  final double value;
  final Color color;
}
