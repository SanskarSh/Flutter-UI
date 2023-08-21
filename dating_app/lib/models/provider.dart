import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier {
  CardProvider() {
    resetUser();
  }

  List<String> _urlImage = [];
  bool _isDragging = false;
  double _angle = 0;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;

  List<String> get urlImage => _urlImage;
  Offset get position => _position;
  bool get isDragging => _isDragging;
  double get angle => _angle;

  void setScreen(Size screenSize) => _screenSize = screenSize;

  void startPosition(DragStartDetails details) {
    _isDragging = true;
    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;
    final x = _position.dx;
    _angle = 45 * x / _screenSize.width;
    notifyListeners();
  }

  void endPosition() {
    resetPosition();
  }

  void resetPosition() {
    _angle = 0;
    _isDragging = false;
    _position = Offset.zero;
    notifyListeners();
  }

  void resetUser() {
    _urlImage = [
      "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/af93cf2f-b7b4-45e2-b2e5-29f807e64088/dfeq6u3-67723c3c-4b23-4c6a-9158-35db05755d6a.png/v1/fill/w_640,h_832,q_80,strp/hot_oc_anime_character_by_waifustudios_dfeq6u3-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9ODMyIiwicGF0aCI6IlwvZlwvYWY5M2NmMmYtYjdiNC00NWUyLWIyZTUtMjlmODA3ZTY0MDg4XC9kZmVxNnUzLTY3NzIzYzNjLTRiMjMtNGM2YS05MTU4LTM1ZGIwNTc1NWQ2YS5wbmciLCJ3aWR0aCI6Ijw9NjQwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.KoTpVNFHmygh67sWOV_eYWR98sFsScP2xB7qaG845eY",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRm3etVjQoeJByirfDNsUDkX8azud1o1EdcQ&usqp=CAU",
      "https://w7.pngwing.com/pngs/572/152/png-transparent-female-animated-character-anime-girl-desktop-cute-girl-purple-cg-artwork-black-hair-thumbnail.png",
      "https://i.pinimg.com/736x/30/b3/ca/30b3ca742dabfdc50c5f07ba9eb1631a.jpg",
      "https://i.pinimg.com/736x/9d/78/76/9d787605f2ff60329f48726991f7e169.jpg"
    ].reversed.toList();
    notifyListeners();
  }
}
