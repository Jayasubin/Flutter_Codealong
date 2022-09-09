import 'package:clean_tdd_flutter/core/errors/failures.dart';
import 'package:clean_tdd_flutter/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomTrivia();
}
