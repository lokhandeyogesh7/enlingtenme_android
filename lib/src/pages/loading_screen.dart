import 'package:enlightenme/src/config/utils.dart';
import 'package:enlightenme/src/widgets/app_button.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/app_logo.png",width: 120,),
                SizedBox(height: 30),
                AppButton(onClick: () {
                  Navigator.pushNamed(context, Utils.mentorsDashboard);
                }, title: "Mentors"),
                SizedBox(
                  height: 30,
                ),
                AppButton(onClick: () {}, title: "Mentees"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
