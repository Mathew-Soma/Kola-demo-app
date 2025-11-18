part of 'kola_bloc.dart';
@immutable
class KolaState {
  final String name;
  final String reciever;
  final String amount;
  final String narration;
  final String pin;
  final bool isLoading;
  final String? error;
  final bool isSuccess;

  const KolaState({
    this.name = '',
    this.reciever = '',
    this.amount = '',
    this.narration = '',
    this.pin = '',
    this.isLoading = false,
    this.error,
    this.isSuccess = false,
  });

  KolaState copyWith({
    String? name,
    String? reciever,
    String? amount,
    String? narration,
    String? pin,
    bool? isLoading,
    String? error,
    bool? isSuccess, 
  }) {
    return KolaState(
      name: name ?? this.name,
      reciever: reciever ?? this.reciever,
      amount: amount ?? this.amount,
      narration: narration ?? this.narration,
      pin: pin ?? this.pin,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
