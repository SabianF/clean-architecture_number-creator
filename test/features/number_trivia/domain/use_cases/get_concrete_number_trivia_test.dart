
import 'package:clean_architecture/core/error/failures.dart';
import 'package:clean_architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_architecture/features/number_trivia/domain/use_cases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository
  extends Mock
  implements NumberTriviaRepository {}

// How will the use_case operate with the repository
// Pass the repository through the constructor, so that later on
// we can do dependency injection ("loose coupling") using get_it
void main() {

  GetConcreteNumberTrivia? useCase;
  MockNumberTriviaRepository? mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    useCase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  const int?    tNumber = 1;
  const String? tTrivia = 'This is a test trivia text';

  const NumberTrivia? tNumberTrivia = NumberTrivia(
    text  : tTrivia,
    number: tNumber,
  );

  test(
    'should get trivia text for the number from the repository',
    () async {
  
      when(mockNumberTriviaRepository?.getRandomNumberTrivia(tNumber))
        .thenAnswer((_) async => const Right(tNumberTrivia));
  
      final Either<Failure?, NumberTrivia?>? result = await useCase?.execute(number: tNumber);
  
      expect(result, const Right(tNumberTrivia));
      verify(mockNumberTriviaRepository?.getConcreteNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
