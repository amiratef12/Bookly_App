import 'package:bookly/Features/home/presentation/views/widgets/newest_books_list_view_item.dart';
import 'package:bookly/Features/search/presentation/manger/cubit/search_book_cubit.dart';
import 'package:bookly/Features/search/presentation/manger/cubit/search_book_state.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBookState>(
        builder: (context, state) {
      if (state is SearchBookSuccess) {
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: state.books.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: NewestBooksListViewItem(
                bookEntity: state.books[index],
              ),
            );
          },
        );
      } else if (state is SearchBookFailure) {
        return Text(state.errMessage);
      } else if (state is SearchBookInitial) {
        return Text(
          'Please enter book name or category to search',
          style: Styles.textStyle20.copyWith(
            fontSize: 23,
            color: Colors.white.withOpacity(0.7),
          ),
          textAlign: TextAlign.center,
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
