import 'package:channab/ui/animal_details_screen/animal_details_ui.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimalDetailsUI(),
    );
  }
}
