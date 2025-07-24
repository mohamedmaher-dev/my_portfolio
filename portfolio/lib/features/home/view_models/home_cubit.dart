import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void updateIntroAnimationCompleted() {
    emit(state.copyWith(isIntroAnimationCompleted: true));
  }

  void toggleMobileMenu() {
    emit(state.copyWith(isMobileMenuOpen: !state.isMobileMenuOpen));
  }

  void closeMobileMenu() {
    emit(state.copyWith(isMobileMenuOpen: false));
  }

  void updateScrollOffset(double offset) {
    emit(state.copyWith(scrollOffset: offset));
  }
}
