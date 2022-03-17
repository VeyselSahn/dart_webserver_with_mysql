import 'package:mysql_client/mysql_client.dart';
import 'constants.dart';

class DbFuncs {
  static final instance = DbFuncs();
  Future<MySQLConnection> connect() async {
    try {
      final conn = await MySQLConnection.createConnection(
        host: Constant.instance.host,
        port: Constant.instance.port,
        userName: Constant.instance.username,
        password: Constant.instance.passw,
        databaseName: Constant.instance.db, // optional
      );
      await conn.connect();
      return conn;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future dbFunc(String query, Map<String, dynamic> params, {bool? willReturn = false}) async {
    try {
      var conn = await connect();
      var result = await conn.execute(query, params);
      print('rows: ' + result.rows.toString());
      print('affected: ' + result.affectedRows.toString());
      return willReturn! ? result.rows.toList() : result.affectedRows.toInt();
    } catch (e) {
      throw Exception(e);
    }
  }
}
