import 'package:bookly/Features/home/presentation/manger/similar_books_cubit/cubit/similar_books_cubit.dart';
import 'package:bookly/Features/home/presentation/manger/similar_books_cubit/cubit/similar_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_item.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CustomBookImage(
                      image: state.books[index].image?.isNotEmpty == true
                          ? state.books[index].image!
                          : 'https://www.noor-book.com/publice/covers_cache_webp/2/5/7/1/ff4194b5ce571d651509dff529907e97.jpeg.webp',
                    ),
                  );
                }),
          );
        } else if (state is SimilarBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
