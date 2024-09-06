class FarmerStatsResponse {
  bool status;
  int statusCode;
  Data data;

  FarmerStatsResponse({
    required this.status,
    required this.statusCode,
    required this.data,
  });

  factory FarmerStatsResponse.fromJson(Map<String, dynamic> json) {
    return FarmerStatsResponse(
      status: json['status'],
      statusCode: json['statusCode'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  List<DistrictFarmerStats> districtFarmerStats;
  List<CategoryWiseFarmerStats> categoryWiseFarmerStats;
  List<LandTypeWiseLandStats> landTypeWiseLandStats;
  List<District> districts;
  List<Block> blocks;
  List<Vcdc> vcdcs;
  List<Village> villages;

  Data({
    required this.districtFarmerStats,
    required this.categoryWiseFarmerStats,
    required this.landTypeWiseLandStats,
    required this.districts,
    required this.blocks,
    required this.vcdcs,
    required this.villages,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      districtFarmerStats: (json['districtFarmerStats'] as List)
          .map((i) => DistrictFarmerStats.fromJson(i))
          .toList(),
      categoryWiseFarmerStats: (json['categoryWiseFarmerStats'] as List)
          .map((i) => CategoryWiseFarmerStats.fromJson(i))
          .toList(),
      landTypeWiseLandStats: (json['landTypeWiseLandStats'] as List)
          .map((i) => LandTypeWiseLandStats.fromJson(i))
          .toList(),
      districts: (json['districts'] as List)
          .map((i) => District.fromJson(i))
          .toList(),
      blocks: (json['blocks'] as List).map((i) => Block.fromJson(i)).toList(),
      vcdcs: (json['vcdcs'] as List).map((i) => Vcdc.fromJson(i)).toList(),
      villages:
      (json['villages'] as List).map((i) => Village.fromJson(i)).toList(),
    );
  }
}

class DistrictFarmerStats {
  int id;
  String name;
  String code;
  int isBtr;
  int stateId;
  int farmersCount;

  DistrictFarmerStats({
    required this.id,
    required this.name,
    required this.code,
    required this.isBtr,
    required this.stateId,
    required this.farmersCount,
  });

  factory DistrictFarmerStats.fromJson(Map<String, dynamic> json) {
    return DistrictFarmerStats(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      isBtr: json['is_btr'],
      stateId: json['state_id'],
      farmersCount: json['farmers_count'],
    );
  }
}

class CategoryWiseFarmerStats {
  String name;
  int count;

  CategoryWiseFarmerStats({
    required this.name,
    required this.count,
  });

  factory CategoryWiseFarmerStats.fromJson(Map<String, dynamic> json) {
    return CategoryWiseFarmerStats(
      name: json['name'],
      count: json['count'],
    );
  }
}

class LandTypeWiseLandStats {
  String name;
  String code;
  int count;
  double totalLandRegisteredInBighas;
  double totalLandRegisteredInHectares;

  LandTypeWiseLandStats({
    required this.name,
    required this.code,
    required this.count,
    required this.totalLandRegisteredInBighas,
    required this.totalLandRegisteredInHectares,
  });

  factory LandTypeWiseLandStats.fromJson(Map<String, dynamic> json) {
    return LandTypeWiseLandStats(
      name: json['name'],
      code: json['code'],
      count: json['count'],
      totalLandRegisteredInBighas: json['total_land_registered_in_bighas'],
      totalLandRegisteredInHectares: json['total_land_registered_in_hectares'],
    );
  }
}

class District {
  int id;
  String name;
  String code;
  List<Block> blocks;

  District({
    required this.id,
    required this.name,
    required this.code,
    required this.blocks,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      blocks:
      (json['blocks'] as List).map((i) => Block.fromJson(i)).toList(),
    );
  }
}

class Block {
  int id;
  String name;
  String code;
  List<Vcdc> vcdcs;

  Block({
    required this.id,
    required this.name,
    required this.code,
    required this.vcdcs,
  });

  factory Block.fromJson(Map<String, dynamic> json) {
    return Block(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      vcdcs: (json['vcdcs'] as List).map((i) => Vcdc.fromJson(i)).toList(),
    );
  }
}

class Vcdc {
  int id;
  String name;
  String code;
  List<RevenueVillage> revenueVillages;

  Vcdc({
    required this.id,
    required this.name,
    required this.code,
    required this.revenueVillages,
  });

  factory Vcdc.fromJson(Map<String, dynamic> json) {
    return Vcdc(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      revenueVillages: (json['revenueVillages'] as List)
          .map((i) => RevenueVillage.fromJson(i))
          .toList(),
    );
  }
}

class RevenueVillage {
  int id;
  int vcdcId;
  String name;
  String code;

  RevenueVillage({
    required this.id,
    required this.vcdcId,
    required this.name,
    required this.code,
  });

  factory RevenueVillage.fromJson(Map<String, dynamic> json) {
    return RevenueVillage(
      id: json['id'],
      vcdcId: json['vcdc_id'],
      name: json['name'],
      code: json['code'],
    );
  }
}

class Village {
  int id;
  String name;
  String code;
  int vcdcId;

  Village({
    required this.id,
    required this.name,
    required this.code,
    required this.vcdcId,
  });

  factory Village.fromJson(Map<String, dynamic> json) {
    return Village(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      vcdcId: json['vcdc_id'],
    );
  }
}
