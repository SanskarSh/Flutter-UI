import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'navigate_state.dart';

class NavigateCubit extends Cubit<NavigateState> {
  NavigateCubit() : super(NavigateInitialState());
  void navigateButtonClicked(ctx, nextPage) =>
      emit(NavigateClickedState(ctx: ctx, nextPage: nextPage));
}
