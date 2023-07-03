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

  // "key_hash" field.
  String? _keyHash;
  String get keyHash => _keyHash ?? '';
  bool hasKeyHash() => _keyHash != null;

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

  void _initializeFields() {
    _uuid = snapshotData['uuid'] as String?;
    _keyHash = snapshotData['key_hash'] as String?;
    _name = snapshotData['name'] as String?;
    _email = snapshotData['email'] as String?;
    _outputQR = snapshotData['outputQR'] as String?;
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
  String? keyHash,
  String? name,
  String? email,
  String? outputQR,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uuid': uuid,
      'key_hash': keyHash,
      'name': name,
      'email': email,
      'outputQR': outputQR,
    }.withoutNulls,
  );

  return firestoreData;
}

class AccountRecordDocumentEquality implements Equality<AccountRecord> {
  const AccountRecordDocumentEquality();

  @override
  bool equals(AccountRecord? e1, AccountRecord? e2) {
    return e1?.uuid == e2?.uuid &&
        e1?.keyHash == e2?.keyHash &&
        e1?.name == e2?.name &&
        e1?.email == e2?.email &&
        e1?.outputQR == e2?.outputQR;
  }

  @override
  int hash(AccountRecord? e) => const ListEquality()
      .hash([e?.uuid, e?.keyHash, e?.name, e?.email, e?.outputQR]);

  @override
  bool isValidKey(Object? o) => o is AccountRecord;
}
