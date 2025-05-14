import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import './db_service.dart';
import './book.dart';
// function to trigger the build process
void main() {
  //MaterialApp
  runApp(const MyApp()); // Now works with tests
}

// ignore: non_constant_identifier_names
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
    home: Scaffold(
      
      appBar: AppBar(
        title: Text(
          "Mohammedia NEWs",
          style: GoogleFonts.poppins(
            fontSize: 20,
          ),
        ),
        titleSpacing:00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        elevation: 14.0,
        backgroundColor: const Color.fromARGB(255, 0, 9, 32),
        foregroundColor: Colors.white,
      ),
      
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 9, 32),
                border: Border(bottom: BorderSide.none),
              ),
              accountName: Text(
                "M. Achraf",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              accountEmail: Text(
                "Info@Achraf.org",
                style: GoogleFonts.poppins(
                  color: Color.fromARGB(255, 223, 223, 223),
                  fontSize: 14,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: Text(
                      ' Home ',
                      style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 0, 9, 32),
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.book),
                    title: Text(
                      ' Books ',
                      style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 0, 9, 32),
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.favorite),
                    title: Text(
                      ' Fivorites ',
                      style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 0, 9, 32),
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey[300]!)),
              ),
              child: Center(
                child: Text(
                  "Version 1.0.0 • © 2023",
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),

      body: FutureBuilder<List<Book>>(
        future: ApiService.fetchBooks(),
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No books available'));
            }
            final books = snapshot.data!;
            return Padding(
              padding: EdgeInsets.all(2),
              child: GridView.count(
                crossAxisCount: 2, // Number of columns
                padding: EdgeInsets.all(2),
                crossAxisSpacing: 4,
                mainAxisSpacing: 10,
                childAspectRatio: 0.5,
                children: List.generate(
                  books.length,
                  (index){
                    final book = books[index];
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IntrinsicHeight( 
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                            flex: 3,
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                              child: Image.network(
                                //probleme avec l'att : 
                                //book.thumbnail,
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQw51g1gMBrZN3FbN17flaY_YSYmTMGuudh3Q&s',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 150, // Fill the available space
                              ),
                            ),
                          ),
                            Padding(
                              padding: EdgeInsets.all(10),
                            child:Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children:[
                                Text(
                                  book.title,
                                  style: GoogleFonts.poppins(
                                    color: Color.fromARGB(255, 0, 9, 32),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                  ),
                                  maxLines: 2,  // Limite à 2 lignes maximum
                                  overflow: TextOverflow.ellipsis, 
                                ),
                                Text(
                                  book.title,
                                  style: GoogleFonts.poppins(
                                    color: Color.fromARGB(255, 0, 9, 32),
                                    fontSize: 14,
                                  ),
                                  maxLines: 3,  // Limite à 2 lignes maximum
                                  overflow: TextOverflow.ellipsis, 
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.star, color:Colors.yellow),
                                        Icon(Icons.star, color:Colors.yellow),
                                        Icon(Icons.star, color:Colors.yellow),
                                        Icon(Icons.star, color:Colors.yellow),
                                        Icon(Icons.star, color:Colors.yellow),
                                        
                                      ],
                                    ),
                                    Container(
                                      child:Text(
                                        '230\$',
                                        style: GoogleFonts.poppins(
                                          color: Color.fromARGB(255, 0, 9, 32),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                            
                                ],
                              ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 10,
                                right: 10
                              ),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 0,
                                      horizontal:20
                                    ),
                                    backgroundColor: Color.fromARGB(255, 0, 53, 189),
                                  ),
                                  
                                  onPressed: (){
                                  
                                  },
                                  child: Text(
                                    'More',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                    
                      ),
                    );              
                  
                  }
            
                ),
              ),
      
            );
          },
        ), 

    ), 
    
    //Removing Debug Banner
    debugShowCheckedModeBanner: false, 
  );
  }
}