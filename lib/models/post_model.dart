class PostModel {
  PostModel({
    required this.id,
    required this.title,
    required this.body,
  });
  int id;
  String title;
  String body;

  String get description => body.replaceAll("|", "\n");

  factory PostModel.clone(PostModel post) => PostModel(
        id: post.id,
        title: post.title,
        body: post.body,
      );

  factory PostModel.fromMap(Map<String, dynamic> json) => PostModel(
        id: json["id"],
        title: json["title"] ?? "",
        body: json["body"] ?? "",
      );
}
