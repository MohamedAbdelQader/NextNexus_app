import 'package:dartz/dartz.dart';
import '../../Remote/Sources_Response/Source.dart';

abstract class SourcesDao {
  Future<Either<List<Source>, String>> getSources(String category);
}
