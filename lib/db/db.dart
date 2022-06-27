

import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../log/log.dart';

const APP_FOLDER = 'Caesar';
const DB_FILENAME = 'caesar.db';

class Db {
  static final instance = Db();

  late Database db;

  init() async {
    Map<String, String> envVars = Platform.environment;
    log('User homedir: ${envVars['UserProfile']}');
    final path= Directory('${envVars['UserProfile']}/$APP_FOLDER');
    if ((await path.exists())){
      log('Path exist');
    }else{
      await path.create();
      log('Path created');
    }
    final dbPath = '${envVars['UserProfile']}/$APP_FOLDER/$DB_FILENAME';
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    db = await openDatabase(
      dbPath,
      version: 1,
    );
    log('Db open success');
  }

  close() async {
    await db.close();
  }
}
