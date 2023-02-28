import 'dart:convert';
import 'dart:io';

import 'package:dartx/dartx_io.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'map.dart';
import 'models/lga_model.dart';
import 'models/pus_model.dart';

final dio = Dio();

var pus = <PollingUnitsModel>[];
var wards = <Ward>[];

final states = [
  "Abia",
  "Adamawa",
  "Akwa Ibom",
  "Anambra",
  "Bauchi",
  "Bayelsa",
  "Benue",
  "Borno",
  "Cross River",
  "Delta",
  "Ebonyi",
  "Edo",
  "Ekiti",
  "Enugu",
  "FCT - Abuja",
  "Gombe",
  "Imo",
  "Jigawa",
  "Kaduna",
  "Kano",
  "Katsina",
  "Kebbi",
  "Kogi",
  "Kwara",
  "Lagos",
  "Nasarawa",
  "Niger",
  "Ogun",
  "Ondo",
  "Osun",
  "Oyo",
  "Plateau",
  "Rivers",
  "Sokoto",
  "Taraba",
  "Yobe",
  "Zamfara"
];

late int currentStateIndex;
File get puFile => File('./pus/${states[currentStateIndex]}.json');

void main(List<String> args) async {
  currentStateIndex = int.parse(args.first);

  await loadWards();
  await loadPus();
  await savePus();
}

Future<void> loadWards() async {
  wards = List<Ward>.from(
    (wardsMap['wards'] ?? []).map(
      (x) => Ward.fromMap(x),
    ),
  );
}

Future<void> loadPus() async {
  print(Directory('./')
      .listSync(recursive: true)
      .map((e) => '${e.path}')
      .join(',\n'));

  final exists = await puFile.exists();
  print('${puFile.path} exists: $exists');

  if (exists == false) {
    await loadPusByWardID();
  }
}

Future<void> savePus() async {
  if (await puFile.exists() == false) {
    await puFile.create(recursive: true);
    await puFile.writeAsString(
      json.encode(
        {
          'pus': [...pus.map((e) => e.toMap())],
        },
      ),
    );
  }
}

Future<void> loadPusByWardID() async {
  for (var ward in wards.where((it) => it.state_id == currentStateIndex + 1)) {
    try {
      final res = await dio.get(
        'https://irev-v2.herokuapp.com/api/v1/elections/63f8f25b594e164f8146a213/pus?ward=${ward.id}',
      );
      final unit = PollingUnitsModel.fromMap(res.data);
      pus.add(unit);
      print('${ward.name} FETCHED');
    } catch (e) {
      print(e.toString());
    }
  }
}
