part of 'navigate_cubit.dart';

@immutable
abstract class NavigateState {}

class NavigateInitialState extends NavigateState {}

// ignore: must_be_immutable
class NavigateClickedState extends NavigateState {
  BuildContext ctx;
  Widget nextPage;
  NavigateClickedState({
    required this.ctx,
    required this.nextPage,
  }) {
    Navigator.push(
      ctx,
      MaterialPageRoute(builder: (context) => nextPage),
    );
  }
}
