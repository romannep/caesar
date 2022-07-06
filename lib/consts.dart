
import 'package:flutter/material.dart';

const APP_FOLDER = 'Caesar';
const DB_FILENAME = 'caesar.db';

const List<String> LOG_FILTERS = [];

const PRIMARY_COLOR_VALUE = 0xFF088596;
const PRIMARY_COLOR_DARK_VALUE = 0xFF055863;

const PRIMARY_COLOR = Color(PRIMARY_COLOR_VALUE);
const PRIMARY_COLOR_DARK = Color(PRIMARY_COLOR_DARK_VALUE);

const PRIMARY_COLOR_MATERIAL = MaterialColor(PRIMARY_COLOR_VALUE, const <int, Color>{
  50:  const Color(0xFFe0e0e0),
  100: const Color(0xFFb3b3b3),
  200: const Color(0xFF808080),
  300: const Color(0xFF4d4d4d),
  400: const Color(0xFF262626),
  500: const Color(PRIMARY_COLOR_VALUE),
  600: const Color(0xFF000000),
  700: const Color(0xFF000000),
  800: const Color(0xFF000000),
  900: const Color(0xFF000000),
},);

enum Screen {
  Desktop,
  Add,
}

