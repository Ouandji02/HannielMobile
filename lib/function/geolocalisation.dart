import 'package:url_launcher/url_launcher.dart';

void geolocalisation(lat1, long1, lat2, long2) async {
  var url = Uri.parse('https://www.google.com/maps/dir/?api=1&origin=' +
      lat2.toString() +
      ',' +
      long2.toString() +
      '&destination=' +
      lat1.toString() +
      ',' +
      long1.toString() +
      '+&travelmode=driving');

  print(url);

  if (await canLaunchUrl(url,)) {
    await launchUrl(url,mode: LaunchMode.externalApplication);
  }else{
    print("Nous ne pouvons pas lancer ce lien");
  }
}
