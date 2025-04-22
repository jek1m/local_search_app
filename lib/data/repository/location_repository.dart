import 'package:dio/dio.dart';
import 'package:flutter_application_1/data/model/location.dart';

class LocationRepository {
  Future<List<Location>> search(String query) async {
    final dioClient = Dio(
      BaseOptions(
        validateStatus: (status) => true,
      )
    );

    // 1.요청
    final response = await dioClient.get('https://openapi.naver.com/v1/search/local.json?query=삼성동&display=5',
    queryParameters: {
      "query": query,
      "display": 5,
      },
      options: Options(
        headers: {
        'X-Naver-Client-Id': '0Qd740v4Px_b_IHLlRdQ',
        'X-Naver-Client-Secret': 'NSF5P0gigk',
        },
      ),
    );

    // 2. 요청 성공일 때
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = response.data;
      final List<dynamic> items = data['items'];

      // 지연 메서드
      final convertedItems = items.map(
        (e) {
          return Location.fromJson(e);
        },
      ).toList();
      return convertedItems;
    }

    // 3. 요청 실패일 때 => 빈 리스트 반환
    return [];
  }
}