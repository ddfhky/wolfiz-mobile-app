import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'acasa_pagina_model.dart';
export 'acasa_pagina_model.dart';

class AcasaPaginaWidget extends StatefulWidget {
  const AcasaPaginaWidget({Key? key}) : super(key: key);

  @override
  _AcasaPaginaWidgetState createState() => _AcasaPaginaWidgetState();
}

class _AcasaPaginaWidgetState extends State<AcasaPaginaWidget> {
  late AcasaPaginaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AcasaPaginaModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    // GestureDetector: Un widget care permite capturarea evenimentului de apasare pentru a scapa de focusul (deselectarea) elementelor
    // de interfata atunci cand se atinge in afara lor.

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),

      // Scaffold: Widget-ul principal pentru a construi pagini cu functionalitati comune precum AppBar, snackbar, si multe altele.

      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            backgroundColor: Color(0xFF112F49),
            automaticallyImplyLeading: false,
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
            elevation: 6.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [

              // StreamBuilder: Un widget care asculta un flux de date (baza de date) si reconstruieste interfata de fiecare data cand
              // fluxul de date emite o actualizare.

              StreamBuilder<List<AccountRecord>>(
                stream: queryAccountRecord(),

                // Aceasta este functia de construire a interfetei care primeste contextul si snapshot-ul fluxului de date
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
                  List<AccountRecord> listViewAccountRecordList =
                      snapshot.data!;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewAccountRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewAccountRecord =
                          listViewAccountRecordList[listViewIndex];
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'VizualizareContPagina',
                              queryParameters: {
                                'name': serializeParam(
                                  listViewAccountRecord,
                                  ParamType.Document,
                                ),
                                'email': serializeParam(
                                  listViewAccountRecord,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'name': listViewAccountRecord,
                                'email': listViewAccountRecord,
                              },
                            );
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.account_circle,
                              color: Color(0xCC102946),
                              size: 50.0,
                            ),
                            title: Text(
                              listViewAccountRecord.name,
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 27.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            subtitle: Text(
                              listViewAccountRecord.email,
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xCC102946),
                              size: 20.0,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
