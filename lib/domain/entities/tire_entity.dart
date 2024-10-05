// ignore_for_file: no_leading_underscores_for_local_identifiers

class TireEntity {
  TireEntity({
    required this.id,
    required this.serialNumber,
    required this.companyGroupId,
    required this.companyGroupName,
    required this.branchOfficeId,
    required this.branchOfficeName,
    required this.currentLifeCycle,
    required this.timesRetreaded,
    required this.maxRetreadsExpected,
    required this.recommendedPressure,
    required this.currentPressure,
    required this.dot,
    required this.purchaseCost,
    required this.newTire,
    required this.status,
    required this.createdAt,
    required this.tireSize,
    required this.make,
    required this.model,
    required this.currentRetread,
    required this.disposal,
    required this.registrationImages,
  });
  late final dynamic id;
  late final String? serialNumber;
  late final int companyGroupId;
  late final String companyGroupName;
  late final int branchOfficeId;
  late final String branchOfficeName;
  late final int currentLifeCycle;
  late final int timesRetreaded;
  late final dynamic maxRetreadsExpected;
  late final dynamic recommendedPressure;
  late final dynamic currentPressure;
  late final String? dot;
  late final dynamic purchaseCost;
  late final bool newTire;
  late final String status;
  late final String createdAt;
  late final TireSize tireSize;
  late final Make make;
  late final Model model;
  late final CurrentRetread? currentRetread;
  late final Disposal? disposal;
  late final List<dynamic> registrationImages;
  
  TireEntity.fromJson(Map<String, dynamic> json){
    id = json['id'];
    serialNumber = json['serialNumber'];
    companyGroupId = json['companyGroupId'];
    companyGroupName = json['companyGroupName'];
    branchOfficeId = json['branchOfficeId'];
    branchOfficeName = json['branchOfficeName'];
    currentLifeCycle = json['currentLifeCycle'];
    timesRetreaded = json['timesRetreaded'];
    maxRetreadsExpected = json['maxRetreadsExpected'];
    recommendedPressure = json['recommendedPressure'];
    currentPressure = json['currentPressure'];
    dot = json['dot'];
    purchaseCost = json['purchaseCost'];
    newTire = json['newTire'];
    status = json['status'];
    createdAt = json['createdAt'];
    tireSize = TireSize.fromJson(json['tireSize']);
    make = Make.fromJson(json['make']);
    model = Model.fromJson(json['model']);
    currentRetread = json['currentRetread'] != null ? CurrentRetread.fromJson(json['currentRetread']) : null;
    disposal = json['disposal'] != null ? Disposal.fromJson(json['disposal']) : null;
    registrationImages = List.castFrom<dynamic, dynamic>(json['registrationImages']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['serialNumber'] = serialNumber;
    _data['companyGroupId'] = companyGroupId;
    _data['companyGroupName'] = companyGroupName;
    _data['branchOfficeId'] = branchOfficeId;
    _data['branchOfficeName'] = branchOfficeName;
    _data['currentLifeCycle'] = currentLifeCycle;
    _data['timesRetreaded'] = timesRetreaded;
    _data['maxRetreadsExpected'] = maxRetreadsExpected;
    _data['recommendedPressure'] = recommendedPressure;
    _data['currentPressure'] = currentPressure;
    _data['dot'] = dot;
    _data['purchaseCost'] = purchaseCost;
    _data['newTire'] = newTire;
    _data['status'] = status;
    _data['createdAt'] = createdAt;
    _data['tireSize'] = tireSize.toJson();
    _data['make'] = make.toJson();
    _data['model'] = model.toJson();
    _data['currentRetread'] = currentRetread?.toJson();
    _data['disposal'] = disposal?.toJson();
    _data['registrationImages'] = registrationImages;
    return _data;
  }
}

class TireSize {
  TireSize({
    required this.id,
    required this.height,
    required this.width,
    required this.rim,
  });
  late final int id;
  late final double height;
  late final double width;
  late final double rim;
  
  TireSize.fromJson(Map<String, dynamic> json){
    id = json['id'];
    height = json['height'];
    width = json['width'];
    rim = json['rim'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['height'] = height;
    _data['width'] = width;
    _data['rim'] = rim;
    return _data;
  }
}

class Make {
  Make({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;
  
  Make.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}

class Model {
  Model({
    required this.id,
    required this.name,
    required this.groovesQuantity,
    required this.treadDepth,
  });
  late final int id;
  late final String name;
  late final dynamic groovesQuantity;
  late final dynamic treadDepth;
  
  Model.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    groovesQuantity = json['groovesQuantity'];
    treadDepth = json['treadDepth'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['groovesQuantity'] = groovesQuantity;
    _data['treadDepth'] = treadDepth;
    return _data;
  }
}

class CurrentRetread {
  CurrentRetread({
    required this.make,
    required this.model,
    required this.retreadCost,
  });
  late final Make make;
  late final Model model;
  late final dynamic retreadCost;
  
  CurrentRetread.fromJson(Map<String, dynamic> json){
    make = Make.fromJson(json['make']);
    model = Model.fromJson(json['model']);
    retreadCost = json['retreadCost'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['make'] = make.toJson();
    _data['model'] = model.toJson();
    _data['retreadCost'] = retreadCost;
    return _data;
  }
}

class Disposal {
  Disposal({
    required this.disposalReasonId,
    required this.disposalReasonDescription,
    required this.disposalImagesUrl,
  });
  late final int disposalReasonId;
  late final String disposalReasonDescription;
  late final List<dynamic> disposalImagesUrl;
  
  Disposal.fromJson(Map<String, dynamic> json){
    disposalReasonId = json['disposalReasonId'];
    disposalReasonDescription = json['disposalReasonDescription'];
    disposalImagesUrl = List.castFrom<dynamic, dynamic>(json['disposalImagesUrl']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['disposalReasonId'] = disposalReasonId;
    _data['disposalReasonDescription'] = disposalReasonDescription;
    _data['disposalImagesUrl'] = disposalImagesUrl;
    return _data;
  }
}
