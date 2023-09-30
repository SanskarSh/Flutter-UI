import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'the_boys_state.dart';

class TheBoysCubit extends Cubit<TheBoysState> {
  TheBoysCubit() : super(TheBoysInitialState());

  void theBoysButtonClicked(ctx) => emit(TheBoysClickedState(ctx: ctx));
}
