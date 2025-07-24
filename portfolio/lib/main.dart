import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection
  await setupServiceLocator();

  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Developer Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerConfig: AppRouter.router,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}
