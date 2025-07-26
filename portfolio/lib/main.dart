import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:get_it/get_it.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/di/service_locator.dart';
import 'core/services/navigation_service.dart';
import 'core/services/portfolio_service.dart';
import 'features/home/view_models/home_cubit.dart';
import 'features/about/view_models/about_cubit.dart';
import 'features/projects/view_models/projects_cubit.dart';
import 'features/contact/view_models/contact_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize dependency injection with improved error handling
    await setupServiceLocator();
    debugPrint('✅ Service locator setup completed successfully');
  } catch (e) {
    debugPrint('❌ Error during service locator setup: $e');
    // Ensure essential services are available as fallback
    await _setupFallbackServices();
  }

  runApp(const PortfolioApp());
}

Future<void> _setupFallbackServices() async {
  try {
    final GetIt sl = GetIt.instance;

    // Reset to clear any partial registrations
    await sl.reset();

    // Register essential services as fallbacks
    sl.registerLazySingleton<NavigationService>(() => NavigationService());
    sl.registerLazySingleton<PortfolioService>(() => PortfolioService());

    // Register cubits as factories
    sl.registerFactory<HomeCubit>(() => HomeCubit());
    sl.registerFactory<AboutCubit>(() => AboutCubit(sl<PortfolioService>()));
    sl.registerFactory<ProjectsCubit>(
      () => ProjectsCubit(sl<PortfolioService>()),
    );
    sl.registerFactory<ContactCubit>(() => ContactCubit());

    debugPrint('✅ Fallback services setup completed');
  } catch (e) {
    debugPrint('❌ Fallback services setup failed: $e');
  }
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
