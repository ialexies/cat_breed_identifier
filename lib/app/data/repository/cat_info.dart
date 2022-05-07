import 'package:get/get.dart';

class RepoCatInfo extends GetConnect {
  Future<Response> getUser(int id) =>
      get('https://api.thecatapi.com/v1/breeds?limit=100&page=0');
  // Post request

  getCatInfo() async {
    // Map<String, String> qParams = {
    //   // 'vs_currency': '$selectedCurrency',
    //   // 'order': 'market_cap_desc',
    //   // 'per_page': '1000',
    //   // 'page': '1',
    //   // 'sparkline': 'false',
    //   'x-api-key': 'ade0757a-9798-4db0-b406-2091417bcf90'
    // };
    // var api = "https://api.thecatapi.com/v1/breeds?limit=100&page=0";

    // final uri = Uri.https(
    //   'https://api.thecatapi.com',
    //   'v1/breeds?limit=100&page=0',
    //   qParams,
    // );

    // String api = '${dotenv.env['SERVER_ADDRESS']}/chicktok/public/api/products';
    String api = 'https://api.thecatapi.com/v1/breeds?limit=100&page=0';

    final response = await get(api);
    if (response.hasError) {
      return response;
    } else {
      // print('good api in getproducts provider');
      return response;
    }
  }
}
