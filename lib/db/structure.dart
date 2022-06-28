
import 'package:caesar/log/log.dart';

import 'db.dart';

enum DbColumnType {
  Text,
  Integer,
  Date,
  Boolean,
}

class DbColumn {
  String name;
  DbColumnType type;

  DbColumn({
    required this.name,
    required this.type,
  });
}

class DbTable {
  String name;
  List<DbColumn> columns;

  DbTable({
    required this.name,
    required this.columns,
  });

}

migrate(List<DbTable> structure) async {
  final db = Db.db;
  final tables = await db.rawQuery('SELECT name FROM sqlite_schema');
  log('$tables');
  // final tableInfo = await db.rawQuery(
  //   'pragma table_info(\'accounts\')',
  // );
  // log('$tableInfo');

}
