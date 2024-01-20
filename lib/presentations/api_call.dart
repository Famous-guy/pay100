import 'dart:convert';

import 'package:http/http.dart' as http;
class AppiCall {
  static Future makePayment() async {
    
    try {
          var headers = {
  'api-key': 'LIVE;PK;eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBJZCI6IjY1OTlhNGY0NTU2MDMyMDAyYjJiNTFjZSIsInVzZXJJZCI6IjY1OTlhNGY0NTU2MDMyMDAyYjJiNTFjOSIsImlhdCI6MTcwNDU2ODA1Mn0.s4Cb2vUgyTeYhseZtMkqAlt8TE4nu2an_PTOA8ZSlwE',
  "Content-Type":"application/json"
};
  var url = Uri.parse("https://api.100pay.co/api/v1/pay/charge");
  var response = await http.post(url,headers: headers,body: jsonEncode(
     {
      "ref_id": "012232",
      "customer": {
        "user_id": "111",
        "name": "Brainy Josh",
        "phone": "80123456789",
        "email": "user@site.com"
      },
      "billing": {
        "description": "MY TEST PAYMENT",
        "amount": "10000",
        "country": "NG",
        "currency": "NGN",
        "vat": "10",
        "pricing_type": "fixed"
      },
      "metadata": {
        "is_approved": "yes"
      },
      "call_back_url": "https://api.100pay.co/api/v1/pay/crypto/payment/65ab782a25c0b2003e84d4fc",
      "userId": "6143bfb7fe85e0020bf243f9",
      "charge_source": "api"
    }
  ));
  print(response.body);
  
  if (response.statusCode.toString()[0]=="2") {
    return response.body;
  } else {
    throw response.reasonPhrase!;
  }
} on Exception catch ( e) {
  throw e.toString();
}
  }
}