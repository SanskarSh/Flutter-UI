part of 'the_boys_cubit.dart';

abstract class TheBoysState {}

class TheBoysInitialState extends TheBoysState {}

class TheBoysClickedState extends TheBoysState {
  BuildContext ctx;
  TheBoysClickedState({required this.ctx});
}
