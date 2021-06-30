
  class Product {
    final String id;
    final String title;
    final String description;
    final double price;
    final String imageUrl;
    bool isFavourite = false;

    Product(this.id, this.title, this.description, this.price, this.imageUrl);

    Product.otherProduct(this.id, this.title, this.description, this.price, this.imageUrl, this.isFavourite);

  }