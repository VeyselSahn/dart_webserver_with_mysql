import 'dart:io';

import 'package:mysql_client/mysql_client.dart';

import '../database/db_funcs.dart';
import '../database/sql_commands.dart';

Future getAll(HttpRequest request) async {
  List<ResultSetRow> response = await DbFuncs.instance.dbFunc(SqlCommands.instance.getAll, {}, willReturn: true);
  List<Map> _response = [];
  for (var item in response) {
    var _con = {
      "name": item.colByName("name"),
      "email": item.colByName("email"),
      "age": item.colByName("age"),
      "id": item.colByName("id") ?? 0
    };
    _response.add(_con);
  }
  return _response;
}
