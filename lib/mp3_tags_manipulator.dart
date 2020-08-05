import 'dart:io';
import 'package:dart_tags/dart_tags.dart' as dart_tags;

//int calculate() {
//  return 6 * 7;
//}

Future<List<dart_tags.Tag>> readTagsFromFilePath(String filePath) {
  return readTagsFromFile(File(filePath));
}

Future<List<dart_tags.Tag>> readTagsFromFile(File mp3File) {
  var tagProcessor = dart_tags.TagProcessor();
  return tagProcessor.getTagsFromByteArray(mp3File.readAsBytes());
}

Future<void> writeTags(File mp3File, List<dart_tags.Tag> tags) async {
  var tagProcessor = dart_tags.TagProcessor();
  var result= await tagProcessor.putTagsToByteArray(mp3File.readAsBytes(), tags);
  print('ok');
}
