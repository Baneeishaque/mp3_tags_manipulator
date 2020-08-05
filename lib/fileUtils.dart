import 'dart:io';
import 'package:path/path.dart';

String getFilePathOfScriptAdjacentFile(String fileName) {
  return join(dirname(Platform.script.toFilePath()), fileName);
}
