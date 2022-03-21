
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

  GetConcreteNumberTrivia use_case;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    use_case = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  const tNumber = 1;
  const tTrivia = 'This is a test trivia text';

  const tNumberTrivia = NumberTrivia(
    text  : tTrivia,
    number: tNumber,
  );

  test(
    'should get trivia text for the number from the repository',
    () async {
  
      when(mockNumberTriviaRepository.getRandomNumberTrivia(any))
        .thenAnswer((_) async => Right(tNumberTrivia));
  
      // todo: act
  
      // todo: assert
    },
  );
}
