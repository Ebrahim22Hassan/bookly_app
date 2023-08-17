import 'package:bookly/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/book_entity.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());

  //final HomeRepo homeRepo;
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks({int pageNum = 0}) async {
    if (pageNum == 0) {
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksPaginationLoading());
    }
    //var result = await homeRepo.fetchNewestBooks();
    var result = await fetchNewestBooksUseCase.call(pageNum);
    result.fold((failure) {
      if (pageNum == 0) {
        emit(NewestBooksFailure(failure.errorMessage));
      } else {
        emit(NewestBooksPaginationFailure(failure.errorMessage));
      }
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
