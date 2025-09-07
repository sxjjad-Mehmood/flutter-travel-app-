class Message {
  String name;
  String date;
  String description;
  String vendorImage; // Path to image asset
  String duration;
  String image;

  Message(
      {required this.name,
      required this.date,
      required this.description,
      required this.vendorImage,
      required this.duration,
      required this.image});
}

// 📦 Sample list of messages with image paths
List<Message> messages = [
  Message(
      name: 'Andera',
      date: '2025-08-15',
      description: 'Your flight to Dubai with Emirates is confirmed.',
      vendorImage:
          'https://tse3.mm.bing.net/th/id/OIP.9dQRtJWL3gNN1SwW9WBd2QHaE8?pid=Api&P=0&h=220',
      duration: '2 min ago',
      image:
          "https://www.shutterstock.com/shutterstock/photos/2195504819/display_1500/stock-photo-modern-homes-and-town-houses-2195504819.jpg"),
  Message(
      name: 'Ava addam',
      date: '2025-08-14',
      description: 'Your stay at Hilton Downtown is booked.',
      vendorImage:
          'https://tse4.mm.bing.net/th/id/OIP.6os-g1iiVTtvZcViGb0KdgHaDt?pid=Api&P=0&h=220',
      duration: '5 min ago',
      image:
          "https://images.pexels.com/photos/2111757/pexels-photo-2111757.jpeg"),
  Message(
      name: 'Bradely',
      date: '2025-08-13',
      description: 'Your travel itinerary has been updated.',
      vendorImage:
          'https://tse2.mm.bing.net/th/id/OIP.RUIF8BlF4jrr6mTpCsjJmgHaHa?pid=Api&P=0&h=220',
      duration: '10 min ago',
      image:
          "https://images.pexels.com/photos/7746560/pexels-photo-7746560.jpeg"),
  Message(
      name: 'Yahya KHAN',
      date: '2025-08-12',
      description: 'Your airport pickup is scheduled at 6:00 AM.',
      vendorImage:
          'https://tse4.mm.bing.net/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgHaLH?pid=Api&P=0&h=220',
      duration: '15 min ago',
      image:
          "https://images.pexels.com/photos/247532/pexels-photo-247532.jpeg"),
];
