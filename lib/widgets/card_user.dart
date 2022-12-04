import 'package:flutter/material.dart';

import '../helpers/app_router.dart';

class CardUser extends StatelessWidget {
  final bool btnPublicacion;
  const CardUser({super.key, this.btnPublicacion = false});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Nombre",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                Text("Telefono"),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                Text("Correo"),
              ],
            ),
            if (btnPublicacion)
              Align(
                alignment: Alignment.bottomRight,
                child: MaterialButton(
                  padding: EdgeInsets.zero,
                  child: Text(
                    "VER PUBLICACIONES",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouter.routerDetailUser);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
