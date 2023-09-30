import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_boys/feature/presenter/bloc/connectivity/bloc/internet_bloc.dart';
import 'package:the_boys/feature/presenter/bloc/navigate_to/cubit/navigate_cubit.dart';
import 'package:the_boys/feature/presenter/bloc/the_boys_button/cubit/the_boys_cubit.dart';
import 'package:the_boys/feature/presenter/pages/auth/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => InternetBloc()),
        BlocProvider(create: (_) => TheBoysCubit()),
        BlocProvider(create: (_) => NavigateCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: const Color.fromRGBO(49, 49, 49, 1),
        ),
        home: const OnboardingScreen(),
      ),
    );
  }
}
