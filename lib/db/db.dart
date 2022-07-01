

import 'dart:io';

import 'package:caesar/db/structure.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../log/log.dart';

class Db {

  static late Database db;

  static init({
    required String appFolder,
    required String dbFilename,
    required List<DbTable> structure,
  }) async {
    Map<String, String> envVars = Platform.environment;
    printLog('User homedir: ${envVars['UserProfile']}', 'db.debug');
    final path= Directory('${envVars['UserProfile']}/$appFolder');
    if ((await path.exists())){
      printLog('Path exist', 'db.info');
    }else{
      await path.create();
      printLog('Path created');
    }
    final dbPath = '${envVars['UserProfile']}/$appFolder/$dbFilename';
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    db = await openDatabase(
      dbPath,
      version: 1,
    );
    printLog('Db open success', 'db.info');
    await migrate(structure);
  }

  static close() async {
    await db.close();
  }
}
