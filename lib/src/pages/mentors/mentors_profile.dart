import 'package:enlightenme/src/widgets/app_button.dart';
import 'package:enlightenme/src/widgets/custom_app_bar.dart';
import 'package:enlightenme/src/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MentorsProfileScreen extends StatefulWidget {
  const MentorsProfileScreen({Key? key}) : super(key: key);

  @override
  State<MentorsProfileScreen> createState() => _MentorsProfileScreenState();
}

class _MentorsProfileScreenState extends State<MentorsProfileScreen> {
  String? email;
  String? username;

  @override
  void initState() {
    getPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.screen(title: "Profile"),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        child: AppButton(
          onClick: () {
            logoutUser();
          },
          title: "Logout",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, kToolbarHeight, 16, 16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 90.0,
                  backgroundImage: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/5288/5288993.png'),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: TitleText(
                  text: "$username",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Center(
                child: TitleText(
                  text: 'Email: $email',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              // Add more user details or actions as needed
              // For example, buttons to edit profile, sign out, etc.
            ],
          ),
        ),
      ),
    );
  }

  void getPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // username = preferences.getString(employeeName);
    // email = preferences.getString(employeeEmail);
    email = "mentor@elinghtenme.com";
    username = "First Mentor";
    setState(() {});
  }

  logoutUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    Navigator.pushReplacementNamed(context, "/");
  }
}
