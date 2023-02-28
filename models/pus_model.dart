import 'dart:convert';

import 'package:equatable/equatable.dart';

class PollingUnitsModel with EquatableMixin {
  final bool success;
  final int request_time;
  final List<PollingUnitsData> data;
  final List<_Lga> lgas;
  final List<_Ward> wards;
  final Election election;
  const PollingUnitsModel({
    required this.success,
    required this.request_time,
    required this.data,
    required this.lgas,
    required this.wards,
    required this.election,
  });

  PollingUnitsModel copyWith({
    bool? success,
    int? request_time,
    List<PollingUnitsData>? data,
    List<_Lga>? lgas,
    List<_Ward>? wards,
    Election? election,
  }) {
    return PollingUnitsModel(
      success: success ?? this.success,
      request_time: request_time ?? this.request_time,
      data: data ?? this.data,
      lgas: lgas ?? this.lgas,
      wards: wards ?? this.wards,
      election: election ?? this.election,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'request_time': request_time,
      'data': data.map((x) => x.toMap()).toList(),
      'lgas': lgas.map((x) => x.toMap()).toList(),
      'wards': wards.map((x) => x.toMap()).toList(),
      'election': election.toMap(),
    };
  }

  factory PollingUnitsModel.fromMap(Map<String, dynamic> map) {
    return PollingUnitsModel(
      success: map['success'] ?? false,
      request_time: map['request_time'] ?? 0,
      data: List<PollingUnitsData>.from(
        (map['data'] ?? []).map(
          (x) => PollingUnitsData.fromMap(x),
        ),
      ),
      lgas: List<_Lga>.from(
        (map['lgas'] ?? []).map(
          (x) => _Lga.fromMap(x),
        ),
      ),
      wards: List<_Ward>.from(
        (map['wards'] ?? []).map(
          (x) => _Ward.fromMap(x),
        ),
      ),
      election: Election.fromMap(map['election']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PollingUnitsModel.fromJson(String source) =>
      PollingUnitsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PusModel(success: $success, request_time: $request_time, data: $data, lgas: $lgas, wards: $wards, election: $election)';
  }

  @override
  List<Object> get props {
    return [
      success,
      request_time,
      data,
      lgas,
      wards,
      election,
    ];
  }
}

class PollingUnitsData with EquatableMixin {
  final String status;
  final String id;
  final int polling_unit_id;
  final int election_id;
  final Election election;
  final Polling_unit polling_unit;
  final String name;
  final String code;
  final String pu_code;
  final int ward_id;
  final _Ward ward;
  final int lga_id;
  final String lga;
  final String created_at;
  final String updated_at;
  final int v;
  final Document? document;
  final int document_id;
  final String session;
  final Old_document? old_document;
  PollingUnitsData({
    required this.status,
    required this.id,
    required this.polling_unit_id,
    required this.election_id,
    required this.election,
    required this.polling_unit,
    required this.name,
    required this.code,
    required this.pu_code,
    required this.ward_id,
    required this.ward,
    required this.lga_id,
    required this.lga,
    required this.created_at,
    required this.updated_at,
    required this.v,
    this.document,
    required this.document_id,
    required this.session,
    this.old_document,
  });

  PollingUnitsData copyWith({
    String? status,
    String? id,
    int? polling_unit_id,
    int? election_id,
    Election? election,
    Polling_unit? polling_unit,
    String? name,
    String? code,
    String? pu_code,
    int? ward_id,
    _Ward? ward,
    int? lga_id,
    String? lga,
    String? created_at,
    String? updated_at,
    int? v,
    Document? document,
    int? document_id,
    String? session,
    Old_document? old_document,
  }) {
    return PollingUnitsData(
      status: status ?? this.status,
      id: id ?? this.id,
      polling_unit_id: polling_unit_id ?? this.polling_unit_id,
      election_id: election_id ?? this.election_id,
      election: election ?? this.election,
      polling_unit: polling_unit ?? this.polling_unit,
      name: name ?? this.name,
      code: code ?? this.code,
      pu_code: pu_code ?? this.pu_code,
      ward_id: ward_id ?? this.ward_id,
      ward: ward ?? this.ward,
      lga_id: lga_id ?? this.lga_id,
      lga: lga ?? this.lga,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      v: v ?? this.v,
      document: document ?? this.document,
      document_id: document_id ?? this.document_id,
      session: session ?? this.session,
      old_document: old_document ?? this.old_document,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      '_id': id,
      'polling_unit_id': polling_unit_id,
      'election_id': election_id,
      'election': election.toMap(),
      'polling_unit': polling_unit.toMap(),
      'name': name,
      'code': code,
      'pu_code': pu_code,
      'ward_id': ward_id,
      'ward': ward.toMap(),
      'lga_id': lga_id,
      'lga': lga,
      'created_at': created_at,
      'updated_at': updated_at,
      '__v': v,
      'document': document?.toMap(),
      'document_id': document_id,
      'session': session,
      'old_document': old_document?.toMap(),
    };
  }

  factory PollingUnitsData.fromMap(Map<String, dynamic> map) {
    return PollingUnitsData(
      status: map['status'] ?? '',
      id: map['_id'] ?? '',
      polling_unit_id: map['polling_unit_id'] ?? 0,
      election_id: map['election_id'] ?? 0,
      election: Election.fromMap(map['election']),
      polling_unit: Polling_unit.fromMap(map['polling_unit']),
      name: map['name'] ?? '',
      code: map['code'] ?? '',
      pu_code: map['pu_code'] ?? '',
      ward_id: map['ward_id'] ?? 0,
      ward: _Ward.fromMap(map['ward']),
      lga_id: map['lga_id'] ?? 0,
      lga: map['lga'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      v: map['__v'] ?? 0,
      document:
          map['document'] != null ? Document.fromMap(map['document']) : null,
      document_id: map['document_id'] ?? 0,
      session: map['session'] ?? '',
      old_document: map['old_document'] != null
          ? Old_document.fromMap(map['old_document'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PollingUnitsData.fromJson(String source) =>
      PollingUnitsData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(status: $status,id: $id, polling_unit_id: $polling_unit_id, election_id: $election_id, election: $election, polling_unit: $polling_unit, name: $name, code: $code, pu_code: $pu_code, ward_id: $ward_id, ward: $ward, lga_id: $lga_id, lga: $lga, created_at: $created_at, updated_at: $updated_at,v: $v, document: $document, document_id: $document_id, session: $session, old_document: $old_document)';
  }

  @override
  List<Object> get props {
    return [
      status,
      id,
      polling_unit_id,
      election_id,
      election,
      polling_unit,
      name,
      code,
      pu_code,
      ward_id,
      ward,
      lga_id,
      lga,
      created_at,
      updated_at,
      v,
      document ?? {},
      document_id,
      session,
      old_document ?? {},
    ];
  }
}

class Election {
  final String status;
  final int version;
  final bool is_mapped;
  final String id;
  final String full_name;
  final int election_id;
  final int domain_id;
  final String domain_type;
  final int election_type_id;
  final int state_id;
  final String state;
  final String election_date;
  final String domain;
  final String election_type;
  final String onModel;
  final String created_at;
  final String updated_at;
  final int v;
  Election({
    required this.status,
    required this.version,
    required this.is_mapped,
    required this.id,
    required this.full_name,
    required this.election_id,
    required this.domain_id,
    required this.domain_type,
    required this.election_type_id,
    required this.state_id,
    required this.state,
    required this.election_date,
    required this.domain,
    required this.election_type,
    required this.onModel,
    required this.created_at,
    required this.updated_at,
    required this.v,
  });

  Election copyWith({
    String? status,
    int? version,
    bool? is_mapped,
    String? id,
    String? full_name,
    int? election_id,
    int? domain_id,
    String? domain_type,
    int? election_type_id,
    int? state_id,
    String? state,
    String? election_date,
    String? domain,
    String? election_type,
    String? onModel,
    String? created_at,
    String? updated_at,
    int? v,
  }) {
    return Election(
      status: status ?? this.status,
      version: version ?? this.version,
      is_mapped: is_mapped ?? this.is_mapped,
      id: id ?? this.id,
      full_name: full_name ?? this.full_name,
      election_id: election_id ?? this.election_id,
      domain_id: domain_id ?? this.domain_id,
      domain_type: domain_type ?? this.domain_type,
      election_type_id: election_type_id ?? this.election_type_id,
      state_id: state_id ?? this.state_id,
      state: state ?? this.state,
      election_date: election_date ?? this.election_date,
      domain: domain ?? this.domain,
      election_type: election_type ?? this.election_type,
      onModel: onModel ?? this.onModel,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'version': version,
      'is_mapped': is_mapped,
      '_id': id,
      'full_name': full_name,
      'election_id': election_id,
      'domain_id': domain_id,
      'domain_type': domain_type,
      'election_type_id': election_type_id,
      'state_id': state_id,
      'state': state,
      'election_date': election_date,
      'domain': domain,
      'election_type': election_type,
      'onModel': onModel,
      'created_at': created_at,
      'updated_at': updated_at,
      '__v': v,
    };
  }

  factory Election.fromMap(Map<String, dynamic> map) {
    return Election(
      status: map['status'] ?? '',
      version: map['version'] ?? 0,
      is_mapped: map['is_mapped'] ?? false,
      id: map['_id'] ?? '',
      full_name: map['full_name'] ?? '',
      election_id: map['election_id'] ?? 0,
      domain_id: map['domain_id'] ?? 0,
      domain_type: map['domain_type'] ?? '',
      election_type_id: map['election_type_id'] ?? 0,
      state_id: map['state_id'] ?? 0,
      state: map['state'] ?? '',
      election_date: map['election_date'] ?? '',
      domain: map['domain'] ?? '',
      election_type: map['election_type'] ?? '',
      onModel: map['onModel'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      v: map['__v'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Election.fromJson(String source) =>
      Election.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Election(status: $status, version: $version, is_mapped: $is_mapped,id: $id, full_name: $full_name, election_id: $election_id, domain_id: $domain_id, domain_type: $domain_type, election_type_id: $election_type_id, state_id: $state_id, state: $state, election_date: $election_date, domain: $domain, election_type: $election_type, onModel: $onModel, created_at: $created_at, updated_at: $updated_at,v: $v)';
  }
}

class Polling_unit {
  final String status;
  final int generation;
  final int db_generation;
  final int is_accredited;
  final String id;
  final int state_id;
  final String state;
  final int lga_id;
  final _Lga lga;
  final int ward_id;
  final _Ward ward;
  final int state_constituency_id;
  final String state_constituency;
  final int federal_constituency_id;
  final String federal_constituency;
  final int senatorial_district_id;
  final String senatorial_district;
  final String name;
  final String code;
  final String pu_code;
  final String old_name;
  final int polling_unit_id;
  final String created_at;
  final String updated_at;
  final int v;
  final String pu_code_string;
  Polling_unit({
    required this.status,
    required this.generation,
    required this.db_generation,
    required this.is_accredited,
    required this.id,
    required this.state_id,
    required this.state,
    required this.lga_id,
    required this.lga,
    required this.ward_id,
    required this.ward,
    required this.state_constituency_id,
    required this.state_constituency,
    required this.federal_constituency_id,
    required this.federal_constituency,
    required this.senatorial_district_id,
    required this.senatorial_district,
    required this.name,
    required this.code,
    required this.pu_code,
    required this.old_name,
    required this.polling_unit_id,
    required this.created_at,
    required this.updated_at,
    required this.v,
    required this.pu_code_string,
  });

  Polling_unit copyWith({
    String? status,
    int? generation,
    int? db_generation,
    int? is_accredited,
    String? id,
    int? state_id,
    String? state,
    int? lga_id,
    _Lga? lga,
    int? ward_id,
    _Ward? ward,
    int? state_constituency_id,
    String? state_constituency,
    int? federal_constituency_id,
    String? federal_constituency,
    int? senatorial_district_id,
    String? senatorial_district,
    String? name,
    String? code,
    String? pu_code,
    String? old_name,
    int? polling_unit_id,
    String? created_at,
    String? updated_at,
    int? v,
    String? pu_code_string,
  }) {
    return Polling_unit(
      status: status ?? this.status,
      generation: generation ?? this.generation,
      db_generation: db_generation ?? this.db_generation,
      is_accredited: is_accredited ?? this.is_accredited,
      id: id ?? this.id,
      state_id: state_id ?? this.state_id,
      state: state ?? this.state,
      lga_id: lga_id ?? this.lga_id,
      lga: lga ?? this.lga,
      ward_id: ward_id ?? this.ward_id,
      ward: ward ?? this.ward,
      state_constituency_id:
          state_constituency_id ?? this.state_constituency_id,
      state_constituency: state_constituency ?? this.state_constituency,
      federal_constituency_id:
          federal_constituency_id ?? this.federal_constituency_id,
      federal_constituency: federal_constituency ?? this.federal_constituency,
      senatorial_district_id:
          senatorial_district_id ?? this.senatorial_district_id,
      senatorial_district: senatorial_district ?? this.senatorial_district,
      name: name ?? this.name,
      code: code ?? this.code,
      pu_code: pu_code ?? this.pu_code,
      old_name: old_name ?? this.old_name,
      polling_unit_id: polling_unit_id ?? this.polling_unit_id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      v: v ?? this.v,
      pu_code_string: pu_code_string ?? this.pu_code_string,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'generation': generation,
      'db_generation': db_generation,
      'is_accredited': is_accredited,
      '_id': id,
      'state_id': state_id,
      'state': state,
      'lga_id': lga_id,
      'lga': lga.toMap(),
      'ward_id': ward_id,
      'ward': ward.toMap(),
      'state_constituency_id': state_constituency_id,
      'state_constituency': state_constituency,
      'federal_constituency_id': federal_constituency_id,
      'federal_constituency': federal_constituency,
      'senatorial_district_id': senatorial_district_id,
      'senatorial_district': senatorial_district,
      'name': name,
      'code': code,
      'pu_code': pu_code,
      'old_name': old_name,
      'polling_unit_id': polling_unit_id,
      'created_at': created_at,
      'updated_at': updated_at,
      '__v': v,
      'pu_code_string': pu_code_string,
    };
  }

  factory Polling_unit.fromMap(Map<String, dynamic> map) {
    return Polling_unit(
      status: map['status'] ?? '',
      generation: map['generation'] ?? 0,
      db_generation: map['db_generation'] ?? 0,
      is_accredited: map['is_accredited'] ?? 0,
      id: map['_id'] ?? '',
      state_id: map['state_id'] ?? 0,
      state: map['state'] ?? '',
      lga_id: map['lga_id'] ?? 0,
      lga: _Lga.fromMap(map['lga']),
      ward_id: map['ward_id'] ?? 0,
      ward: _Ward.fromMap(map['ward']),
      state_constituency_id: map['state_constituency_id'] ?? 0,
      state_constituency: map['state_constituency'] ?? '',
      federal_constituency_id: map['federal_constituency_id'] ?? 0,
      federal_constituency: map['federal_constituency'] ?? '',
      senatorial_district_id: map['senatorial_district_id'] ?? 0,
      senatorial_district: map['senatorial_district'] ?? '',
      name: map['name'] ?? '',
      code: map['code'] ?? '',
      pu_code: map['pu_code'] ?? '',
      old_name: map['old_name'] ?? '',
      polling_unit_id: map['polling_unit_id'] ?? 0,
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      v: map['__v'] ?? 0,
      pu_code_string: map['pu_code_string'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Polling_unit.fromJson(String source) =>
      Polling_unit.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Polling_unit(status: $status, generation: $generation, db_generation: $db_generation, is_accredited: $is_accredited,id: $id, state_id: $state_id, state: $state, lga_id: $lga_id, lga: $lga, ward_id: $ward_id, ward: $ward, state_constituency_id: $state_constituency_id, state_constituency: $state_constituency, federal_constituency_id: $federal_constituency_id, federal_constituency: $federal_constituency, senatorial_district_id: $senatorial_district_id, senatorial_district: $senatorial_district, name: $name, code: $code, pu_code: $pu_code, old_name: $old_name, polling_unit_id: $polling_unit_id, created_at: $created_at, updated_at: $updated_at,v: $v, pu_code_string: $pu_code_string)';
  }
}

class _Lga {
  final String status;
  final String id;
  final int state_id;
  final String state;
  final String name;
  final String code;
  final int lga_id;
  final String created_at;
  final String updated_at;
  final int v;
  _Lga({
    required this.status,
    required this.id,
    required this.state_id,
    required this.state,
    required this.name,
    required this.code,
    required this.lga_id,
    required this.created_at,
    required this.updated_at,
    required this.v,
  });

  _Lga copyWith({
    String? status,
    String? id,
    int? state_id,
    String? state,
    String? name,
    String? code,
    int? lga_id,
    String? created_at,
    String? updated_at,
    int? v,
  }) {
    return _Lga(
      status: status ?? this.status,
      id: id ?? this.id,
      state_id: state_id ?? this.state_id,
      state: state ?? this.state,
      name: name ?? this.name,
      code: code ?? this.code,
      lga_id: lga_id ?? this.lga_id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      '_id': id,
      'state_id': state_id,
      'state': state,
      'name': name,
      'code': code,
      'lga_id': lga_id,
      'created_at': created_at,
      'updated_at': updated_at,
      '__v': v,
    };
  }

  factory _Lga.fromMap(Map<String, dynamic> map) {
    return _Lga(
      status: map['status'] ?? '',
      id: map['_id'] ?? '',
      state_id: map['state_id'] ?? 0,
      state: map['state'] ?? '',
      name: map['name'] ?? '',
      code: map['code'] ?? '',
      lga_id: map['lga_id'] ?? 0,
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      v: map['__v'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory _Lga.fromJson(String source) => _Lga.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Lga(status: $status,id: $id, state_id: $state_id, state: $state, name: $name, code: $code, lga_id: $lga_id, created_at: $created_at, updated_at: $updated_at,v: $v)';
  }
}

class _Ward {
  final String status;
  final String id;
  final int state_id;
  final String state;
  final int lga_id;
  final String lga;
  final int state_constituency_id;
  final String state_constituency;
  final int federal_constituency_id;
  final String federal_constituency;
  final int senatorial_district_id;
  final String senatorial_district;
  final String name;
  final String code;
  final String old_name;
  final int ward_id;
  final String created_at;
  final String updated_at;
  final int v;
  _Ward({
    required this.status,
    required this.id,
    required this.state_id,
    required this.state,
    required this.lga_id,
    required this.lga,
    required this.state_constituency_id,
    required this.state_constituency,
    required this.federal_constituency_id,
    required this.federal_constituency,
    required this.senatorial_district_id,
    required this.senatorial_district,
    required this.name,
    required this.code,
    required this.old_name,
    required this.ward_id,
    required this.created_at,
    required this.updated_at,
    required this.v,
  });

  _Ward copyWith({
    String? status,
    String? id,
    int? state_id,
    String? state,
    int? lga_id,
    String? lga,
    int? state_constituency_id,
    String? state_constituency,
    int? federal_constituency_id,
    String? federal_constituency,
    int? senatorial_district_id,
    String? senatorial_district,
    String? name,
    String? code,
    String? old_name,
    int? ward_id,
    String? created_at,
    String? updated_at,
    int? v,
  }) {
    return _Ward(
      status: status ?? this.status,
      id: id ?? this.id,
      state_id: state_id ?? this.state_id,
      state: state ?? this.state,
      lga_id: lga_id ?? this.lga_id,
      lga: lga ?? this.lga,
      state_constituency_id:
          state_constituency_id ?? this.state_constituency_id,
      state_constituency: state_constituency ?? this.state_constituency,
      federal_constituency_id:
          federal_constituency_id ?? this.federal_constituency_id,
      federal_constituency: federal_constituency ?? this.federal_constituency,
      senatorial_district_id:
          senatorial_district_id ?? this.senatorial_district_id,
      senatorial_district: senatorial_district ?? this.senatorial_district,
      name: name ?? this.name,
      code: code ?? this.code,
      old_name: old_name ?? this.old_name,
      ward_id: ward_id ?? this.ward_id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      '_id': id,
      'state_id': state_id,
      'state': state,
      'lga_id': lga_id,
      'lga': lga,
      'state_constituency_id': state_constituency_id,
      'state_constituency': state_constituency,
      'federal_constituency_id': federal_constituency_id,
      'federal_constituency': federal_constituency,
      'senatorial_district_id': senatorial_district_id,
      'senatorial_district': senatorial_district,
      'name': name,
      'code': code,
      'old_name': old_name,
      'ward_id': ward_id,
      'created_at': created_at,
      'updated_at': updated_at,
      '__v': v,
    };
  }

  factory _Ward.fromMap(Map<String, dynamic> map) {
    return _Ward(
      status: map['status'] ?? '',
      id: map['_id'] ?? '',
      state_id: map['state_id'] ?? 0,
      state: map['state'] ?? '',
      lga_id: map['lga_id'] ?? 0,
      lga: map['lga'] ?? '',
      state_constituency_id: map['state_constituency_id'] ?? 0,
      state_constituency: map['state_constituency'] ?? '',
      federal_constituency_id: map['federal_constituency_id'] ?? 0,
      federal_constituency: map['federal_constituency'] ?? '',
      senatorial_district_id: map['senatorial_district_id'] ?? 0,
      senatorial_district: map['senatorial_district'] ?? '',
      name: map['name'] ?? '',
      code: map['code'] ?? '',
      old_name: map['old_name'] ?? '',
      ward_id: map['ward_id'] ?? 0,
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      v: map['__v'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory _Ward.fromJson(String source) => _Ward.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Ward(status: $status,id: $id, state_id: $state_id, state: $state, lga_id: $lga_id, lga: $lga, state_constituency_id: $state_constituency_id, state_constituency: $state_constituency, federal_constituency_id: $federal_constituency_id, federal_constituency: $federal_constituency, senatorial_district_id: $senatorial_district_id, senatorial_district: $senatorial_district, name: $name, code: $code, old_name: $old_name, ward_id: $ward_id, created_at: $created_at, updated_at: $updated_at,v: $v)';
  }
}

class Document {
  final int status;
  final String id;
  final String url;
  final int size;
  final String updated_at;
  Document({
    required this.status,
    required this.id,
    required this.url,
    required this.size,
    required this.updated_at,
  });

  Document copyWith({
    int? status,
    String? id,
    String? url,
    int? size,
    String? updated_at,
  }) {
    return Document(
      status: status ?? this.status,
      id: id ?? this.id,
      url: url ?? this.url,
      size: size ?? this.size,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      '_id': id,
      'url': url,
      'size': size,
      'updated_at': updated_at,
    };
  }

  factory Document.fromMap(Map<String, dynamic> map) {
    return Document(
      status: map['status'] ?? 0,
      id: map['_id'] ?? '',
      url: map['url'] ?? '',
      size: map['size'] ?? 0,
      updated_at: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Document.fromJson(String source) =>
      Document.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Document(status: $status,id: $id, url: $url, size: $size, updated_at: $updated_at)';
  }
}

class Old_document {
  final int status;
  final String id;
  final String url;
  final int size;
  final String updated_at;
  Old_document({
    required this.status,
    required this.id,
    required this.url,
    required this.size,
    required this.updated_at,
  });

  Old_document copyWith({
    int? status,
    String? id,
    String? url,
    int? size,
    String? updated_at,
  }) {
    return Old_document(
      status: status ?? this.status,
      id: id ?? this.id,
      url: url ?? this.url,
      size: size ?? this.size,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      '_id': id,
      'url': url,
      'size': size,
      'updated_at': updated_at,
    };
  }

  factory Old_document.fromMap(Map<String, dynamic> map) {
    return Old_document(
      status: map['status'] ?? 0,
      id: map['_id'] ?? '',
      url: map['url'] ?? '',
      size: map['size'] ?? 0,
      updated_at: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Old_document.fromJson(String source) =>
      Old_document.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Old_document(status: $status,id: $id, url: $url, size: $size, updated_at: $updated_at)';
  }
}
