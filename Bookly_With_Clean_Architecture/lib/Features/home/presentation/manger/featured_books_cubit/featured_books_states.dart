import 'package:bookly/Features/home/domain/entities/book_entity.dart';

abstract class FeaturedBooksStates {}

class FeaturedBooksInitial extends FeaturedBooksStates {}

class FeaturedBooksLoading extends FeaturedBooksStates {}

class FeaturedBooksPaginationLoading extends FeaturedBooksStates {}

class FeaturedBooksPaginationFailure extends FeaturedBooksStates {
  final String errMessage;

  FeaturedBooksPaginationFailure(this.errMessage);
}

class FeaturedBooksSuccess extends FeaturedBooksStates {
  final List<BookEntity> books;

  FeaturedBooksSuccess(this.books);
}

class FeaturedBooksFailure extends FeaturedBooksStates {
  final String errMessage;

  FeaturedBooksFailure(this.errMessage);
}
