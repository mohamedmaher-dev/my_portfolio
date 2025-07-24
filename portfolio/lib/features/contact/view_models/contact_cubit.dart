import 'package:flutter_bloc/flutter_bloc.dart';
import 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(const ContactState());

  void updateName(String name) {
    emit(state.copyWith(name: name));
  }

  void updateEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void updateSubject(String subject) {
    emit(state.copyWith(subject: subject));
  }

  void updateMessage(String message) {
    emit(state.copyWith(message: message));
  }

  Future<void> sendMessage() async {
    if (!_validateForm()) return;

    emit(state.copyWith(isSubmitting: true, error: null, successMessage: null));

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // In a real app, you would send the message to a backend service
      // For now, we'll just simulate success

      emit(
        state.copyWith(
          isSubmitting: false,
          successMessage:
              'Message sent successfully! I\'ll get back to you soon.',
          name: '',
          email: '',
          subject: '',
          message: '',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isSubmitting: false,
          error: 'Failed to send message. Please try again.',
        ),
      );
    }
  }

  bool _validateForm() {
    if (state.name.trim().isEmpty) {
      emit(state.copyWith(error: 'Please enter your name'));
      return false;
    }

    if (state.email.trim().isEmpty || !_isValidEmail(state.email)) {
      emit(state.copyWith(error: 'Please enter a valid email address'));
      return false;
    }

    if (state.subject.trim().isEmpty) {
      emit(state.copyWith(error: 'Please enter a subject'));
      return false;
    }

    if (state.message.trim().isEmpty) {
      emit(state.copyWith(error: 'Please enter a message'));
      return false;
    }

    return true;
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  void clearMessages() {
    emit(state.copyWith(error: null, successMessage: null));
  }
}
