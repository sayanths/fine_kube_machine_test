class ModelClass {
  String name;
  String? image;
  String? until;
  String? amount;
  String? outOfAmount;

  ModelClass({
    required this.name,
    this.image,
    this.amount,
    this.outOfAmount,
    this.until,
  });

  factory ModelClass.fromJson(Map<String, dynamic> json) {
    return ModelClass(
      name: json['Name'],
      image: json['Img'],
      amount: json['Amount'],
      outOfAmount: json['OutOfAmount'],
      until: json['Until'],
    );
  }

//to send data to the json
  Map<String, dynamic> toJson() => {
        'Name': name,
        'Img': image,
        'Amount': amount,
        'OutOfAmount': outOfAmount,
        'Until': until,
      };
}
