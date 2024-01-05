import 'package:enlightenme/src/widgets/app_button.dart';
import 'package:enlightenme/src/widgets/app_button_small.dart';
import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../widgets/sub_titile_text.dart';
import '../../widgets/title_text.dart';

class MentorBillsScreen extends StatefulWidget {
  const MentorBillsScreen({Key? key}) : super(key: key);

  @override
  State<MentorBillsScreen> createState() => _MentorBillsScreenState();
}

class _MentorBillsScreenState extends State<MentorBillsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView.builder(
          itemCount: 12,
          itemBuilder: (context, index) => billsListContainer(context, index)),
    ));
  }

  Container billsListContainer(BuildContext context, int index) {
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
              text: index == 0 ? "Pending" : "Paid",
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: index == 0 ? Colors.red : Colors.green,
            ),
            const Divider(
              color: AppColors.lightGrey,
            ),
            TitleText(
              text: "Super Mentors",
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            SubTitleText(
              text:
                  "New bill for your subscription 'Super Mentors' has been ${index == 0 ? "generated" : "paid"}.",
              fontSize: 14,
            ),
            const Divider(
              color: AppColors.lightGrey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubTitleText(
                  text: "${index == 0 ? "Due" : "Paid"} on:\n12th Jan 2024",
                  fontSize: 14,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: AppButtonSmall(
                      onClick: () {},
                      title: index == 0 ? "Pay Now" : "View Invoice",
                      colorVal:index == 0 ?null: Colors.grey,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
