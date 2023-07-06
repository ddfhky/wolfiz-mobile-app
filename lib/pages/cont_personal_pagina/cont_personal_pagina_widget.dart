import '../adauga_cont_pagina/ScanningQRCode.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cont_personal_pagina_model.dart';
export 'cont_personal_pagina_model.dart';

class ContPersonalPaginaWidget extends StatefulWidget {
  const ContPersonalPaginaWidget({Key? key}) : super(key: key);

  @override
  _ContPersonalPaginaWidgetState createState() =>
      _ContPersonalPaginaWidgetState();
}

class _ContPersonalPaginaWidgetState extends State<ContPersonalPaginaWidget> {
  late ContPersonalPaginaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContPersonalPaginaModel());
  }

  void _setDataAfterScanning(String qrCode) {
    SetDataAfterScanning(qrCode, context);
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            backgroundColor: Color(0xFF112F49),
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              'Cont personal',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Nunito',
                    color: Color(0xFFFCFCFC),
                    fontSize: 33.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            actions: [],
            centerTitle: true,
            toolbarHeight: 100.0,
            elevation: 0.0,
          ),
        ),

        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  // --------- qrCode
                  child: FFButtonWidget(
                    onPressed: () async {
                      _model.codQrOutput =
                          await FlutterBarcodeScanner.scanBarcode(
                        '#C62828', // scanning line color
                        'Cancel', // cancel button text
                        true, // whether to show the flash icon
                        ScanMode.QR,
                      );
                      _setDataAfterScanning(_model.codQrOutput);
                      setState(() {});
                    },
                    text: 'Scaneaza codul QR',
                    options: FFButtonOptions(
                      height: 60.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF112F49),
                      textStyle:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: 'Nunito',
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.w500,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                      hoverColor: Color(0xFF274968),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
