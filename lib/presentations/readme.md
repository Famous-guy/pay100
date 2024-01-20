Future<void> makeApiCall() async {
  var headers = {
    'Content-Type': 'application/json',
    'api-key': 'LIVE;PK;eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBJZCI6IjYyZWU1ZGJmYjAyOWI3MDAyZDViNzQ1MyIsInVzZXJJZCI6IjYyOGIyMjhiMTlhYzUyMDAyYzU4ODUyNSIsImlhdCI6MTY1OTc4ODczNX0.wGyE9qfgsmsOLVTQQ9GrTFZ28moPB31I2eZw7uwd7Gw',
  };

  // Your POST request body data
  var postRequestBody = json.encode({
    "amount": 1000,
    "currency": "NGN",
    "email": "example@example.com",
    "tx_ref": "hooli-tx-1920bbtytty",
    "redirect_url": "https://webhook.site/#!/8d244d63-5c14-4f99-a3f5-3e416aae6c8c",
    "payment_options": "card"
  });

  // POST request
  var postResponse = await http.post(
    Uri.parse('https://api.100pay.co/api/v1/pay/charge'),
    headers: headers,
    body: postRequestBody,
  );

  // Check if POST request is successful
  if (postResponse.statusCode == 200) {
    print('POST Request successful');

    // Extract the response JSON
    var responseData = json.decode(postResponse.body);

    // Assuming your response contains a 'charge_id'
    var chargeId = responseData['65ab782a25c0b2003e84d4fc'];

    // GET request with the chargeId
    var getResponse = await http.get(
      Uri.parse('https://api.100pay.co/api/v1/pay/charge/$chargeId'),
      headers: headers,
    );

    // Check if GET request is successful
    if (getResponse.statusCode == 200) {
      print('GET Request successful');
      print(getResponse.body);
    } else {
      print('Error with GET request: ${getResponse.statusCode}');
    }
  } else {
    print('Error with POST request: ${postResponse.statusCode}');
  }
}
