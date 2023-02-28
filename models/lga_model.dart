import 'dart:convert';

import 'package:equatable/equatable.dart';

class LgaModel with EquatableMixin {
  final bool success;
  final int request_time;
  final List<WardData> data;
  final List<Result> results;
  final List<PollingUnit> pus;

  const LgaModel({
    required this.success,
    required this.request_time,
    required this.data,
    required this.results,
    required this.pus,
  });

  LgaModel copyWith({
    bool? success,
    int? request_time,
    List<WardData>? data,
    List<Result>? results,
    List<PollingUnit>? pus,
  }) {
    return LgaModel(
      success: success ?? this.success,
      request_time: request_time ?? this.request_time,
      data: data ?? this.data,
      results: results ?? this.results,
      pus: pus ?? this.pus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'request_time': request_time,
      'data': data.map((x) => x.toMap()).toList(),
      'results': results.map((x) => x.toMap()).toList(),
      'pus': pus.map((x) => x.toMap()).toList(),
    };
  }

  factory LgaModel.fromMap(Map<String, dynamic> map) {
    return LgaModel(
      success: map['success'] ?? false,
      request_time: map['request_time'] ?? 0,
      data: List<WardData>.from(
          (map['data'] ?? []).map((x) => WardData.fromMap(x))),
      results: List<Result>.from(
          (map['results'] ?? []).map((x) => Result.fromMap(x))),
      pus: List<PollingUnit>.from(
        (map['pus'] ?? []).map(
          (x) => PollingUnit.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory LgaModel.fromJson(String source) =>
      LgaModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LgaModel(success: $success, request_time: $request_time, data: $data, results: $results, pus: $pus)';
  }

  @override
  List<Object> get props {
    return [
      success,
      request_time,
      data,
      results,
      pus,
    ];
  }
}

class WardData with EquatableMixin {
  final List<Ward> wards;
  final List<dynamic> election_wards;
  final String status;
  final bool is_mapped;
  final String id;
  final Lga lga;
  final _Election election;
  final int election_id;
  final State state;
  final String created_at;
  final String updated_at;
  final int v;
  const WardData({
    required this.wards,
    required this.election_wards,
    required this.status,
    required this.is_mapped,
    required this.id,
    required this.lga,
    required this.election,
    required this.election_id,
    required this.state,
    required this.created_at,
    required this.updated_at,
    required this.v,
  });

  WardData copyWith({
    List<Ward>? wards,
    List<dynamic>? election_wards,
    String? status,
    bool? is_mapped,
    String? id,
    Lga? lga,
    _Election? election,
    int? election_id,
    State? state,
    String? created_at,
    String? updated_at,
    int? v,
  }) {
    return WardData(
      wards: wards ?? this.wards,
      election_wards: election_wards ?? this.election_wards,
      status: status ?? this.status,
      is_mapped: is_mapped ?? this.is_mapped,
      id: id ?? this.id,
      lga: lga ?? this.lga,
      election: election ?? this.election,
      election_id: election_id ?? this.election_id,
      state: state ?? this.state,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'wards': wards.map((x) => x.toMap()).toList(),
      'election_wards': election_wards,
      'status': status,
      'is_mapped': is_mapped,
      '_id': id,
      'lga': lga.toMap(),
      'election': election.toMap(),
      'election_id': election_id,
      'state': state.toMap(),
      'created_at': created_at,
      'updated_at': updated_at,
      '__v': v,
    };
  }

  factory WardData.fromMap(Map<String, dynamic> map) {
    return WardData(
      wards: List<Ward>.from((map['wards'] ?? []).map((x) => Ward.fromMap(x))),
      election_wards: List<dynamic>.from(map['election_wards']),
      status: map['status'] ?? '',
      is_mapped: map['is_mapped'] ?? false,
      id: map['_id'] ?? '',
      lga: Lga.fromMap(map['lga']),
      election: _Election.fromMap(map['election']),
      election_id: map['election_id'] ?? 0,
      state: State.fromMap(map['state']),
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      v: map['__v'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory WardData.fromJson(String source) =>
      WardData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(wards: $wards, election_wards: $election_wards, status: $status, is_mapped: $is_mapped,id: $id, lga: $lga, election: $election, election_id: $election_id, state: $state, created_at: $created_at, updated_at: $updated_at,v: $v)';
  }

  @override
  List<Object> get props {
    return [
      wards,
      election_wards,
      status,
      is_mapped,
      id,
      lga,
      election,
      election_id,
      state,
      created_at,
      updated_at,
      v,
    ];
  }
}

class Ward {
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
  Ward({
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

  Ward copyWith({
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
    return Ward(
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

  factory Ward.fromMap(Map<String, dynamic> map) {
    return Ward(
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

  factory Ward.fromJson(String source) => Ward.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Ward(status: $status,id: $id, state_id: $state_id, state: $state, lga_id: $lga_id, lga: $lga, state_constituency_id: $state_constituency_id, state_constituency: $state_constituency, federal_constituency_id: $federal_constituency_id, federal_constituency: $federal_constituency, senatorial_district_id: $senatorial_district_id, senatorial_district: $senatorial_district, name: $name, code: $code, old_name: $old_name, ward_id: $ward_id, created_at: $created_at, updated_at: $updated_at,v: $v)';
  }
}

class Lga with EquatableMixin {
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
  Lga({
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

  Lga copyWith({
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
    return Lga(
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

  factory Lga.fromMap(Map<String, dynamic> map) {
    return Lga(
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

  factory Lga.fromJson(String source) => Lga.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Lga(status: $status,id: $id, state_id: $state_id, state: $state, name: $name, code: $code, lga_id: $lga_id, created_at: $created_at, updated_at: $updated_at,v: $v)';
  }

  @override
  List<Object> get props {
    return [
      status,
      id,
      state_id,
      state,
      name,
      code,
      lga_id,
      created_at,
      updated_at,
      v,
    ];
  }
}

class _Election with EquatableMixin {
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
  _Election({
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

  _Election copyWith({
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
    return _Election(
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

  factory _Election.fromMap(Map<String, dynamic> map) {
    return _Election(
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

  factory _Election.fromJson(String source) =>
      _Election.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Election(status: $status, version: $version, is_mapped: $is_mapped,id: $id, full_name: $full_name, election_id: $election_id, domain_id: $domain_id, domain_type: $domain_type, election_type_id: $election_type_id, state_id: $state_id, state: $state, election_date: $election_date, domain: $domain, election_type: $election_type, onModel: $onModel, created_at: $created_at, updated_at: $updated_at,v: $v)';
  }

  @override
  List<Object> get props {
    return [
      status,
      version,
      is_mapped,
      id,
      full_name,
      election_id,
      domain_id,
      domain_type,
      election_type_id,
      state_id,
      state,
      election_date,
      domain,
      election_type,
      onModel,
      created_at,
      updated_at,
      v,
    ];
  }
}

class State with EquatableMixin {
  final String status;
  final String id;
  final int presidential_id;
  final String presidential;
  final String name;
  final String code;
  final int state_id;
  final String created_at;
  final String updated_at;
  final int v;

  const State({
    required this.status,
    required this.id,
    required this.presidential_id,
    required this.presidential,
    required this.name,
    required this.code,
    required this.state_id,
    required this.created_at,
    required this.updated_at,
    required this.v,
  });

  State copyWith({
    String? status,
    String? id,
    int? presidential_id,
    String? presidential,
    String? name,
    String? code,
    int? state_id,
    String? created_at,
    String? updated_at,
    int? v,
  }) {
    return State(
      status: status ?? this.status,
      id: id ?? this.id,
      presidential_id: presidential_id ?? this.presidential_id,
      presidential: presidential ?? this.presidential,
      name: name ?? this.name,
      code: code ?? this.code,
      state_id: state_id ?? this.state_id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      '_id': id,
      'presidential_id': presidential_id,
      'presidential': presidential,
      'name': name,
      'code': code,
      'state_id': state_id,
      'created_at': created_at,
      'updated_at': updated_at,
      '__v': v,
    };
  }

  factory State.fromMap(Map<String, dynamic> map) {
    return State(
      status: map['status'] ?? '',
      id: map['_id'] ?? '',
      presidential_id: map['presidential_id'] ?? 0,
      presidential: map['presidential'] ?? '',
      name: map['name'] ?? '',
      code: map['code'] ?? '',
      state_id: map['state_id'] ?? 0,
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      v: map['__v'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory State.fromJson(String source) => State.fromMap(json.decode(source));

  @override
  String toString() {
    return 'State(status: $status,id: $id, presidential_id: $presidential_id, presidential: $presidential, name: $name, code: $code, state_id: $state_id, created_at: $created_at, updated_at: $updated_at,v: $v)';
  }

  @override
  List<Object> get props {
    return [
      status,
      id,
      presidential_id,
      presidential,
      name,
      code,
      state_id,
      created_at,
      updated_at,
      v,
    ];
  }
}

class Result with EquatableMixin {
  final String id;
  final int count;
  const Result({
    required this.id,
    required this.count,
  });

  Result copyWith({
    String? id,
    int? count,
  }) {
    return Result(
      id: id ?? this.id,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'count': count,
    };
  }

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      id: map['_id'] ?? '',
      count: map['count'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Result.fromJson(String source) => Result.fromMap(json.decode(source));

  @override
  String toString() => 'Result(_id: $id, count: $count)';

  @override
  List<Object> get props => [id, count];
}

class PollingUnit with EquatableMixin {
  final String id;
  final int count;

  const PollingUnit({
    required this.id,
    required this.count,
  });

  PollingUnit copyWith({
    String? id,
    int? count,
  }) {
    return PollingUnit(
      id: id ?? this.id,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'count': count,
    };
  }

  factory PollingUnit.fromMap(Map<String, dynamic> map) {
    return PollingUnit(
      id: map['_id'] ?? '',
      count: map['count'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PollingUnit.fromJson(String source) =>
      PollingUnit.fromMap(json.decode(source));

  @override
  String toString() => 'Pu(_id: $id, count: $count)';

  @override
  List<Object> get props => [id, count];
}
