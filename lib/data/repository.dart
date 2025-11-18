import 'services.dart';

class MobileRepository {
  final MobileService service;

  MobileRepository({required this.service});

  Future<void> saveTransaction({
    
    required String name,
    required String reciever,
    required String amount,
    required String narration,
    required String pin,
    }) async {
    final success = await service.saveTransaction(
      name: name,
      reciever: reciever,
      amount: amount,
      narration: narration,
      pin: pin,
      );
    
    if (!success) {
      throw Exception('Failed to save transaction');
    }
  }
}
