import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wolfiz/backend/backend.dart';
import 'package:provider/provider.dart';


import '../../app_state.dart';
import '../../totp/totp_algorithm.dart';

void SetDataAfterScanning(String qrCode, BuildContext context) {
  if (qrCode.isNotEmpty) {
    final params = qrCode
        .split('?')
        .last
        .split('&');
    String name = '';
    String email = '';
    String secretKey = '';
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
        secretKey: secretKey,
        name: name,
        email: email,
        outputQR: outputQR,
        algorithm: algorithm,
        digits: digits,
        period: period,
    );

    // String otp = Totp.generateCode(secretKey, period, digits, OtpHashAlgorithm.fromString(algorithm));
    // final appState = Provider.of<FFAppState>(context, listen: false);
    // appState.otpCode = otp;


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

