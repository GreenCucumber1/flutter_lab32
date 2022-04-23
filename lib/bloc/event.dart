import 'package:equatable/equatable.dart';

abstract class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object> get props => [];
}

class LoadDataEvent extends CharactersEvent {
  final String url1;
  final String url2;

  const LoadDataEvent({required this.url1,required this.url2,});
}
