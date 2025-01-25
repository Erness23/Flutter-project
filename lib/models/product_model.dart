class ProductModel {
  var id;
  var pname;
  var pdescription;
  var pimage;
  var price;

  ProductModel({
    required this.id,
    required this.pname,
    required this.pdescription,
    required this.pimage,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['product_id'],
      pname: json['product_name'],
      pdescription: json['product_desc'],
      pimage: json['product_image'],
      price: json['product_price'],
    );
  }
}
