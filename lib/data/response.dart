class LinkResponse {
  String string;
  int id;

  LinkResponse({this.id, this.string});

  LinkResponse.fromJson(Map<String, dynamic> json) {
    string = json['string'];
    id = json['id'];
  }
}