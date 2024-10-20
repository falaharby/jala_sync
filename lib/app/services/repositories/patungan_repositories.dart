import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:jala_verification/app/services/appwrite_services.dart';

class PatunganRepositories {
  Future<DocumentList> getPatunganByIdOrder(String orderId) async {
    try {
      final result = await AppwriteServices.database.listDocuments(
        databaseId: '67134b1d00038c80e13e',
        collectionId: '671448a000308e3576d7',
        queries: [
          Query.equal('order_id', orderId)
        ]
      );
      log('Success GET List Patungan $result');
      return result;
    } catch(e) {
      log('Error GET List Patungan $e');
      rethrow;
    }
  }

  Future<Document> createPatungan({
    required String userId,
    required String orderId,
    required String userName,
    required int total,
  }) async {
    try {
      final result = await AppwriteServices.database.createDocument(
          databaseId: '67134b1d00038c80e13e',
          collectionId: '671448a000308e3576d7',
          documentId: ID.unique(),
          data: {
            "user_id" : userId,
            "order_id" : orderId,
            "user_name" : userName,
            "total" : total,
          });
      log('Success CREATE Patungan $result');
      return result;
    } catch (e) {
      log('Error CREATE Patungan $e');
      rethrow;
    }
  }
}
