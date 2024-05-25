import 'package:checkout/screen/presenter_screen.dart';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Checkout Page",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PresenterScreen(),
    ));
