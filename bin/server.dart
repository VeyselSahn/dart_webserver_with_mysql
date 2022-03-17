import 'dart:io';
import 'requests/requests.dart';

void main() async {
  late final HttpServer server;
  try {
    server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8000);
  } catch (e) {
    print("Couldn't bind to port 4044: $e");
    exit(-1);
  }
  print('Listening on http://${server.address.address}:${server.port}/');

  await for (HttpRequest req in server) {
    var response = await startResponse(req);
    req.response.write(response);
    await req.response.flush();
    await req.response.close();
  }
}
