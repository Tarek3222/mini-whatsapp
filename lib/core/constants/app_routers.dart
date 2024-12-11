import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/features/auth/data/repos/my_repo.dart';
import 'package:clone_chat/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:clone_chat/features/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:clone_chat/features/auth/presentation/views/login_view.dart';
import 'package:clone_chat/features/auth/presentation/views/signup_view.dart';
import 'package:clone_chat/features/home/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:clone_chat/features/home/presentation/views/chat_view.dart';
import 'package:clone_chat/features/home/presentation/views/home_view.dart';
import 'package:clone_chat/features/home/presentation/views/user_profile_view.dart';
import 'package:clone_chat/features/profile/presentation/views/profile_view.dart';
import 'package:clone_chat/features/splash/presentation/views/splash_view.dart';
import 'package:clone_chat/features/status/presentation/views/add_new_status_view.dart';
import 'package:clone_chat/features/status/presentation/views/stories_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouters {
  static const String kLoginView = '/loginView';

  static const String kHomeView = '/homeView';
  static const String kSignUpView = '/signUpView';
  static const String kProfileView = '/profileView';
  static const String kChatView = '/chatView';
  static const String kUserProfile = '/userProfile';
  static const String kAddNewStatusView = '/addNewStatusView';
  static const String kStoriesView = '/storiesView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => LoginCubit(
              getIt.get<MyRepo>(),
            ),
            child: const LoginView(),
          );
        },
      ),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => RegisterCubit(
              getIt.get<MyRepo>(),
            ),
            child: const SignUpView(),
          );
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SearchCubit(),
            child: const HomeView(),
          );
        },
      ),
      GoRoute(
        path: kChatView,
        builder: (context, state) {
          return ChatView(
            chatUser: state.extra as ChatUser,
          );
        },
      ),
      GoRoute(
        path: kUserProfile,
        builder: (context, state) {
          return UserProfileView(
            user: state.extra as ChatUser,
          );
        },
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) {
          return const ProfileView();
        },
      ),
      GoRoute(
        path: kAddNewStatusView,
        builder: (context, state) {
          return const AddNewStatusView();
        },
      ),
      GoRoute(
        path: kStoriesView,
        builder: (context, state) {
          return const StoriesView();
        },
      ),
    ],
  );
}
