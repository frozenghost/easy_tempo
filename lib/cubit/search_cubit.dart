import 'package:bloc/bloc.dart';
import 'package:easy_tempo/cubit/tempoweek_cubit.dart';
import 'package:easy_tempo/models/jira_issue.dart';
import 'package:easy_tempo/models/normal_issue.dart';
import 'package:easy_tempo/repository/tempoRepository.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._tempoRepository)
      : super(SearchState(searchText: '', type: SearchType.recent));

  final TempoRepository _tempoRepository;

  void setSearchText(String text) {
    emit(state.copyWith(searchText: text));
  }

  Future<void> switchType(SearchType type) async {
    emit(state.copyWith(status: PageStatus.loading, type: type));
    List<NormalIssue> result =
        await _tempoRepository.searchJiraTicket(type, state.searchText);
    emit(state.copyWith(issues: result, status: PageStatus.success));
  }

  Future<void> search() async {
    emit(state.copyWith(status: PageStatus.loading));
    List<NormalIssue> result = await _tempoRepository.searchJiraTicket(
        SearchType.recent, state.searchText);
    emit(state.copyWith(issues: result, status: PageStatus.success));
  }
}
