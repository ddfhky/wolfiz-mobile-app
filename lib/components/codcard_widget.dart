import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'codcard_model.dart';
export 'codcard_model.dart';

class CodcardWidget extends StatefulWidget {
  const CodcardWidget({Key? key}) : super(key: key);

  @override
  _CodcardWidgetState createState() => _CodcardWidgetState();
}

class _CodcardWidgetState extends State<CodcardWidget> {
  late CodcardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CodcardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
          child: Text(
            'Hello World',
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Poppins',
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        Text(
          'Hello World',
          textAlign: TextAlign.end,
          style: FlutterFlowTheme.of(context).bodyMedium,
        ),
      ],
    );
  }
}
