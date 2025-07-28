import 'package:fittrack_pro/src/presentation/controllers/base/base_cubit_wrapper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'bottom_navbar_state.dart';
part 'bottom_navbar_cubit.freezed.dart';

@singleton
class BottomNavbarCubit extends BaseCubitWrapper<BottomNavbarState> {
  BottomNavbarCubit() : super(const BottomNavbarState());

  void changeTab(int index) {
    if (!isClosed && index != state.selectedIndex) {
      emit(state.copyWith(selectedIndex: index));
    }
  }

  void updateVisibility(bool isVisible) {
    if (!isClosed && isVisible != state.isVisible) {
      emit(state.copyWith(isVisible: isVisible));
    }
  }

  void updateScrollDirection(bool isScrollingDown) {
    if (!isClosed && isScrollingDown != state.isScrollingDown) {
      emit(state.copyWith(isScrollingDown: isScrollingDown));
    }
  }

  /// Reset to initial state (useful for sign out)
  void reset() {
    if (!isClosed) {
      emit(const BottomNavbarState());
    }
  }
}
