import '../../totp/totp_algorithm.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'vizualizare_cont_pagina_model.dart';
export 'vizualizare_cont_pagina_model.dart';


class VizualizareContPaginaWidget extends StatefulWidget {
  const VizualizareContPaginaWidget({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  final AccountRecord? name;
  final AccountRecord? email;


  @override
  _VizualizareContPaginaWidgetState createState() =>
      _VizualizareContPaginaWidgetState();
}

class _VizualizareContPaginaWidgetState
    extends State<VizualizareContPaginaWidget> {
  late VizualizareContPaginaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late Timer _timer;
  int _counterDuration = 0;

  void startCounter() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counterDuration > 0) {
          _counterDuration--; // Scade durata counter-ului cu 1 secundă
        } else {
          _timer.cancel(); // Oprește timer-ul când durata a expirat
          // Adaugă aici orice cod suplimentar pentru actualizarea paginii
        }
      });
    });
  }


  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VizualizareContPaginaModel());
    _counterDuration = widget.name!.period; // Setează durata counter-ului
  }

  String generateCode(String secretKey, int period, int digits, String algorithm){
    OtpHashAlgorithm otpAlgorithm = OtpHashAlgorithm.fromString(algorithm);
    String code = Totp.generateCode(secretKey, period, digits, otpAlgorithm);
    return code;
  }

  @override
  void dispose() {
    _timer.cancel();
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    startCounter(); // Pornește counter-ul

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
              'Wolfiz.',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Nunito',
                color: Color(0xFFFCFCFC),
                fontSize: 34.0,
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
          child: StreamBuilder<AccountRecord>(
            stream: AccountRecord.getDocument(widget.name!.reference),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                );
              }
              final dashboardAccountRecord = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 141.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF112F49),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x33000000),
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.account_circle,
                            color: Color(0xFFE9E8E8),
                            size: 80.0,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 33.0, 25.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 5.0, 0.0, 0.0),
                                  child: Text(
                                    widget.name!.name,
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 5.0, 0.0, 0.0),
                                    child: Text(
                                      widget.email!.email,
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 467.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                          FlutterFlowTheme.of(context).secondaryBackground,
                          border: Border.all(
                            color: Color(0x14000000),
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.checkDouble,
                              color: Colors.black,
                            ),
                            title: Text(
                              'Codul unic de acces este activat',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                fontFamily: 'Poppins',
                                fontSize: 17.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              'Poți utiliza codul generat de această aplicație pentru a-ți verifica autentificarea.',
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                fontFamily: 'Poppins',
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                          ),
                        ),
                      ),
                      Container(
                        width: 467.0,
                        height: 89.0,
                        decoration: BoxDecoration(
                          color:
                          FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          shape: BoxShape.rectangle,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: SelectionArea(
                            child: Column(
                              children: [
                                          Text(_counterDuration.toString()),
                                          Text(
                                              generateCode(
                                                  dashboardAccountRecord.secretKey,
                                                  dashboardAccountRecord.period,
                                                  dashboardAccountRecord.digits,
                                                  dashboardAccountRecord.algorithm),
                                                  style: FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 30.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )),
                              ],
                             )
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
