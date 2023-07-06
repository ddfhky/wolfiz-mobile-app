import 'dart:math' show pow;
import 'dart:typed_data' show Uint8List, Endian;
import 'package:crypto/crypto.dart' show Hash, Hmac, sha1, sha256, sha512;
import 'util/base32.dart' show Base32;

enum OtpHashAlgorithm {
  sha1,
  sha256,
  sha512;

  static OtpHashAlgorithm fromString(String str) {
    if (str == "SHA1") {
      return OtpHashAlgorithm.sha1;
    } else if (str == "SHA256") {
      return OtpHashAlgorithm.sha256;
    } else if (str == "SHA512") {
      return OtpHashAlgorithm.sha512;
    }
    throw Exception("Unknown algorithm");
  }
}

extension _StringOperations on OtpHashAlgorithm {
  Hash toHashFunction() {
    if (this == OtpHashAlgorithm.sha1) {
      return sha1;
    } else if (this == OtpHashAlgorithm.sha256) {
      return sha256;
    } else if (this == OtpHashAlgorithm.sha512) {
      return sha512;
    }
    throw Exception("Unknown algorithm");
  }
}

class Totp {
  static int _time = 0; // Valoarea timpului curent

  static void setTime(int time){
    _time = time;
  }

  static int getTime() {
    return _time;
  }


  /// Formats a generated [code] to make it look nice
  static String prettyValue(String code) {
    // Length at which to split at
    int splitLength = code.length == 8 ? 4 : 3;
    // Combine 2 halves
    return '${code.substring(0, splitLength)} ${code.substring(splitLength)}';
  }

  static String generateCode(String secret, int period, int digits, OtpHashAlgorithm algorithm) {
    DateTime now = DateTime.now();
    int timestamp = now.millisecondsSinceEpoch ~/ 1000; // Get the Unix timestamp
    Totp.setTime(timestamp); // Set the current time value in the `time` variable


    int timeCounter =( (getTime()-0) ~/ period).floor();
    return _generateHOTP(secret, timeCounter, digits, algorithm);
  }


  static String _generateHOTP(
      String secret, int timeCounter, int digits, OtpHashAlgorithm algorithm) {
    var key = Base32.decode(secret);
    var bytes = Uint8List(8)
      ..buffer.asByteData().setInt64(0, timeCounter, Endian.big);

    // Determine algorithm
    var hmac = Hmac(algorithm.toHashFunction(), key);
    var digest = hmac.convert(bytes);

    int offset = digest.bytes[digest.bytes.length - 1] & 0xf;
    int binary = ((digest.bytes[offset] & 0x7f) << 24) |
    ((digest.bytes[offset + 1] & 0xff) << 16) |
    ((digest.bytes[offset + 2] & 0xff) << 8) |
    (digest.bytes[offset + 3] & 0xff);
    num otp = binary % (pow(10, digits));
    return otp.toString().padLeft(digits, "0");
  }
}