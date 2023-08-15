import 'package:bookly/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../manager/similar_books_cubit/similar_books_cubit.dart';

class SimilarBooksListViewBlocBuilder extends StatelessWidget {
  const SimilarBooksListViewBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
      if (state is SimilarBooksSuccess) {
        return SimilarBooksListView(
          books: state.books,
        );
      } else if (state is SimilarBooksFailure) {
        return CustomErrorWidget(errorMessage: state.errMessage);
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
