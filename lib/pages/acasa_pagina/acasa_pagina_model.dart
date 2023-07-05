import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// clasa AcasaPaginaModel serveste drept model pentru pagina "AcasaPaginaWidget" si gestioneaza logica si starea asociata acestei pagini.
// Acest model poate fi utilizat pentru a stoca si manipula datele relevante pentru pagina si pentru a notifica widget-ul
// corespunzator atunci cand are loc o actualizare a starii

class AcasaPaginaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
