import 'dart:convert';

import 'package:a05_api_study/model/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final List<WebtoonModel> toons = [];
  final String baseUrl = 'https://webtoon-crawler.nomadcoders.workers.dev';
  final String today = 'today';

  getTodayToons() async {
    final url = Uri.parse('$baseUrl/$today');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final webtoons = jsonDecode(response.body);

      for (var webtoon in webtoons) {
        toons.add(WebtoonModel.jsonParse(webtoon));
      }
    }

    for (var toon in toons) {
      print(toon.id);
    }

    throw Error();
  }
}
