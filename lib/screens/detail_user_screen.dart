import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/app_colors.dart';
import '../providers/provider.dart';
import '../services/list_post_services.dart';
import '../widgets/card_publication.dart';
import '../widgets/card_user.dart';

class DetailUserScreens extends StatelessWidget {
  const DetailUserScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final providerUser = Provider.of<UserProvider>(context);
    final providerPost = Provider.of<PostProviver>(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text("Prueba de Ingreso"),
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
                child: Stack(
                  children: [
                    _ListPostsUser(
                      userId: providerUser.user.id,
                      postProviver: providerPost,
                    ),
                    if (providerPost.loading)
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ListPostsUser extends StatefulWidget {
  final int userId;
  final PostProviver postProviver;
  const _ListPostsUser({
    Key? key,
    required this.userId,
    required this.postProviver,
  }) : super(key: key);

  @override
  State<_ListPostsUser> createState() => _ListPostsUserState();
}

class _ListPostsUserState extends State<_ListPostsUser> {
  @override
  void initState() {
    super.initState();
    ListPostServices.getListPostUser(widget.userId).then((value) {
      widget.postProviver.posts = value;
      widget.postProviver.loading = false;
    }).onError((error, stackTrace) {
      widget.postProviver.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final providerPost = Provider.of<PostProviver>(context);
    return providerPost.posts.isEmpty && !providerPost.loading
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
            itemCount: providerPost.posts.length,
            itemBuilder: (context, index) {
              return CardPublication(
                post: providerPost.posts[index],
              );
            },
          );
  }
}
