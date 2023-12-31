import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/data/models/BookModel.dart';
import '../../features/home/data/repos/home_repo_implementation.dart';
import '../../features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/splash/presentation/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
            create: (context) => SimilarBooksCubit(
                  FetchSimilarBooksUseCase(
                    getIt.get<HomeRepoImplementation>(),
                  ),
                ),
            child: BookDetailsView(
              bookModel: state.extra as BookModel,
            )),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
