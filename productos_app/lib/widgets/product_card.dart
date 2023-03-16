import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product ;



  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin:  EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage(product.picture),
            _ProductDetails(
              title: product.name,
              subTitle: product.id!,
            ),
             Positioned(
              top: 0,
               right: 0,
                child: _PriceTag(product.price)
                ),
            //mostrar de manera condicional 
            if(!product.available)
              const Positioned(top: 0, left: 0, child: _NotAvailable())
          ],
        ),
        //color: Colors.red,
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
          ]);
}

class _BackgroundImage extends StatelessWidget {

  final  String? url;
  const _BackgroundImage(this.url);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      // ignore: sized_box_for_whitespace
      child: Container(
        width: double.infinity,
        height: 400,
        child: url == null
        ? const Image(image: AssetImage('assets/no-image.png'),
        fit: BoxFit.cover,
        )
        : FadeInImage(
          //fix productos cuando no hay imagens
          placeholder: const AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(url!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {

  final String title ;
  final String subTitle;
  const _ProductDetails({
    Key? key, required this.title, required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        // color: Colors.deepOrange,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
             subTitle,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), topRight: Radius.circular(20)),
      );
}

class _PriceTag extends StatelessWidget {
  final double price;
  const _PriceTag(this.price,
  ) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomLeft: Radius.circular(20))),
      child:  FittedBox(
        fit: BoxFit.contain,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text('\$$price',
                style: const TextStyle(color: Colors.white, fontSize: 20))),
      ),
    );
  }
}

class _NotAvailable extends StatelessWidget {
  const _NotAvailable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.yellow[800],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'No disponible',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
