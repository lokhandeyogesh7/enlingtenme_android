import 'package:enlightenme/src/config/utils.dart';
import 'package:enlightenme/src/pages/mentors/mentor_bills_screen.dart';
import 'package:enlightenme/src/pages/mentors/mentor_events.dart';
import 'package:enlightenme/src/pages/mentors/mentors_approval_screen.dart';
import 'package:enlightenme/src/pages/mentors/mentors_profile.dart';
import 'package:enlightenme/src/pages/mentors/mentors_reports_list.dart';
import 'package:enlightenme/src/theme/colors.dart';
import 'package:flutter/material.dart';

class MentorsDashboardScreen extends StatefulWidget {
  const MentorsDashboardScreen({Key? key}) : super(key: key);

  @override
  State<MentorsDashboardScreen> createState() => _MentorsDashboardScreenState();
}

class _MentorsDashboardScreenState extends State<MentorsDashboardScreen> {
  var selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: selectedTab == 0
            ? MentorEventListScreen()
            : selectedTab == 1
                ? MentorsApprovalScreen()
                : selectedTab == 3
                    ? MentorsReportsListScreen()
                    : selectedTab == 2
                        ? MentorBillsScreen()
                        : MentorsProfileScreen(),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.dodgerblue,
          unselectedItemColor: AppColors.subTitleTextColor,
          elevation: 20,
          currentIndex: selectedTab,
          onTap: (value) {
            setState(() {
              selectedTab = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.event), label: "Events"),
            BottomNavigationBarItem(
                icon: Icon(Icons.approval), label: "Approvals"),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_rounded), label: "Bills"),
            BottomNavigationBarItem(
                icon: Icon(Icons.report_gmailerrorred), label: "Reports"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box_outlined), label: "Profile"),
          ],
        ),
      ),
    );
  }

}
