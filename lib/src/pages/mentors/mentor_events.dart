import 'package:enlightenme/src/config/utils.dart';
import 'package:enlightenme/src/theme/colors.dart';
import 'package:enlightenme/src/widgets/event_calendar.dart';
import 'package:enlightenme/src/widgets/sub_titile_text.dart';
import 'package:enlightenme/src/widgets/title_text.dart';
import 'package:flutter/material.dart';

class MentorEventListScreen extends StatefulWidget {
  const MentorEventListScreen({Key? key}) : super(key: key);

  @override
  State<MentorEventListScreen> createState() => _MentorEventListScreenState();
}

class _MentorEventListScreenState extends State<MentorEventListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.polar,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, Utils.createEvent);
          },
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            Expanded(child: EventCalendarWidget()),
         /*   ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => eventListContainer(context),
            ),*/
          ],
        ),
      ),
    );
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
            const TitleText(
              text: "Today",
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.red,
            ),
            const Divider(
              color: AppColors.lightGrey,
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: double.infinity,
                      child: VerticalDivider(
                        color: Colors.red,
                        width: 2,
                        thickness: 4,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 30,
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
                  const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Icon(
                        Icons.more_vert,
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ),
                ],
              ),
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
                      Icons.access_time,
                      color: AppColors.darkGrey,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const SubTitleText(
                      text: "12-1 PM",
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
