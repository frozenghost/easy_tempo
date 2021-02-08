part of 'search_cubit.dart';

enum SearchType {
  recent,
  assigned,
  mysprint,
  favourites,
}

class SearchState extends Equatable {
  const SearchState({
    this.status,
    this.searchText,
    this.type,
    this.issues,
  });

  final PageStatus status;
  final String searchText;
  final SearchType type;
  final List<NormalIssue> issues;

  SearchState copyWith({
    PageStatus status,
    String searchText,
    SearchType type,
    List<NormalIssue> issues,
  }) {
    return SearchState(
      status: status ?? this.status,
      searchText: searchText ?? this.searchText,
      type: type ?? this.type,
      issues: issues ?? this.issues,
    );
  }

  @override
  List<Object> get props => [status, searchText, type, issues];
}
