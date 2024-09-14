import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';

abstract class SearchLocalDataSource {
  List<BookEntity> searchBook({required String searchText});
}

class SearchLocalDataSourceImpl extends SearchLocalDataSource {
  @override
  List<BookEntity> searchBook({required String searchText}) {
    var box = Hive.box<BookEntity>(kSearchBox);
    if (!box.values.toString().contains(searchText)) {
      return [];
    }
    return box.values.toList();
  }
}
