import 'package:flutter/material.dart';

import '../models/post_model.dart';

class CardPublication extends StatelessWidget {
  final PostModel post;
  const CardPublication({super.key, required this.post});

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
              post.title,
              textAlign: TextAlign.center,
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
              child: Text(post.description),
            ),
          ],
        ),
      ),
    );
  }
}
