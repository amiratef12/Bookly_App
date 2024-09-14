import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/search/data/data_sources/search_local_data_source.dart';
import 'package:bookly/Features/search/data/data_sources/search_remote_data_source.dart';
import 'package:bookly/Features/search/domain/repos/search_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;
  final SearchLocalDataSource searchLocalDataSource;

  SearchRepoImpl(this.searchRemoteDataSource, this.searchLocalDataSource);
  @override
  Future<Either<Failure, List<BookEntity>>> searchBook(
      {required String searchText}) async {
    try {
      var booksList = searchLocalDataSource.searchBook(searchText: searchText);
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      var books =
          await searchRemoteDataSource.searchBook(searchText: searchText);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
