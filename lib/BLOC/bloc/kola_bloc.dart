import 'package:bloc/bloc.dart';
import 'package:kolademo/data/repository.dart';
import 'package:meta/meta.dart';

part 'kola_event.dart';
part 'kola_state.dart';

class KolaBloc extends Bloc<KolaEvent, KolaState> {
  final MobileRepository repository; 

  KolaBloc({required this.repository}) : super(const KolaState()) {
    on<FieldChangedEvent>((event, emit) {
      emit(state.copyWith(
        name: event.name ?? state.name,
        reciever: event.reciever ?? state.reciever,
        amount: event.amount ?? state.amount,
        narration: event.narration ?? state.narration,
        pin: event.pin ?? state.pin,
      ));
    });

    on<ResetMessagesEvent>((event, emit) {
      emit(state.copyWith(isSuccess: false, error: null));
    });


    // Handle submit
    on<SubmitTransactionEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true, error: null, isSuccess: false));
      try {
        await repository.saveTransaction(
          name: state.name,
          reciever: state.reciever,
          amount: state.amount,
          narration: state.narration,
          pin: state.pin,
        );
        emit(state.copyWith(isLoading: false, isSuccess: true));
      } catch (e) {
        emit(state.copyWith(isLoading: false, error: e.toString()));
      }
    });
  }
}
