import 'package:clone_chat/features/auth/presentation/views/login_view.dart';
import 'package:clone_chat/features/auth/presentation/views/signup_view.dart';
import 'package:clone_chat/features/home/presentation/views/chat_view.dart';
import 'package:clone_chat/features/home/presentation/views/home_view.dart';
import 'package:clone_chat/features/profile/presentation/views/profile_view.dart';
import 'package:clone_chat/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouters {
  static const String kLoginView = '/loginView';

  static const String kHomeView = '/homeView';
  static const String kSignUpView = '/signUpView';
  static const String kProfileView = '/profileView';
  static const String kChatView = '/chatView';
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
          return const LoginView();
        },
      ),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) {
          return const SignUpView();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: kChatView,
        builder: (context, state) {
          return const ChatView();
        },
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) {
          return const ProfileView();
        },
      ),
    ],
  );
}
