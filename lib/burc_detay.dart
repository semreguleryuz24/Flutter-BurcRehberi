import 'package:burc_project/model/burc.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc seciliBurcDetay;
  const BurcDetay({required this.seciliBurcDetay, Key? key}) : super(key: key);

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appbarRengi = Colors.transparent;
  late PaletteGenerator
      _generator; //Mutlaka inittalize etmemiz gerekecek olan yerler.Late ile hata verme bn seni init edeceğim demek.
  @override
  void initState() {
    // TODO: implement initState//Bu state bir kere çalışıyor. Alttaki widget ne kadar çağırılırsa fark etmiyor.Ondan daha önce çalışıyor.
    //Değişkenlerimizin ilk atamalarını yaparken kullanıyoruz.
    super.initState();
    appBarrenginiBul();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            backgroundColor: appbarRengi,
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                  widget.seciliBurcDetay.burcAdi + ' Burcu ve Özellikleri'),
              centerTitle: true,
              background: Image.asset(
                'images/images/' + widget.seciliBurcDetay.burcBuyukResim,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            //Sliver içerisine single türünde tanımlamak için böyle bir yapı kullandım.
            child: Container(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Text(widget.seciliBurcDetay.burcDetayi,
                    style: Theme.of(context).textTheme.subtitle2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void appBarrenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage('images/images/${widget.seciliBurcDetay.burcBuyukResim}'));
    appbarRengi = _generator.dominantColor!.color;
    print(appbarRengi);
    setState(() {});
  }
}
