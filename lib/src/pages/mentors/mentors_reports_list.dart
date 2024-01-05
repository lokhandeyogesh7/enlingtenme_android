import 'package:enlightenme/src/config/utils.dart';
import 'package:enlightenme/src/widgets/app_button_small.dart';
import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../widgets/sub_titile_text.dart';
import '../../widgets/title_text.dart';

class MentorsReportsListScreen extends StatefulWidget {
  const MentorsReportsListScreen({Key? key}) : super(key: key);

  @override
  State<MentorsReportsListScreen> createState() =>
      _MentorsReportsListScreenState();
}

class _MentorsReportsListScreenState extends State<MentorsReportsListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => eventListContainer(context),
      ),
    ));
  }

  Container eventListContainer(BuildContext context) {
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
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 8, 8, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TitleText(
                          text: "New Web Design Class",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        const SubTitleText(
                          text: "Website design demo",
                          fontSize: 14,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: AppButtonSmall(
                      onClick: () {
                        Navigator.pushNamed(context, Utils.viewReports);
                      },
                      title: "View",
                      colorVal: Colors.blueGrey,
                    )),
              ],
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
            )
          ],
        ),
      ),
    );
  }
}
