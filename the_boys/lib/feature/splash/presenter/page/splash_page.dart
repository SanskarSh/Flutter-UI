import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:the_boys/config/routes/app_routes_const.dart';
import 'package:the_boys/feature/splash/presenter/bloc/internet_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  padding: EdgeInsets.all(8.0),
                  content: Text('Internet not connected!'),
                  backgroundColor: Colors.red,
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Internet connected!'),
                  backgroundColor: Colors.green,
                ),
              );
            }
          },
          builder: (BuildContext context, InternetState state) {
            if (state is InternetGainedState) {
              Future.delayed(Durations.long1).then((value) {
                context.goNamed(RouteNames.login);
              });
              return const CircularProgressIndicator.adaptive();
            }
            return const CircularProgressIndicator.adaptive();
          },
        ),
      ),
    );
  }
}
