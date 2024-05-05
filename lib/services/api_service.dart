import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/web.dart';
import 'package:webtoon/models/webtoon_model.dart';

class ApiService {
  List<WebToonModel> webtoonInstances = [];

  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";
  var logger = Logger();

  Future<List<WebToonModel>> getTodaysToons() async {
    // await을 사용하려면 async로 비동기 함수임을 설정해줘야 함.
    final url = Uri.parse('$baseUrl/$today');

    // 해당 url로 get 요청
    // 반환 타입 Future. Future는 미래에 받을 값의 타입을 알려줌.
    // await를 통해서 비동기 프로그래밍을 구현함. await은 asynchronous function(비동기 함수) 내에서만 사용 가능하다.
    // = API 요청이 처리돼서 응답을 반환할 때까지 기다림.
    final response = await http.get(url);

    // Http status OK
    if (response.statusCode == 200) {
      final body = response.body;

      final List<dynamic> webtoons = jsonDecode(body);
      for (var w in webtoons) {
        var webtoon = WebToonModel.fromJson(w);
        webtoonInstances.add(webtoon);

        print("${webtoon.id} ${webtoon.title}");
      }

      return webtoonInstances;
    }

    logger.w("Response Error!");
    throw Error();
  }
}
