
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../entities/number_trivia.dart';
import '../repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia {

  const GetConcreteNumberTrivia(this.repository);

  final NumberTriviaRepository? repository;

  Future<Either<Failure?, NumberTrivia?>?> execute({
    @required int? number,
  }) async {

    return await repository?.getConcreteNumberTrivia(number);
  }
}