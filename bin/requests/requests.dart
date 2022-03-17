import 'dart:io';

import 'add.dart';
import 'delete.dart';
import 'get_all.dart';
import 'update.dart';

Future startResponse(HttpRequest req) async {
  try {
    req.response.headers.contentType = ContentType.json;
    req.response.headers.add(
      'Access-Control-Allow-Origin',
      '*',
      preserveHeaderCase: true,
    );
    print(req.method + ' ' + req.requestedUri.toString());
    if (req.method == 'GET') {
      switch (req.requestedUri.pathSegments.last) {
        case ('getAll'):
          return await getAll(req);
        default:
          req.response.statusCode = HttpStatus.badRequest;
      }
    } else if (req.method == 'POST') {
      switch (req.requestedUri.pathSegments.last) {
        case ('add'):
          return await add(req);
        case ('update'):
          return await update(req);
        default:
          req.response.statusCode = HttpStatus.badRequest;
      }
    } else if (req.method == 'DELETE') {
      switch (req.requestedUri.pathSegments.last) {
        case ('delete'):
          return await delete(req);
        default:
          req.response.statusCode = HttpStatus.badRequest;
      }
    }
  } catch (e) {
    print('Something went wrong: $e');
    req.response.statusCode = HttpStatus.internalServerError;
  }
}
