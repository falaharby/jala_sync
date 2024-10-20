import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:jala_verification/app/services/appwrite_services.dart';

class BenurRepositories {
  Future<DocumentList> getListBenur() async {
    try {
      final result = await AppwriteServices.database.listDocuments(
        databaseId: '67134b1d00038c80e13e',
        collectionId: '6713623b0023174ae1e5',
      );
      log('Success GET List Benur $result');
      return result;
    } catch(e) {
      log('Error GET List Benur $e');
      rethrow;
    }
  }

  Future createPatunganBenur() async {
    try {
      final result = await AppwriteServices.database.createDocument(
        databaseId: '67134b1d00038c80e13e',
        collectionId: '6713623b0023174ae1e5',
        documentId: ID.unique(),
        data: {
          
        }
      );
      log('Success CREATE Benur $result');
      return result;
    } catch(e) {
      log('Error CREATE Benur $e');
      rethrow;
    }
  }
}