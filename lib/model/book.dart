class Book{
  int? id;
  String? bookName;
  String? bookAuthor;
  int? bookPrice;

  Book({this.bookName, this.bookAuthor, this.bookPrice});

  Book.fromMap(Map<String, dynamic> data){
    id= data['id'];
    bookName = data['bookName'];
    bookAuthor = data['bookAuthor'];
    bookPrice = data['bookPrice'];
  }

  Map<String, dynamic>toMap()=>{
    'id': id,
    'bookName': bookName,
    'bookAuthor': bookAuthor,
    'bookPrice': bookPrice
  };
}