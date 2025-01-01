import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../Remote/Sources_Response/Source.dart';
import '../../Remote/api_manager.dart';
import '../dataSource/SourcesDao.dart';

@Injectable(as: SourcesDao)
class SourcesApiDaoImp extends SourcesDao {
  final ApiManager apiManager;

  @factoryMethod
  SourcesApiDaoImp(this.apiManager);

  @override
  Future<Either<List<Source>, String>> getSources(String category) async {
    final response = await apiManager.getSources(category);
    if (response?.status == "error") {
      return Right(response?.message ?? "Unknown error occurred.");
    }
    return Left(response?.sources ?? []);
  }
}
