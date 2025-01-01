import 'package:dartz/dartz.dart';
import '../Remote/Sources_Response/Source.dart';

abstract class SourcesRepo {
  Future<Either<List<Source>, String>> getSources(String category);
}
