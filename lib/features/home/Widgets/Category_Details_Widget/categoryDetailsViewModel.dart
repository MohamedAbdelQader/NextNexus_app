import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../repository/sourcesRepo.dart';
import '../../../../Remote/Sources_Response/Source.dart';

class CategoryDetailsViewModel extends Cubit<CategoryDetailsStates> {
  final SourcesRepo repo;

  CategoryDetailsViewModel(this.repo) : super(LoadingState());

  Future<void> getSources(String category) async {
    try {
      emit(LoadingState());
      final result = await repo.getSources(category);
      result.fold(
            (sources) => emit(SuccessState(sources)),
            (error) => emit(ErrorState(error)),
      );
    } catch (error) {
      emit(ErrorState(error.toString()));
    }
  }
}

abstract class CategoryDetailsStates {}

class LoadingState extends CategoryDetailsStates {}

class ErrorState extends CategoryDetailsStates {
  final String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends CategoryDetailsStates {
  final List<Source> sources;
  SuccessState(this.sources);
}
