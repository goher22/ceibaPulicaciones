import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/app_router.dart';
import '../models/user_model.dart';
import '../providers/provider.dart';

class CardUser extends StatelessWidget {
  final UserModel user;
  final bool btnPublicacion;
  const CardUser({super.key, this.btnPublicacion = false, required this.user});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final providerUser = Provider.of<UserProvider>(context);
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
              user.name,
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
                Text(user.phone),
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
                Text(user.email),
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
                    providerUser.user = UserModel.clone(user);
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
