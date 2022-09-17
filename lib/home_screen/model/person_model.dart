class PersonModel {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Data>? data;

  PersonModel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
  });

  PersonModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['per_page'] = perPage;
    data['total'] = total;
    data['total_pages'] = totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? img;
  String? until;
  String? amount;
  String? outOfAmount;

  Data(
      {this.id,
      this.name,
      this.img,
      this.until,
      this.amount,
      this.outOfAmount});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
    img = json['Img'];
    until = json['Until'];
    amount = json['Amount'];
    outOfAmount = json['OutOfAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Name'] = name;
    data['Img'] = img;
    data['Until'] = until;
    data['Amount'] = amount;
    data['OutOfAmount'] = outOfAmount;
    return data;
  }
}
