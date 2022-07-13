import 'package:url_launcher/url_launcher.dart';

void launchCall(number) async {
  var tel = Uri.parse('tel:$number');
  if (await canLaunchUrl(tel)) {
    await launchUrl(tel,mode: LaunchMode.externalApplication);
  } else {
    print("Nous ne pouvons pas lancer ce lien");
  }
}
