part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<ChatUser> searchUsers;
  SearchSuccess(this.searchUsers);
}
