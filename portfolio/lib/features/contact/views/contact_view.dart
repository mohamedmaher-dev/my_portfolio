import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/service_locator.dart';
import '../view_models/contact_cubit.dart';
import '../view_models/contact_state.dart';
import '../widgets/contact_form.dart';
import '../widgets/contact_info.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ContactCubit>(),
      child: const ContactViewContent(),
    );
  }
}

class ContactViewContent extends StatelessWidget {
  const ContactViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContactCubit, ContactState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
          // Clear the error after showing it
          context.read<ContactCubit>().clearMessages();
        }

        if (state.successMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.successMessage!),
              backgroundColor: Colors.green,
            ),
          );
          // Clear the success message after showing it
          context.read<ContactCubit>().clearMessages();
        }
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Introduction
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
                    '// Get in Touch',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'I\'d love to hear from you! Whether you have a project in mind, '
                    'want to collaborate, or just want to say hello, feel free to reach out.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Contact Form and Info
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 900) {
                  // Desktop layout - side by side
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 2, child: ContactForm()),
                      const SizedBox(width: 32),
                      Expanded(flex: 1, child: ContactInfo()),
                    ],
                  );
                } else {
                  // Mobile layout - stacked
                  return Column(
                    children: [
                      ContactForm(),
                      const SizedBox(height: 32),
                      ContactInfo(),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
