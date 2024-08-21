class Products {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductModel> _products;
  List<ProductModel> get products => _products;

  Products(
      {required totalSize,
      required typeId,
      required offset,
      required products}) {
    _totalSize = totalSize;
    _typeId = typeId;
    _offset = offset;
    _products = products;
  }

  Products.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];

    // List of maps
    if (json['products'] != null) {
      //print(_products);
      // Initialize product list with empty array
      _products = <ProductModel>[];
      print(_products);
      json['products'].forEach((v) {
        // Add each list item
        _products.add(ProductModel.fromJson(v));
        //List<ProductModel>;
      });
    }
  }
}

class ProductModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? created;
  String? updated;
  int? typeId;

  // Constructor
  ProductModel(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.stars,
      this.img,
      this.location,
      this.created,
      this.updated,
      this.typeId});

  // ProductModel when its called create and return an object
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    created = json['created'];
    updated = json['updated'];
    typeId = json['type_id'];
  }

  get popularProductList => null;
}
