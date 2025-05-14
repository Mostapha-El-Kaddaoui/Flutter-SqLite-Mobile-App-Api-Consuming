class Book {
    final String id;
    final String title;
    final List<String> authors;
    final String subtitle;
    final String thumbnail;

    Book({
        required this.id,
        required this.title,
        required this.authors,
        required this.subtitle,
        required this.thumbnail,
    });

   
    factory Book.fromJson(Map<String, dynamic> json){
        final volumeInfo = json['volumeInfo'] ?? {};
        final imageLinks = volumeInfo['imageLinks'] ?? {};

        return Book(
            id: json['id'] ?? '',
            title: volumeInfo['title'] ?? '',
            authors: List<String>.from(volumeInfo['authors'] ?? []),
            subtitle: volumeInfo['subtitle'] ?? '',
            thumbnail: imageLinks['thumbnail'] ?? '', // Extraction du thumbnail
        );
    }


}