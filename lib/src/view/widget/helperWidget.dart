import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget loader = Scaffold(
  body: Center(child: Lottie.asset('assets/loader.json', width: 100)),
);

Widget erorrWidget =
    Center(child: Lottie.asset('assets/error.json', width: 150));
