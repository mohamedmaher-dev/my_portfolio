import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Information',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),

            _ContactItem(
              icon: Icons.email,
              title: 'Email',
              subtitle: 'mohamedmaher.developer@gmail.com',
            ),

            const SizedBox(height: 16),

            _ContactItem(
              icon: Icons.phone,
              title: 'Phone',
              subtitle: '+201065027589',
            ),

            const SizedBox(height: 16),

            _ContactItem(
              icon: Icons.location_on,
              title: 'Location',
              subtitle: 'Egypt',
            ),

            const SizedBox(height: 24),

            Text(
              'Find My Work',
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 16),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _SocialButton(
                  icon: Icons.code,
                  label: 'GitHub',
                  onPressed: () {},
                ),
                _SocialButton(
                  icon: Icons.work,
                  label: 'LinkedIn',
                  onPressed: () {},
                ),
                _SocialButton(
                  icon: Icons.shop,
                  label: 'Play Store',
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _ContactItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleSmall),
            Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 16),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }
}
