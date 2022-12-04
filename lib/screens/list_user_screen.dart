import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/app_colors.dart';
import '../providers/users_provider.dart';
import '../services/list_user_services.dart';
import '../widgets/card_user.dart';

class ListUserScreen extends StatelessWidget {
  const ListUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);
    return Stack(
      children: [
        SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: const Text("Prueba de Ingreso"),
            ),
            body: _BodyUsers(
              userProvider: provider,
            ),
          ),
        ),
        if (provider.loading)
          Container(
            color: AppColor.blackOpacity,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}

class _BodyUsers extends StatefulWidget {
  final UserProvider userProvider;
  const _BodyUsers({Key? key, required this.userProvider}) : super(key: key);

  @override
  State<_BodyUsers> createState() => _BodyUsersState();
}

class _BodyUsersState extends State<_BodyUsers> {
  @override
  void initState() {
    super.initState();
    //widget.userProvider.loading = true;
    ListUserServices.getListUser().then((users) {
      widget.userProvider.users = users;
      widget.userProvider.loading = false;
    }).onError((error, stackTrace) {
      widget.userProvider.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final providerUser = Provider.of<UserProvider>(context);
    final size = MediaQuery.of(context).size;
    return Padding(
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
            onChanged: (value) {
              providerUser.shearchUser = value;
            },
          ),
          Expanded(
            child: providerUser.users.isEmpty && !providerUser.loading
                ? Center(
                    child: Text(
                      "List is empty",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: providerUser.users.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(top: size.height * 0.03),
                        child: CardUser(
                          btnPublicacion: true,
                          user: providerUser.users[index],
                        ),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
