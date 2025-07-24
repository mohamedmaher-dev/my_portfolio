import 'package:equatable/equatable.dart';

class ContactState extends Equatable {
  const ContactState({
    this.name = '',
    this.email = '',
    this.subject = '',
    this.message = '',
    this.isSubmitting = false,
    this.error,
    this.successMessage,
  });

  final String name;
  final String email;
  final String subject;
  final String message;
  final bool isSubmitting;
  final String? error;
  final String? successMessage;

  bool get isFormValid {
    return name.trim().isNotEmpty &&
        email.trim().isNotEmpty &&
        subject.trim().isNotEmpty &&
        message.trim().isNotEmpty &&
        _isValidEmail(email);
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  ContactState copyWith({
    String? name,
    String? email,
    String? subject,
    String? message,
    bool? isSubmitting,
    String? error,
    String? successMessage,
  }) {
    return ContactState(
      name: name ?? this.name,
      email: email ?? this.email,
      subject: subject ?? this.subject,
      message: message ?? this.message,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      error: error,
      successMessage: successMessage,
    );
  }

  @override
  List<Object?> get props => [
    name,
    email,
    subject,
    message,
    isSubmitting,
    error,
    successMessage,
  ];
}
