import 'package:bookly/Features/search/domain/use_cases/search_book_use_case.dart';
import 'package:bookly/Features/search/presentation/manger/cubit/search_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBooksCubit extends Cubit<SearchBookState> {
  SearchBooksCubit(this.searchBooksUseCase) : super(SearchBookInitial());
  final SearchBooksUseCase searchBooksUseCase;
  Future<void> searchBooks({required String searchText}) async {
    emit(SearchBookLoading());

    var result = await searchBooksUseCase.call(searchText);
    result.fold((failure) {
      emit(SearchBookFailure(failure.message));
    }, (books) {
      emit(SearchBookSuccess(books));
    });
  }
}
