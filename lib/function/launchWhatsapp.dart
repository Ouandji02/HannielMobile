import 'package:url_launcher/url_launcher.dart';

void launchWhatsApp(number) async{
  var url = Uri.parse('mailto:'+number);
  if (await canLaunchUrl(url)) {
  await launchUrl(url);
  }else{
  print("Nous ne pouvons pas lancer ce lien");
  }
}