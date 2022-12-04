import 'dart:ui';

import 'package:flutter/material.dart';

class CardPublication extends StatelessWidget {
  const CardPublication({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
          vertical: size.height * 0.025,
        ),
        child: Column(
          children: [
            Text(
              "Titulo",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text("Publicacion"),
            ),
          ],
        ),
      ),
    );
  }
}
