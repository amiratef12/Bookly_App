import 'package:bookly/Features/home/domain/entities/book_entity.dart';

abstract class SearchBookState {}

class SearchBookInitial extends SearchBookState {}

class SearchBookLoading extends SearchBookState {}

class SearchBookSuccess extends SearchBookState {
  final List<BookEntity> books;

  SearchBookSuccess(this.books);
}

class SearchBookFailure extends SearchBookState {
  final String errMessage;

  SearchBookFailure(this.errMessage);
}
