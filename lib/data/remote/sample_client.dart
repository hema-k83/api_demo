import 'package:http/http.dart';

enum HttpMethod { delete, get, head, post, put }

class SampleClient {
  Future<Response?> call(HttpMethod methodType, String url,
      {Object? params, Map<String, String>? headers, Object? body}) async {
    Response? response;
    Uri requestUri = Uri.parse(url);
    if (methodType == HttpMethod.get) {
      try {
        response = await get(
          requestUri,
          headers: headers ?? {},
        );
      } catch (error) {
        print(error);
      }
    } else if (methodType == HttpMethod.post) {
      try {
        response = await post(requestUri, headers: headers ?? {}, body: body ?? {});
      } catch (error) {
        print(error);
      }
    }
    return response;
  }
}
