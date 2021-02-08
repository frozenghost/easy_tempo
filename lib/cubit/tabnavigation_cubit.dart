import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tabnavigation_state.dart';

class TabNavigationCubit extends Cubit<TabNavigationState> {
  TabNavigationCubit() : super(TabNavigationState(tabIndex: 0));

  void tabChanged(int index) {
    emit(state.copyWith(tabIndex: index));
  }
}
