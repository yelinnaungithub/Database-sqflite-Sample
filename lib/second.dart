import 'package:db_train/helpers/database_helper.dart';
import 'package:db_train/model/book.dart';
import 'package:flutter/material.dart';

class Second extends StatefulWidget {

  Book? book;
   Second({this.book});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {

  DatabaseHelper databaseHelper = DatabaseHelper();
  TextEditingController bookNameController = TextEditingController();
  TextEditingController bookAuthorController = TextEditingController();
  TextEditingController bookPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bookNameController.text = widget.book!.bookName!;
    bookAuthorController.text = widget.book!.bookAuthor!;
    bookPriceController.text = widget.book!.bookPrice!.toString();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Database'),),
      body: Column(
          children: [
                const  SizedBox(height: 30,),
    
            Container(
                  margin: const EdgeInsets.only(left: 30,right: 30),
                  padding: const EdgeInsets.only(left: 15,right: 10),
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Colors.black26
                      )
                    ]
                  ),
                  child:  TextField(
                    controller: bookNameController,
                    onSubmitted: (value) => bookNameController.text = value,
                    decoration: const InputDecoration(
                      hintText: 'Write Book Name',
                      hintStyle: TextStyle(color: Colors.greenAccent,fontSize: 22),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                     // suffixIcon: Icon(Icons.search,color: Colors.greenAccent,size: 35,)
                    ),
                  ),
                ),
    
                const SizedBox(height: 30,),
                
            Container(
                  margin: const EdgeInsets.only(left: 30,right: 30),
                  padding: const EdgeInsets.only(left: 15,right: 10),
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Colors.black26
                      )
                    ]
                  ),
                  child:  TextField(
                    controller: bookAuthorController,
                    onSubmitted: (value) => bookAuthorController.text = value,
                    decoration: const InputDecoration(
                      hintText: 'Write Book Author Name',
                      hintStyle: TextStyle(color: Colors.greenAccent,fontSize: 22),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                     // suffixIcon: Icon(Icons.search,color: Colors.greenAccent,size: 35,)
                    ),
                  ),
                ),
    
              const  SizedBox(height: 30,),
    
            Container(
                  margin: const EdgeInsets.only(left: 30,right: 30),
                  padding: const EdgeInsets.only(left: 15,right: 10),
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Colors.black26
                      )
                    ]
                  ),
                  child:  TextField(
                    controller: bookPriceController,
                    onSubmitted: (value) => bookPriceController.text = value,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Write Book Prices',
                      hintStyle: TextStyle(color: Colors.greenAccent,fontSize: 22),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                     // suffixIcon: Icon(Icons.search,color: Colors.greenAccent,size: 35,)
                    ),
                  ),
                ),
    
               const SizedBox(height: 30,),
    
        
            ElevatedButton( 
              onPressed: () async{
                Book book = Book(
                  bookName: bookNameController.text,
                  bookAuthor: bookAuthorController.text,
                  bookPrice: int.parse(bookPriceController.text)
                );

                int result = 0;

                if(widget.book == null){
                   result = await databaseHelper.insertData(book);
                }else{
                   result = await databaseHelper.updatetData(book,widget.book!.id!);
                   Navigator.pop(context);
                }
              }, 
              
            child:  Text(widget.book == null ? 'Save' : 'Update'))
          ],
        ),
    );
  }
}