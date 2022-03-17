import 'dart:convert';
import 'dart:io';

import '../requests/response.dart';
import '../database/db_funcs.dart';
import '../database/sql_commands.dart';

Future update(HttpRequest request) async {
  try {
    var res = await request.first;

    var _firstDec = utf8.decode(res);
    Map<String, dynamic> _decode = jsonDecode(_firstDec);
    var response = await DbFuncs.instance.dbFunc(SqlCommands.instance.updateC, {
      "name": _decode['update']['name'],
      "email": _decode['update']['email'],
      "age": _decode['update']['age'],
      "id": _decode['update']['id']
    });
    return response.toInt() != 0 ? true.response : false.response;
  } catch (e) {
    print(e.toString());
    return false.response;
  }
}
