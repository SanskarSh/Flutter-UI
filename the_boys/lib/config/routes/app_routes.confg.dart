import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:the_boys/config/routes/app_routes_const.dart';
import 'package:the_boys/feature/auth/presenter/page/login_page.dart';
import 'package:the_boys/feature/chat/presenter/page/chat.dart';
import 'package:the_boys/feature/home/presenter/page/entry_page.dart';
import 'package:the_boys/feature/profile/presenter/page/profile.dart';
import 'package:the_boys/feature/splash/presenter/bloc/internet_bloc.dart';
import 'package:the_boys/feature/splash/presenter/page/splash_page.dart';
import 'package:the_boys/feature/theBoys/presenter/page/the_Boys_page.dart';

class MyRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: RouteNames.splash,
        builder: (context, state) => BlocProvider(
          create: (context) => InternetBloc(),
          child: const SplashScreen(),
        ),
      ),
      GoRoute(
        path: '/login',
        name: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        name: RouteNames.home,
        builder: (context, state) => const EntryScreen(),
        routes: [
          GoRoute(
            path: 'The-Boys',
            name: RouteNames.theBoys,
            builder: (context, state) => const TheBoysBtnScreen(),
          ),
          GoRoute(
            path: 'chat',
            name: RouteNames.chat,
            builder: (context, state) => const ChatScreen(),
          ),
          GoRoute(
            path: 'profile',
            name: RouteNames.profile,
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
    ],
  );
}
