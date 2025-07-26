import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../view_models/contact_cubit.dart';
import '../view_models/contact_state.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm>
    with TickerProviderStateMixin {
  late AnimationController _formAnimationController;
  late Animation<double> _fadeAnimation;

  final Map<String, bool> _fieldFocusStates = {
    'name': false,
    'email': false,
    'subject': false,
    'message': false,
  };

  @override
  void initState() {
    super.initState();
    _formAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _formAnimationController, curve: Curves.easeOut),
    );

    _formAnimationController.forward();
  }

  @override
  void dispose() {
    _formAnimationController.dispose();
    super.dispose();
  }

  void _updateFocusState(String field, bool isFocused) {
    setState(() {
      _fieldFocusStates[field] = isFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<ContactCubit, ContactState>(
      builder: (context, state) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  theme.colorScheme.surface,
                  theme.colorScheme.surface.withValues(alpha: 0.9),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: theme.colorScheme.outline.withValues(alpha: 0.1),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header section
                  _buildFormHeader(theme),

                  const SizedBox(height: 40),

                  // Form fields
                  _buildNameField(theme, state),
                  const SizedBox(height: 24),

                  _buildEmailField(theme, state),
                  const SizedBox(height: 24),

                  _buildSubjectField(theme, state),
                  const SizedBox(height: 24),

                  _buildMessageField(theme, state),
                  const SizedBox(height: 40),

                  // Submit button
                  _buildSubmitButton(theme, state),

                  const SizedBox(height: 20),

                  // Trust indicators
                  _buildTrustIndicators(theme),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFormHeader(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.secondary,
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.primary.withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: const FaIcon(
                FontAwesomeIcons.paperPlane,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Send Me a Message',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'I\'d love to hear about your project ideas',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Progress indicator
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
            ),
          ),
          child: Row(
            children: [
              FaIcon(
                FontAwesomeIcons.lightbulb,
                color: theme.colorScheme.primary,
                size: 16,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'All fields are required. I typically respond within 24 hours.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNameField(ThemeData theme, ContactState state) {
    return _ModernTextField(
      icon: FontAwesomeIcons.user,
      label: 'Name',
      hintText: 'Your full name',
      isFocused: _fieldFocusStates['name']!,
      onFocusChange: (focus) => _updateFocusState('name', focus),
      onChanged: context.read<ContactCubit>().updateName,
      validator: (value) =>
          value?.trim().isEmpty == true ? 'Name is required' : null,
    );
  }

  Widget _buildEmailField(ThemeData theme, ContactState state) {
    return _ModernTextField(
      icon: FontAwesomeIcons.envelope,
      label: 'Email',
      hintText: 'your.email@example.com',
      keyboardType: TextInputType.emailAddress,
      isFocused: _fieldFocusStates['email']!,
      onFocusChange: (focus) => _updateFocusState('email', focus),
      onChanged: context.read<ContactCubit>().updateEmail,
      validator: (value) {
        if (value?.trim().isEmpty == true) return 'Email is required';
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  Widget _buildSubjectField(ThemeData theme, ContactState state) {
    return _ModernTextField(
      icon: FontAwesomeIcons.tag,
      label: 'Subject',
      hintText: 'What is this about?',
      isFocused: _fieldFocusStates['subject']!,
      onFocusChange: (focus) => _updateFocusState('subject', focus),
      onChanged: context.read<ContactCubit>().updateSubject,
      validator: (value) =>
          value?.trim().isEmpty == true ? 'Subject is required' : null,
    );
  }

  Widget _buildMessageField(ThemeData theme, ContactState state) {
    return _ModernTextField(
      icon: FontAwesomeIcons.comment,
      label: 'Message',
      hintText:
          'Tell me about your project ideas, requirements, or questions...',
      maxLines: 5,
      isFocused: _fieldFocusStates['message']!,
      onFocusChange: (focus) => _updateFocusState('message', focus),
      onChanged: context.read<ContactCubit>().updateMessage,
      validator: (value) =>
          value?.trim().isEmpty == true ? 'Message is required' : null,
    );
  }

  Widget _buildSubmitButton(ThemeData theme, ContactState state) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            gradient: state.isFormValid
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      theme.colorScheme.primary,
                      theme.colorScheme.secondary,
                    ],
                  )
                : null,
            color: state.isFormValid
                ? null
                : theme.colorScheme.outline.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(16),
            boxShadow: state.isFormValid && !state.isSubmitting
                ? [
                    BoxShadow(
                      color: theme.colorScheme.primary.withValues(alpha: 0.4),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                      spreadRadius: 0,
                    ),
                  ]
                : null,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: state.isFormValid && !state.isSubmitting
                  ? context.read<ContactCubit>().sendMessage
                  : null,
              child: Center(
                child: state.isSubmitting
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Sending Message...',
                            style: theme.textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.rocket,
                            color: state.isFormValid
                                ? Colors.white
                                : theme.colorScheme.onSurface.withValues(
                                    alpha: 0.4,
                                  ),
                            size: 18,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Send Message',
                            style: theme.textTheme.titleLarge?.copyWith(
                              color: state.isFormValid
                                  ? Colors.white
                                  : theme.colorScheme.onSurface.withValues(
                                      alpha: 0.4,
                                    ),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTrustIndicators(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.1),
        ),
      ),
      child: Row(
        children: [
          _buildTrustItem(
            theme,
            FontAwesomeIcons.shield,
            'Secure',
            'Your data is safe',
          ),
          const SizedBox(width: 24),
          _buildTrustItem(
            theme,
            FontAwesomeIcons.clock,
            'Fast Reply',
            '< 24 hours',
          ),
          const SizedBox(width: 24),
          _buildTrustItem(
            theme,
            FontAwesomeIcons.heart,
            'Personal',
            'No spam ever',
          ),
        ],
      ),
    );
  }

  Widget _buildTrustItem(
    ThemeData theme,
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: FaIcon(icon, color: theme.colorScheme.primary, size: 16),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
            ),
          ),
          Text(
            subtitle,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              fontSize: 11,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ModernTextField extends StatelessWidget {
  final IconData icon;
  final String label;
  final String hintText;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool isFocused;
  final Function(bool) onFocusChange;
  final Function(String) onChanged;
  final String? Function(String?)? validator;

  const _ModernTextField({
    required this.icon,
    required this.label,
    required this.hintText,
    this.keyboardType,
    this.maxLines = 1,
    required this.isFocused,
    required this.onFocusChange,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label with icon
        Row(
          children: [
            FaIcon(
              icon,
              size: 14,
              color: isFocused
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurface.withValues(alpha: 0.7),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: isFocused
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onSurface.withValues(alpha: 0.9),
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        // Input field
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isFocused
                  ? theme.colorScheme.primary.withValues(alpha: 0.5)
                  : theme.colorScheme.outline.withValues(alpha: 0.3),
              width: isFocused ? 2 : 1,
            ),
            boxShadow: isFocused
                ? [
                    BoxShadow(
                      color: theme.colorScheme.primary.withValues(alpha: 0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Focus(
            onFocusChange: onFocusChange,
            child: TextField(
              onChanged: onChanged,
              keyboardType: keyboardType,
              maxLines: maxLines,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
