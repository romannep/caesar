
import 'package:collection/collection.dart';
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

  String getDefinition() {
    String sqlType = 'TEXT';
    switch (type) {
      case DbColumnType.Boolean:
      case DbColumnType.Integer:
        sqlType = 'INTEGER';
        break;
      default:
    }

    return '${name} ${sqlType}';
  }
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
  log('All tables $tables', 'db.debug');

  for (int i = 0; i < structure.length; i++) {
    final table = structure[i];
    final tableExist = tables.firstWhereOrNull((element) => element['name'] == table.name) != null;
    if (tableExist) {
      // check columns
      final tableInfo = await db.rawQuery(
        'pragma table_info(\'${table.name}\')',
      );
      log('Table ${table.name} : $tableInfo', 'db.debug');
      for (int ci = 0; ci < table.columns.length; ci ++) {
        final existingColumn = tableInfo.firstWhereOrNull((element) => element['name'] == table.columns[ci].name);
        if (existingColumn == null) {
          await db.execute('ALTER TABLE ${table.name} ADD COLUMN ${table.columns[ci].getDefinition()}');
          log('Created column ${table.columns[ci].name} for table ${table.name}', 'db.info');
        } else {
          // alter?
        }
      }
    } else {
      await db.execute('CREATE TABLE ${table.name}(${table.columns.map((e) => e.getDefinition()).join(', ')})');
      log('Created table ${table.name}', 'db.info');
    }
  }



}
