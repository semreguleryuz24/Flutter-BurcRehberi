import 'package:burc_project/burc_detay.dart';
import 'package:burc_project/model/burc.dart';
import 'package:flutter/material.dart';

class BurcItem extends StatelessWidget {
  final Burc listelenenBurc;
  const BurcItem({required this.listelenenBurc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;
    return Card(
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Padding(
          padding: EdgeInsets.all(4),
          child: ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      BurcDetay(seciliBurcDetay: listelenenBurc),
                ));
              },
              leading: Image.asset(
                'images/images/' + listelenenBurc.burcKucukResim,
              ),
              title: Text(
                listelenenBurc.burcAdi,
                style: myTextStyle.headline6,
              ),
              subtitle: Text(
                listelenenBurc.burcTarih,
                style: myTextStyle.subtitle1,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.pink,
              )),
        ),
      ),
    );
  }
}
