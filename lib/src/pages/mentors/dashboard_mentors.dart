import 'package:enlightenme/src/config/utils.dart';
import 'package:enlightenme/src/pages/mentors/mentor_bills_screen.dart';
import 'package:enlightenme/src/pages/mentors/mentor_events.dart';
import 'package:enlightenme/src/pages/mentors/mentors_approval_screen.dart';
import 'package:enlightenme/src/pages/mentors/mentors_profile.dart';
import 'package:enlightenme/src/pages/mentors/mentors_reports_list.dart';
import 'package:enlightenme/src/theme/colors.dart';
import 'package:enlightenme/src/widgets/custom_app_bar.dart';
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

    void handleClick(String value) {
      switch (value) {
        case 'Profile':
          Navigator.pushNamed(context, Utils.mentorsProfile);
          break;
        case 'Settings':
          break;
      }
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 4,
          title: Text("Enlighten Me"),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/app_logo.png"),
          ),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return {'Profile',}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: selectedTab == 0
            ? MentorEventListScreen()
            /*: selectedTab == 1
                ? MentorsApprovalScreen()*/
                : selectedTab == 2
                    ? MentorsReportsListScreen()
                    : selectedTab == 1
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
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.approval), label: "Approvals"),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_rounded), label: "Bills"),
            BottomNavigationBarItem(
                icon: Icon(Icons.report_gmailerrorred), label: "Reports"),
            /*BottomNavigationBarItem(
                icon: Icon(Icons.account_box_outlined), label: "Profile"),*/
          ],
        ),
      ),
    );
  }

}
