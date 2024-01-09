import 'package:enlightenme/src/config/utils.dart';
import 'package:enlightenme/src/pages/mentors/dashboard_mentors.dart';
import 'package:enlightenme/src/pages/mentors/mentors_profile.dart';
import 'package:flutter/material.dart';

import '../pages/loading_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => LoadingScreen(),
      Utils.mentorsDashboard: (_) => MentorsDashboardScreen(),
      Utils.mentorsProfile: (_) => MentorsProfileScreen(),
      // '/detail': (_) => ProductDetailPage()
    };
  }
}