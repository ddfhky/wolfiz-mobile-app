import 'package:wolfiz/backend/backend.dart';

void SetDataAfterScanning(String qrCode) {
  if (qrCode.isNotEmpty) {
    final params = qrCode
        .split('?')
        .last
        .split('&');
    String name = '';
    String email = '';
    String secretKey = '';
    String uuid = 'uuid';
    String outputQR = qrCode;
    String algorithm = '';
    int digits = 0;
    int period = 0;

    for (final param in params) {
      final parts = param.split('=');
      // key === [algorithm, SHA1]
      if (parts.length == 2) {
        final key = parts[0];
        final value = parts[1];

        if (key == 'issuer') {
          name = Uri.decodeComponent(value); //in caz de apar caractere speciale
        } else if (key == 'secret') {
          secretKey = Uri.decodeComponent(value);
        }else if (key == 'algorithm') {
          algorithm = Uri.decodeComponent(value);
      } else if (key == 'digits') {
          digits = int.parse(Uri.decodeComponent(value));
      } else if (key == 'period') {
          period = int.parse(Uri.decodeComponent(value));
      }
      }
    }

    int startIndex = qrCode.indexOf(name)+name.length+1;
    int endIndex = qrCode.indexOf('?');

    if(startIndex != -1 && endIndex != -1){
      email = qrCode.substring(startIndex, endIndex);
    }

    final accountRecordData = createAccountRecordData(
        uuid: uuid,
        secretKey: secretKey,
        name: name,
        email: email,
        outputQR: outputQR,
        algorithm: algorithm,
        digits: digits,
        period: period
    );

    final collectionReference = AccountRecord.collection;
    collectionReference.add(accountRecordData).then((value) {
      print('Added account record');
    }).catchError((error) {
      print('Error adding account record: $error');
    });
    }else if(qrCode.isEmpty) {
    throw ArgumentError('QR code is empty. Cannot add account record.');
  }

  }

