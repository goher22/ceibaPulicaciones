import 'package:flutter/material.dart';

class DetailUserScreens extends StatelessWidget {
  const DetailUserScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text("Prueba de Ingreso"),
        ),
        body: const Center(
          child: Text("Detalle de usuario"),
        ),
      ),
    );
  }
}
