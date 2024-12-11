import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/core/utils/user_services.dart';
import 'package:clone_chat/core/widgets/custom_loading_indecator.dart';
import 'package:clone_chat/features/home/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/build_chats_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsTabBody extends StatelessWidget {
  const ChatsTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getIt.get<UserServices>().getMyChatUsers(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return CustomLoadingIndecator();

          case ConnectionState.done:
          case ConnectionState.active:
            if (snapshot.hasData) {
              //get users when i added it
              return StreamBuilder(
                  stream: getIt.get<UserServices>().getAllUsers(
                        usersId:
                            snapshot.data?.docs.map((e) => e.id).toList() ?? [],
                      ),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return CustomLoadingIndecator();

                      case ConnectionState.done:
                      case ConnectionState.active:
                        if (snapshot.hasData) {
                          var data = snapshot.data?.docs;
                          List<ChatUser> chatsUsers = data
                                  ?.map(
                                    (doc) => ChatUser.fromJson(
                                        doc.data() as Map<String, dynamic>),
                                  )
                                  .toList() ??
                              [];
                          BlocProvider.of<SearchCubit>(context).users =
                              chatsUsers;
                          if (chatsUsers.isNotEmpty) {
                            return BlocBuilder<SearchCubit, SearchState>(
                              builder: (context, state) {
                                if (state is SearchSuccess) {
                                  return BuildChatsListView(
                                      chatsUsers: state.searchUsers);
                                } else {
                                  return BuildChatsListView(
                                      chatsUsers: chatsUsers);
                                }
                              },
                            );
                          } else {
                            return const Center(
                              child: Text('No Chats Available!'),
                            );
                          }
                        } else if (!snapshot.hasData) {
                          return const Center(
                            child: Text('No Chats Available!, create one!'),
                          );
                        } else {
                          return const Center(
                            child: Text('No Chats Available!'),
                          );
                        }
                      default:
                        return const Center(
                          child: Text('No Chats'),
                        );
                    }
                  });
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('No Chats'),
              );
            } else {
              return CustomLoadingIndecator();
            }
          default:
            return const Center(
              child: Text('No Chats'),
            );
        }
      },
    );
  }
}
