import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/service_locator.dart';
import '../view_models/about_cubit.dart';
import '../view_models/about_state.dart';
import '../widgets/skills_section.dart';
import '../widgets/experience_section.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AboutCubit>()..loadAboutData(),
      child: const AboutViewContent(),
    );
  }
}

class AboutViewContent extends StatelessWidget {
  const AboutViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutCubit, AboutState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.error != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: Theme.of(context).colorScheme.error,
                ),
                const SizedBox(height: 16),
                Text(
                  state.error!,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => context.read<AboutCubit>().loadAboutData(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // About introduction
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardTheme.color,
                  borderRadius: BorderRadius.circular(0),
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '// About Me',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'I\'m a passionate Flutter developer with expertise in creating beautiful, '
                      'performant mobile and web applications. I love working with modern '
                      'technologies and following best practices to deliver high-quality solutions.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Skills Section
              SkillsSection(
                skills: state.filteredSkills,
                categories: state.skillCategories,
                selectedCategory: state.selectedSkillCategory,
                onCategorySelected: (category) =>
                    context.read<AboutCubit>().selectSkillCategory(category),
              ),

              const SizedBox(height: 32),

              // Experience Section
              ExperienceSection(experience: state.experience),
            ],
          ),
        );
      },
    );
  }
}
