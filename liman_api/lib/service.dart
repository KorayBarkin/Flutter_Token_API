import 'dart:convert';
import 'package:http/http.dart' as http;
import './datamodel.dart';
import './api_constants.dart';
import './main.dart';

class Service {
  Future<DataModel> fetchData() async {
    /// burada [await] ile [http.get] nesnesinin çalışmasını bekleyip
    /// [response] değişkenine attık
    final http.Response response = await http.get(
      /// [Uri.encodeFull] ile adreste çıkabilecek (!#$&'()*+,-./:;=?@_~)
      /// gibi karakter hatalarının önüne geçiyoruz.
      Uri.encodeFull(ApiConstants.API_LINK),

      headers: {
        "Authorization": "Bearer ${ApiConstants.TOKEN_VALUE}",
      },
    );

    if (response.statusCode == 200) {
      ///  [fetchGets()] yöntemi [ApiConstants.API_LİNK]‘de tanımlanan
      /// API endpoint’i çağırdık ve response.body içinde JSON string aldık.
      /// Şimdide conversion yapabilmesi için [FromJson()]’a gönderiyoruz.

      final _jsonResponse = DataModel.fromJson(jsonDecode(response.body));
      return _jsonResponse;
    } else {
      throw Exception(
        "İstek durumu başarısız oldu: ${response.statusCode}",
      );
    }
  }
}
