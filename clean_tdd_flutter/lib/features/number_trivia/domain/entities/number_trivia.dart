import 'package:equatable/equatable.dart';

class NumberTrivia extends Equatable {
  @override
  List<Object?> get props => [];

  final int number;
  final String text;

  const NumberTrivia({
    required this.number,
    required this.text,
  });
}
