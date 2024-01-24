import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMachine, title, src;
  late SMIBool? input;
  RiveAsset(
      {required this.artboard,
      required this.stateMachine,
      required this.title,
      required this.src,
      this.input});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNav = [
  // RiveAsset(
  //     artboard: "LIKE/STAR",
  //     stateMachine: "STAR_Interactivity",
  //     title: "Super Like",
  //     src: 'assets/rive/icons.riv'),
  RiveAsset(
      artboard: "CHAT",
      stateMachine: "CHAT_Interactivity",
      title: "Char",
      src: 'assets/rive/icons.riv'),
  // RiveAsset(
  //     artboard: "HOME",
  //     stateMachine: "HOME_Interactivity",
  //     title: "Home",
  //     src: 'assets/rive/icons.riv'),
  RiveAsset(
      artboard: "BELL",
      stateMachine: "BELL_Interactivity",
      title: "Notification",
      src: 'assets/rive/icons.riv'),
  RiveAsset(
      artboard: "USER",
      stateMachine: "USER_Interactivity",
      title: "Profile",
      src: 'assets/rive/icons.riv'),
];
