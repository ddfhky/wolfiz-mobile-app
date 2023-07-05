import 'dart:async';
import 'dart:ffi';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';


// Clasa AccountRecord reprezinta o inregistrare (un document) din colectia "account" a bazei de date Firestore.
// Aceasta class este folosita pentru a defini structura si comportamentul inregistrarilor din aceasta colectie.

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

  // "secretKey" field.
  String? _secretKey;
  String get secretKey => _secretKey ?? '';
  bool hasSecretKey() => _secretKey != null;

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

  // "algorithm" field.
  String? _algorithm;
  String get algorithm => _algorithm ?? '';
  bool hasAlgorithm() => _algorithm != null;

  // "digits" field
  int? _digits;
  int get digits => _digits ?? 0;
  bool hasDigits() => _digits != null;

  // "period" field
  int? _period;
  int get period => _period ?? 0;
  bool hasPeriod() => _period != null;


  void _initializeFields() {
    _uuid = snapshotData['uuid'] as String?;
    _secretKey = snapshotData['secretKey'] as String?;
    _name = snapshotData['name'] as String?;
    _email = snapshotData['email'] as String?;
    _outputQR = snapshotData['outputQR'] as String?;
    _algorithm = snapshotData['algorithm'] as String?;
    _digits = snapshotData['digits'] as int?;
    _period = snapshotData['period'] as int?;
  }


  // Aceasta metoda returneaza o referinta la colectia "account" din baza de date Firestore.
  // Prin intermediul acestei metode, putem accesa colectia "account" ai efectua diverse operatii precum adaugarea, actualizarea sau stergerea inregistrarilor

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('account');


  // Aceasta metoda primeste o referinta la un document specific din colectia "account" si returneaza un stream care emite instante
  // ale clasei AccountRecord la fiecare actualizare a documentului respectiv. Aceasta este utila atunci cand dorim să observam
  // schimbarile in document in timp real

  static Stream<AccountRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AccountRecord.fromSnapshot(s));


  // Aceasta metoda primeste o referinta la un document specific din colectia "account" si returneaza o Future care se va rezolva cu o
  // instanta a clasei AccountRecord. Aceasta metoda este utilizata atunci cand dorim sa obtinem datele dintr-un document o singura data, \
  // fara a-l urmari ulterior pentru actualizari

  static Future<AccountRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AccountRecord.fromSnapshot(s));


  // Aceasta metoda primeste un snapshot (instantaneu) al unui document Firestore si returneaza o instanta a clasei AccountRecord
  // bazata pe datele din snapshot. Aceasta se foloseste pentru a transforma datele primite din Firestore intr-o reprezentare locala
  // a inregistrarii

  static AccountRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AccountRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );


  // Aceasta metoda primeste datele si o referinta la un document si returneaza o instanta a clasei AccountRecord pe baza acestor date.
  // Este folosita atunci cand dorim să cream o instanta locala a inregistrarii pentru a o adauga sau actualiza in Firestore

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
  String? secretKey,
  String? name,
  String? email,
  String? outputQR,
  String? algorithm,
  int? digits,
  int? period,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uuid': uuid,
      'secretKey': secretKey,
      'name': name,
      'email': email,
      'outputQR': outputQR,
      'algorithm': algorithm,
      'digits': digits,
      'period': period,
    }.withoutNulls,
  );

  return firestoreData;
}

class AccountRecordDocumentEquality implements Equality<AccountRecord> {
  const AccountRecordDocumentEquality();

  @override
  bool equals(AccountRecord? e1, AccountRecord? e2) {
    return e1?.uuid == e2?.uuid &&
        e1?.secretKey == e2?.secretKey &&
        e1?.name == e2?.name &&
        e1?.email == e2?.email &&
        e1?.outputQR == e2?.outputQR &&
        e1?.algorithm == e2?.algorithm &&
        e1?.digits == e2?.digits &&
        e1?.period == e2?.period;
  }

  @override
  int hash(AccountRecord? e) => const ListEquality()
      .hash([e?.uuid, e?.secretKey, e?.name, e?.email, e?.outputQR, e?.algorithm, e?.digits, e?.period]);

  @override
  bool isValidKey(Object? o) => o is AccountRecord;
}
