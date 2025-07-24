import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_models/contact_cubit.dart';
import '../view_models/contact_state.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactCubit, ContactState>(
      builder: (context, state) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Send me a message',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 24),

                TextFormField(
                  onChanged: context.read<ContactCubit>().updateName,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Your full name',
                  ),
                ),

                const SizedBox(height: 16),

                TextFormField(
                  onChanged: context.read<ContactCubit>().updateEmail,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'your.email@example.com',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 16),

                TextFormField(
                  onChanged: context.read<ContactCubit>().updateSubject,
                  decoration: const InputDecoration(
                    labelText: 'Subject',
                    hintText: 'What is this about?',
                  ),
                ),

                const SizedBox(height: 16),

                TextFormField(
                  onChanged: context.read<ContactCubit>().updateMessage,
                  decoration: const InputDecoration(
                    labelText: 'Message',
                    hintText: 'Tell me more...',
                    alignLabelWithHint: true,
                  ),
                  maxLines: 5,
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: state.isFormValid && !state.isSubmitting
                        ? context.read<ContactCubit>().sendMessage
                        : null,
                    child: state.isSubmitting
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Send Message'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
