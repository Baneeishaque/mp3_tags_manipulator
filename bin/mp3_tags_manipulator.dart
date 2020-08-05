import 'dart:io';

import 'package:mp3_tags_manipulator/mp3_tags_manipulator.dart'
    as mp3_tags_manipulator;
import 'package:mp3_tags_manipulator/fileUtils.dart' as file_utils;
import 'package:path/path.dart';
import 'package:mp3_tags_manipulator/stringUtils.dart' as string_utils;

Future<void> main(List<String> arguments) async {
//  print('Hello world: ${mp3_tags_manipulator.calculate()}!');
  await process('Rebel of the Underground.mp3');
}

Future<void> process(String fileName) async {
  var mp3File = File(file_utils.getFilePathOfScriptAdjacentFile(fileName));
  var mp3FileCopy = await mp3File
      .copy(withoutExtension(mp3File.path) + '_copy' + extension(fileName));

  var tags = await mp3_tags_manipulator.readTagsFromFile(mp3File);
  print('Tags ' + tags.toString());

  tags.forEach((tag) {
    print('\nTag : ' + tag.toString());

    var tagContents = tag.tags;
    print('Tag Contents : ' + tagContents.toString());

    var artist = tagContents['artist'].toString();
    print('Artist : ' + artist);

    if (artist.contains('/')) {
      artist = artist.replaceFirst('/', ' feat. ');
      artist = artist.replaceAll('/', ', ');
      artist = string_utils.replaceLastOccurence(artist, ', ', ' & ');
      print('\nArtist : ' + artist);

      tagContents.update('artist', (value) => artist);
      print('Tag Contents : ' + tagContents.toString());

      tag.tags = tagContents;
      print('Tag : ' + tag.toString());
    }
  });
  print('\nTags ' + tags.toString());
  await mp3_tags_manipulator.writeTags(mp3FileCopy, tags);
}
