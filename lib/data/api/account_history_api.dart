import 'package:bind/data/models/api_operation.dart';
import 'package:dio/dio.dart';

class AccountHistoryApi {
  Future<List<ApiOperation>> getHistory() async {
    var response = _fakeData('');
    return _mapHistory(await response);
  }

  List<ApiOperation> _mapHistory(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
      case 204:
        var history = response.data as List;
        return history
            .map((e) => ApiOperation.fromJson(e as Map<String, dynamic>))
            .toList();
      default:
        throw _exception(response);
    }
  }

  Exception _exception(Response response) {
    switch (response.statusCode) {
      default:
        throw Exception(response.statusCode);
    }
  }

  Future<Response<List<dynamic>>> _fakeData(String path) async {
    var questions = [
      {
        'id': 0,
        'name': 'Carrefour',
        'date': '2022-06-27T08:23:00.000Z',
        'sumInCent': 50031,
        'currency': 'usd',
      },
      {
        'id': 1,
        'name': 'Louis Vuitton',
        'date': '2022-06-27T08:23:00.000Z',
        'sumInCent': 50031,
        'currency': 'usd',
      },
      {
        'id': 2,
        'name': 'Nike',
        'date': '2022-06-28T08:23:00.000Z',
        'sumInCent': 50031,
        'currency': 'usd',
      },
      {
        'id': 3,
        'name': 'Virgin Megastore',
        'date': '2022-06-28T08:23:00.000Z',
        'sumInCent': 50031,
        'currency': 'usd',
      },
      {
        'id': 4,
        'name': 'Dave Winklevoss',
        'date': '2022-06-29T08:23:00.000Z',
        'sumInCent': 30000,
        'currency': 'usd',
      },
      {
        'id': 5,
        'name': 'Starbucks',
        'date': '2022-06-29T08:23:00.000Z',
        'sumInCent': 5531,
        'currency': 'usd',
      },
      {
        'id': 6,
        'name': 'McDonalds',
        'date': '2022-06-29T08:23:00.000Z',
        'sumInCent': 5531,
        'currency': 'usd',
      },
      {
        'id': 7,
        'name': 'Darren Hodgkin',
        'date': '2022-06-29T08:23:00.000Z',
        'sumInCent': 13031,
        'currency': 'usd',
      },
      {
        'id': 8,
        'name': 'Pret A Manger',
        'date': '2022-06-29T08:23:00.000Z',
        'sumInCent': 5531,
        'currency': 'usd',
      },
    ];
    return Future.value(
      Response(
        data: questions,
        statusCode: 200,
        requestOptions: RequestOptions(path: path),
      ),
    );
  }
}
