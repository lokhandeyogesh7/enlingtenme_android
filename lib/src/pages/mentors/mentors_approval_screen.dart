import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../widgets/app_button_small.dart';
import '../../widgets/sub_titile_text.dart';
import '../../widgets/title_text.dart';

class MentorsApprovalScreen extends StatefulWidget {
  const MentorsApprovalScreen({Key? key}) : super(key: key);

  @override
  State<MentorsApprovalScreen> createState() => _MentorsApprovalScreenState();
}

class _MentorsApprovalScreenState extends State<MentorsApprovalScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          approvalListContainer(context, 0),
          approvalListFreeContainer(context, 0),
        ],
      ),
    ));
  }

  Container approvalListContainer(BuildContext context, int index) {
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
            Align(
              alignment: Alignment.topRight,
              child: TitleText(
                text: "Paid",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.red,
              ),
            ),
            TitleText(
              text: "Request for webdesign course",
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            SubTitleText(
              text:
                  "Kanhaiya Verma has requested approval for the webdesign course",
              fontSize: 14,
            ),
            const Divider(
              color: AppColors.lightGrey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: AppButtonSmall(
                    onClick: () {},
                    title: "Confirm Payment",
                    colorVal: Colors.cyan,
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(child: AppButtonSmall(onClick: () {}, title: "Approve")),
              ],
            )
          ],
        ),
      ),
    );
  }
  Container approvalListFreeContainer(BuildContext context, int index) {
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
            Align(
              alignment: Alignment.topRight,
              child: TitleText(
                text: "Free",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.green,
              ),
            ),
            TitleText(
              text: "Request for webdesign course",
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            SubTitleText(
              text:
              "Kanhaiya Verma has requested approval for the webdesign course",
              fontSize: 14,
            ),
            const Divider(
              color: AppColors.lightGrey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: Text("")),
                Expanded(child: AppButtonSmall(onClick: () {}, title: "Approve")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
