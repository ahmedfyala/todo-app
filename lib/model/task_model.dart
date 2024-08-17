class TaskModel {
  String id;
  String userId;
  String title;
  String desc;
  int date;
  bool isDone;

  TaskModel({
    this.id = "",
    required this.userId,
    required this.title,
    required this.desc,
    required this.date,
    this.isDone = false,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json["id"],
      userId: json["userId"],
      title: json["title"],
      desc: json["desc"],
      date: json["date"],
      isDone: json["isDone"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userId": userId,
      "title": title,
      "desc": desc,
      "date": date,
      "isDone": isDone,
    };
  }

  //  TaskModel.fromJson(Map<String, dynamic> json)
  //   :this(
  //     id: json["id"],
  //     title: json["title"],
  //     desc: json["desc"],
  //     date: json["date"],
  //     isDone: json["isDone"],
  //   );
}
