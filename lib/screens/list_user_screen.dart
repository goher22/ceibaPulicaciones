import 'package:flutter/material.dart';

import '../widgets/card_user.dart';

class ListUserScreen extends StatelessWidget {
  const ListUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text("Prueba de Ingreso"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  floatingLabelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  labelText: "Buscar usuario",
                ),
                onChanged: (value) {},
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: size.height * 0.03),
                      child: const CardUser(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
