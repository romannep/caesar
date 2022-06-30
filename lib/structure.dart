import 'package:caesar/db/structure.dart';

final structure = [
  DbTable(name: 'test', columns: [
    DbColumn(name: 'col1', type: DbColumnType.Date),
    DbColumn(name: 'col2', type: DbColumnType.Boolean),
  ]),
];
