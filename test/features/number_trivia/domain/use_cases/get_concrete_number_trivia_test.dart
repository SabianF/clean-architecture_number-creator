
import 'package:clean_architecture/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_architecture/features/number_trivia/domain/use_cases/get_concrete_number_trivia.dart';
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
}
