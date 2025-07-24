import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  BuildContext? get context => navigatorKey.currentContext;

  void goToHome() {
    if (context != null) {
      context!.go('/');
    }
  }

  void goToAbout() {
    if (context != null) {
      context!.go('/about');
    }
  }

  void goToProjects() {
    if (context != null) {
      context!.go('/projects');
    }
  }

  void goToContact() {
    if (context != null) {
      context!.go('/contact');
    }
  }

  void goBack() {
    if (context != null && context!.canPop()) {
      context!.pop();
    }
  }
}
