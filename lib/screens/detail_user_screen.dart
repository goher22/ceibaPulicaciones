import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/users_provider.dart';
import '../widgets/card_publication.dart';
import '../widgets/card_user.dart';

class DetailUserScreens extends StatelessWidget {
  const DetailUserScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final providerUser = Provider.of<UserProvider>(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text("Prueba de Ingreso"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.02,
                ),
                child: CardUser(
                  user: providerUser.user,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return CardPublication();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
