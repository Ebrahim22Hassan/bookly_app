import 'package:bookly/features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/book_entity.dart';
part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.fetchSimilarBooksUseCase)
      : super(SimilarBooksInitial());

  //final HomeRepo homeRepo;
  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;
  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    //var result = await homeRepo.fetchSimilarBooks(category: category);
    var result = await fetchSimilarBooksUseCase.call();
    result.fold((failure) {
      emit(SimilarBooksFailure(failure.errorMessage));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
