import 'dart:convert';
import 'dart:io';

import '../database/db_funcs.dart';
import '../database/sql_commands.dart';
import 'response.dart';

Future delete(HttpRequest request) async {
  try {
    var _body = await request.first;

    var _firstDec = utf8.decode(_body);
    Map<String, dynamic> _decode = jsonDecode(_firstDec);

    var res = await DbFuncs.instance.dbFunc(SqlCommands.instance.delete, {"id": _decode['delete']['id']});
    return res.toInt() != 0 ? true.response : false.response;
  } catch (e) {
    print(e.toString());
    return false.response;
  }
}
