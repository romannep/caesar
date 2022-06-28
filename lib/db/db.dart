

import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../log/log.dart';

class Db {

  static late Database db;

  static init({
    required appFolder,
    required dbFilename,
  }) async {
    Map<String, String> envVars = Platform.environment;
    log('User homedir: ${envVars['UserProfile']}');
    final path= Directory('${envVars['UserProfile']}/$appFolder');
    if ((await path.exists())){
      log('Path exist');
    }else{
      await path.create();
      log('Path created');
    }
    final dbPath = '${envVars['UserProfile']}/$appFolder/$dbFilename';
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    db = await openDatabase(
      dbPath,
      version: 1,
    );
    log('Db open success');
  }

  static close() async {
    await db.close();
  }
}
