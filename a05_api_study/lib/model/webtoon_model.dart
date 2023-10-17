class WebtoonModel {
  final id, title, thumb;

  WebtoonModel.jsonParse(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        thumb = json['thumb'];
}
