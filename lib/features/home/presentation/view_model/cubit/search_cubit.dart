import 'package:clone_chat/core/models/chat_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  late List<ChatUser> users;
  void searchUser(String value) {
    List<ChatUser> searchedUsers = [];
    for (var chat in users) {
      if (chat.name!.toLowerCase().contains(value.toLowerCase())) {
        searchedUsers.add(chat);
      }
      if (searchedUsers.isNotEmpty) {
        emit(SearchSuccess(searchedUsers));
      } else {
        emit(SearchInitial());
      }
    }
  }
}
