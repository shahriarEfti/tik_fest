import 'package:get/get.dart';

class TicketListControler extends GetxController {
  final List<Map<String, String>> tickets = [
  {'imageUrl': 'https://storage.googleapis.com/bookmepk/static/custom/upload/events/bg/raya-atif111023.jpg',
  'date': '2024-12-01',
  'title': 'Concert Night',
  'location': 'Dhaka, Bangladesh',
},
{
'imageUrl': 'https://www.radioandmusic.com/sites/www.radioandmusic.com/files/images/entertainment/2022/12/09/darshan1.jpg',
'date': '2024-12-15',
'title': 'Art Festival',
'location': 'Chittagong, Bangladesh',
},
{
'imageUrl': 'https://img.freepik.com/free-psd/poster-template-creative-corporate-team_23-2148846295.jpg',
'date': '2025-01-10',
'title': 'Tech Expo',
'location': 'Sylhet, Bangladesh',
},
];

void buyTicket(String title) {
  Get.snackbar('Ticket Purchased', 'You bought a ticket for $title');
}
}