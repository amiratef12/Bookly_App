import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/functions/save_search_books.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> searchBook({required String searchText});
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> searchBook({required String searchText}) async {
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=$searchText');
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    saveSearchBooksData(books, kSearchBox);
    return books;
  }
}
