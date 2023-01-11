import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccessful,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccessful();
      break;
    case 201:
      onSuccessful();
      break;
    case 400:
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Bad Request'),
        ),
      );
      break;
    case 500:
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Internal Server Error'),
        ),
      );
      break;
    default:
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Unknown Error'),
        ),
      );
  }
}
