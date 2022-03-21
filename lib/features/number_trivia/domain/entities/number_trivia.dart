
// TODO: datatypes are text<String>, number<int>, found<bool>, and type<String>

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// Gets data from the NumberCreator repository
class NumberTrivia extends Equatable {

  const NumberTrivia({
    @required this.text,
    @required this.number,
  });

  final String? text;
  final int? number;

  @override
  List<Object?> get props => [text, number];

}
