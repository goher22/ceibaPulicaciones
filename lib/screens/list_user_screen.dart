import 'package:flutter/material.dart';

class ListUserScreen extends StatelessWidget {
  const ListUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text("Prueba de Ingreso"),
        ),
        body: const Center(
          child: Text("Lista de usuario"),
        ),
      ),
    );
  }
}
