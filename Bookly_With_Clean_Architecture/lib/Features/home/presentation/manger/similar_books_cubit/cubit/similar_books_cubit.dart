import 'package:bookly/Features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:bookly/Features/home/presentation/manger/similar_books_cubit/cubit/similar_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.fetchSimilarBooksUseCase)
      : super(SimilarBooksInitial());
  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;
  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());

    var result = await fetchSimilarBooksUseCase.call(category);
    result.fold((failure) {
      emit(SimilarBooksFailure(failure.message));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
