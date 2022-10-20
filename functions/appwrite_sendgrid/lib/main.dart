import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:sendgrid_mailer/sendgrid_mailer.dart';

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
