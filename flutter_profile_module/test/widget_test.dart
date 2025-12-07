// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter_profile_module/core/api_client.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('FetchUserDataApi', () {
    test('Should return a valid user JSON for userId=1', () async {
      const userId = 1;

      // Appel réel à l'API
      final response = await FetchUserDataApi.findUserById(userId);

      // Vérification basique
      expect(response, isNotEmpty);

      // Décodage JSON
      final data = jsonDecode(response);

      // Vérifie qu'on a bien un id correspondant
      expect(data['id'], userId);

      // Vérifie qu'on a un prénom et un nom
      expect(data['first_name'], isNotEmpty);
      expect(data['last_name'], isNotEmpty);

      print('User fetched: ${data['first_name']} ${data['last_name']}');
    });
  });
}
