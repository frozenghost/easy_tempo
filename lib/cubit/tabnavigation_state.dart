part of 'tabnavigation_cubit.dart';

class TabNavigationState extends Equatable {
  const TabNavigationState({this.tabIndex});

  final int tabIndex;

  TabNavigationState copyWith({
    int tabIndex,
  }) {
    return TabNavigationState(tabIndex: tabIndex ?? this.tabIndex);
  }

  @override
  List<Object> get props => [tabIndex];
}
