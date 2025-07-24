import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/views/home_view.dart';
import '../../features/about/views/about_view.dart';
import '../../features/projects/views/projects_view.dart';
import '../../features/contact/views/contact_view.dart';
import '../services/navigation_service.dart';
import '../widgets/vscode_layout.dart';

class AppRouter {
  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    navigatorKey: NavigationService.navigatorKey,
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return VSCodeLayout(
            currentRoute: state.fullPath ?? '/',
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) => const HomeView(),
          ),
          GoRoute(
            path: '/about',
            name: 'about',
            builder: (context, state) => const AboutView(),
          ),
          GoRoute(
            path: '/projects',
            name: 'projects',
            builder: (context, state) => const ProjectsView(),
          ),
          GoRoute(
            path: '/contact',
            name: 'contact',
            builder: (context, state) => const ContactView(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => VSCodeLayout(
      currentRoute: state.fullPath ?? '/',
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                '404 - File Not Found',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'The file "${state.uri.toString()}" could not be found.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => context.go('/'),
                child: const Text('Go to home.dart'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
