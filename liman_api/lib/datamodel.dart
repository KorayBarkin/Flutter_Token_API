class DataModel {
  int id;
  String user;
  String title;

  DataModel(int id, String user, String title) {
    this.id = id;
    this.user = user;
    this.title = title;
  }

  DataModel.fromJson(Map json) {
    id = json["id"];
    user = json["user"];
    title = json["title"];
  }

  Map toJson() {
    return {"id": id, "user": user, "title": title};
  }
}
