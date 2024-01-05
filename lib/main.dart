import 'package:enlightenme/src/config/routes.dart';
import 'package:enlightenme/src/config/utils.dart';
import 'package:enlightenme/src/pages/mentors/create_event_mentor.dart';
import 'package:enlightenme/src/pages/mentors/dashboard_mentors.dart';
import 'package:enlightenme/src/pages/mentors/mentors_profile.dart';
import 'package:enlightenme/src/widgets/custom_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/pages/loading_screen.dart';
import 'src/pages/mentors/view_reports.dart';
import 'src/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      routes: Routes.getRoute(),
      onGenerateRoute: ((settings) {
        switch (settings.name) {
          case Utils.mentorsDashboard:
            return CustomRoute<bool>(
                builder: (BuildContext context) => MentorsDashboardScreen());

          case Utils.viewReports:
            return CustomRoute<bool>(
                builder: (BuildContext context) => ViewReportsScreen());

            case Utils.createEvent:
            return CustomRoute<bool>(
                builder: (BuildContext context) => CreateEventScreen());

          default:
            return CustomRoute<bool>(
                builder: (BuildContext context) => LoadingScreen());
        }
      }),
      initialRoute: "/",
    );
  }
}
