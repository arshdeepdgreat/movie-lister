import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Movie extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  final String movietitle;

  @HiveField(2)
  final String directorname;

  Movie({required this.directorname, required this.movietitle});
}
