import 'package:test/test.dart';

import '../../bin/database/db_funcs.dart';
import '../../bin/database/sql_commands.dart';

void main() {
  test("connect", () async {
    var res = await DbFuncs.instance.connect();
    expect(res, isNotNull);
  });

  test('getAllUser', () async {
    var _res = await DbFuncs.instance.dbFunc(
      SqlCommands.instance.getAll,
      {},
      willReturn: true,
    );
    expect(_res, isList);
  });
  test("update", () async {
    var _res = await DbFuncs.instance
        .dbFunc(SqlCommands.instance.updateC, {"name": "update", "email": "update@.com", "age": 100, "id": 1});
    expect(_res, isNot(0));
  });
  test('insert', () async {
    var _res = await DbFuncs.instance
        .dbFunc(SqlCommands.instance.insert, {"name": "insert", "email": "insert@.com", "age": 22});
    expect(_res, isNot(0));
  });

  test('delete', () async {
    var _res = await DbFuncs.instance.dbFunc(SqlCommands.instance.delete, {"id": 1});
    expect(_res, isNot(0));
  });
}
