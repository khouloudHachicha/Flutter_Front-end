import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import '../data/AppUrl.dart';
import '../data/Models/Facture.dart';

class FactureService extends GetxService {

  Dio dio = Dio(BaseOptions());
  List<Facture> factures = [];


  Future<List<Facture>> getFacture() async {
    try {
      final response = await dio.get("${AppUrl.baseUrl}${AppUrl.facture}/factures");
      if (response.statusCode == 200) {
        final jsonData = response.data as List;
        return jsonData.map((userJson) => Facture(
          num: userJson['num'],
          date: userJson['date'],
          client: userJson['client'],
          vendeur: userJson['vendeur'],
          montant: userJson['montant'],
        )).toList();
      } else {
        throw Exception('Failed to load invoice list');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to invoice list');
    }
  }
}