import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../Remote/Sources_Response/Source.dart';
import '../../repository/sourcesRepo.dart';
import '../dataSource/SourcesDao.dart';

@Injectable(as: SourcesRepo)
class SourcesRepoImp extends SourcesRepo {
  final SourcesDao sourcesDao;

  @factoryMethod
  SourcesRepoImp(this.sourcesDao);

  @override
  Future<Either<List<Source>, String>> getSources(String category) {
    return sourcesDao.getSources(category);
  }
}
