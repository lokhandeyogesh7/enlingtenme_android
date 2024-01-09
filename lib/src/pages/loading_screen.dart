import 'package:enlightenme/src/config/utils.dart';
import 'package:enlightenme/src/theme/colors.dart';
import 'package:enlightenme/src/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.polar,
          body: Stack(alignment: Alignment.center, children: [
            Transform.rotate(
              angle: 300 / 23.0,
              child: AnimatedContainer(
                duration: Duration(seconds: 4),
                curve: Curves.bounceIn,
                child: Image.asset(
                  'assets/bulb.png',
                  opacity: AlwaysStoppedAnimation(0.5),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/app_logo.png",
                      width: 120,
                    ),
                    SizedBox(height: 30),
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.google,
                      borderRadius: 30,
                      onPressed: () {
                        Navigator.pushNamed(context, Utils.mentorsDashboard);
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.facebook,
                      borderRadius: 30,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ])),
    );
  }
}
