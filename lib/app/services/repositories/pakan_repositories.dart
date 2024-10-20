import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:jala_verification/app/services/appwrite_services.dart';

class PakanRepositories {
  Future<DocumentList> getListPakan() async {
    try {
      final result = await AppwriteServices.database.listDocuments(
        databaseId: '67134b1d00038c80e13e',
        collectionId: '67141b350003f6bf3e01',
      );
      log('Success GET List Pakan $result');
      return result;
    } catch(e) {
      log('Error GET List Pakan $e');
      rethrow;
    }
  }


  Future<Document> createOrderPakan({
    required String creatorId,
    required String location,
    required String startDate,
    required String productName,
    required String endDate,
    required int saldoSekarang,
    required int targetSaldo,
  }) async {
    try {
      final result = await AppwriteServices.database.createDocument(
          databaseId: '67134b1d00038c80e13e',
          collectionId: '67141b350003f6bf3e01',
          documentId: ID.unique(),
          data: {
            "creator_id": creatorId,
            "name" : productName,
            "saldo_sekarang": saldoSekarang,
            "target_saldo": targetSaldo,
            "location": location,
            "start_date": startDate,
            "end_date": endDate,
          });
      log('Success CREATE Pakan $result');
      return result;
    } catch (e) {
      log('Error CREATE Pakan $e');
      rethrow;
    }
  }


  Future<Document> updateOrderPakan({
    required String orderId,
    required int saldoSekarang,
  }) async {
    try {
      final result = await AppwriteServices.database.updateDocument(
          databaseId: '67134b1d00038c80e13e',
          collectionId: '67141b350003f6bf3e01',
          documentId: orderId,
          data: {
            "saldo_sekarang": saldoSekarang,
          });
      log('Success UPDATE Pakan $result');
      return result;
    } catch (e) {
      log('Error UPDATE Pakan $e');
      rethrow;
    }
  }
}
