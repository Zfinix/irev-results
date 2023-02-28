import 'dart:convert';
import 'dart:io';

import 'package:dartx/dartx_io.dart';
import 'package:http/http.dart' as http;
import 'fetch.dart';
import 'models/pus_model.dart';

List<PollingUnitsData> get allPus => pus.map((e) => e.data).flatten().toList();

void main(List<String> args) async {
  currentStateIndex = int.parse(args.first);
  await loadPus();
  for (var pu in allPus) {
    try {
      if (pu.document != null) {
        await downloadResult(pu.polling_unit, pu.document?.url);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

Future<void> loadPus() async {
  print(Directory('./')
      .listSync(recursive: true)
      .map((e) => '${e.path}')
      .join(',\n'));
  final exists = await puFile.exists();
  print('${puFile.path} exists: $exists');

  if (exists == true) {
    final rawPusMap = json.decode(await puFile.readAsString());
    pus = List<PollingUnitsModel>.from(
      (rawPusMap['pus'] ?? []).map(
        (x) => PollingUnitsModel.fromMap(x),
      ),
    );
  }
}

Future<void> downloadResult(Polling_unit pu, String? url) async {
  var file = File(
    './${states[pu.lga.state_id - 1]}/${pu.lga.name}-${pu.lga.code}/${pu.ward.name}/${pu.name}-${pu.code}/result.pdf',
  );

  if (url == null || await file.exists()) {
    print('${file.path} Download skipped');
    return;
  }

  await http.get(Uri.parse(url)).then(
    (response) async {
      await file.create(recursive: true);
      await file.writeAsBytes(response.bodyBytes);
      print('${file.path} Result Downloaded');
    },
  );
}
