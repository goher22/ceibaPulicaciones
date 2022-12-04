import 'package:flutter/material.dart';

class CardUser extends StatelessWidget {
  const CardUser({super.key});

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
            Text("Nombre"),
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
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
