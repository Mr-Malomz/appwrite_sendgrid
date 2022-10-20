import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:sendgrid_mailer/sendgrid_mailer.dart';

/*
  'req' variable has:
    'headers' - object with request headers
    'payload' - request body data as a string
    'variables' - object with function variables

  'res' variable has:
    'send(text, status: status)' - function to return text response. Status code defaults to 200
    'json(obj, status: status)' - function to return JSON response. Status code defaults to 200
  
  If an error is thrown, a response with code 500 will be returned.
*/

Future<void> start(final req, final res) async {
  Client client = Client();

  final mailer = Mailer('SENDGRID API KEY');
  final toAddress = Address('SEND TO EMAIL');
  final fromAddress = Address('SENDER EMAIL CREATED ON SENDGRID');
  final content =
      Content('text/plain', 'Appwrite Database successfully updated');
  final subject = 'Database Update Alert!';
  final personalization = Personalization([toAddress]);

  final email =
      Email([personalization], fromAddress, subject, content: [content]);
  mailer.send(email).then((result) {
    print(result);
  }).catchError((onError) {
    print('error');
  });

  res.json({
    'data': "testing emails",
  });
}
