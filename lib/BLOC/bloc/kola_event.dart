part of 'kola_bloc.dart';

@immutable
sealed class KolaEvent {}

class FieldChangedEvent extends KolaEvent{

  final String? name;
  final String? reciever;
  final String? amount;
  final String? narration;
  final String? pin;

  FieldChangedEvent(
    {
    this.name,
    this.reciever, 
    this.amount, 
    this.narration,
    this.pin, 
  });
}

class SubmitTransactionEvent extends KolaEvent {}

class ResetMessagesEvent extends KolaEvent {}
