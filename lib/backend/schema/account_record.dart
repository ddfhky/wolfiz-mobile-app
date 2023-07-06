import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AccountRecord extends FirestoreRecord {
  AccountRecord._(
      DocumentReference reference,
      Map<String, dynamic> data,
      ) : super(reference, data) {
    _initializeFields();
  }

  // "uuid" field.
  String? _uuid;
  String get uuid => _uuid ?? '';
  bool hasUuid() => _uuid != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "outputQR" field.
  String? _outputQR;
  String get outputQR => _outputQR ?? '';
  bool hasOutputQR() => _outputQR != null;

  // "digits" field.
  int? _digits;
  int get digits => _digits ?? 0;
  bool hasDigits() => _digits != null;

  // "period" field.
  int? _period;
  int get period => _period ?? 0;
  bool hasPeriod() => _period != null;

  // "algorithm" field.
  String? _algorithm;
  String get algorithm => _algorithm ?? '';
  bool hasAlgorithm() => _algorithm != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "secretKey" field.
  String? _secretKey;
  String get secretKey => _secretKey ?? '';
  bool hasSecretKey() => _secretKey != null;

  void _initializeFields() {
    _uuid = snapshotData['uuid'] as String?;
    _name = snapshotData['name'] as String?;
    _email = snapshotData['email'] as String?;
    _outputQR = snapshotData['outputQR'] as String?;
    _digits = castToType<int>(snapshotData['digits']);
    _period = castToType<int>(snapshotData['period']);
    _algorithm = snapshotData['algorithm'] as String?;
    _id = castToType<int>(snapshotData['id']);
    _secretKey = snapshotData['secretKey'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('account');

  static Stream<AccountRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AccountRecord.fromSnapshot(s));

  static Future<AccountRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AccountRecord.fromSnapshot(s));

  static AccountRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AccountRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AccountRecord getDocumentFromData(
      Map<String, dynamic> data,
      DocumentReference reference,
      ) =>
      AccountRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AccountRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AccountRecord &&
          reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAccountRecordData({
  String? uuid,
  String? name,
  String? email,
  String? outputQR,
  int? digits,
  int? period,
  String? algorithm,
  int? id,
  String? secretKey,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uuid': uuid,
      'name': name,
      'email': email,
      'outputQR': outputQR,
      'digits': digits,
      'period': period,
      'algorithm': algorithm,
      'id': id,
      'secretKey': secretKey,
    }.withoutNulls,
  );

  return firestoreData;
}

class AccountRecordDocumentEquality implements Equality<AccountRecord> {
  const AccountRecordDocumentEquality();

  @override
  bool equals(AccountRecord? e1, AccountRecord? e2) {
    return e1?.uuid == e2?.uuid &&
        e1?.name == e2?.name &&
        e1?.email == e2?.email &&
        e1?.outputQR == e2?.outputQR &&
        e1?.digits == e2?.digits &&
        e1?.period == e2?.period &&
        e1?.algorithm == e2?.algorithm &&
        e1?.id == e2?.id &&
        e1?.secretKey == e2?.secretKey;
  }

  @override
  int hash(AccountRecord? e) => const ListEquality().hash([
    e?.uuid,
    e?.name,
    e?.email,
    e?.outputQR,
    e?.digits,
    e?.period,
    e?.algorithm,
    e?.id,
    e?.secretKey
  ]);

  @override
  bool isValidKey(Object? o) => o is AccountRecord;
}
