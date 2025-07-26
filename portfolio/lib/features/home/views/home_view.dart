import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/service_locator.dart';
import '../view_models/home_cubit.dart';
import '../view_models/home_state.dart';
import '../widgets/hero_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>(),
      child: const HomeViewContent(),
    );
  }
}

class HomeViewContent extends StatelessWidget {
  const HomeViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return const SingleChildScrollView(child: HeroSection());
      },
    );
  }
}
