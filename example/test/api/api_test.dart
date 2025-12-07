

import 'package:example/core/api_client.dart';
import 'package:test/test.dart';

void testApiFunction(){
    group('FetchUserDataAPI', ()async{
    test('Should return user JSON when status 200', ()async{
      
      //test-
      
      //test - client
      final response = await FetchUserDataApi.findUserById(1);
      expect(response, isNotEmpty);
    });
  });

}