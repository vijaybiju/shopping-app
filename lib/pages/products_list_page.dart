import 'package:flutter/material.dart';
import 'package:e_commerce/widgets/products_list_item.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "PRODUCT LIST",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          label: const Text('Logout'),
          icon: const Icon(Icons.thumb_up),
          onPressed: () {
            FirebaseAuth.instance.signOut();
            // Add your onPressed code here!
            print("hello");
          }),
      body: _buildProductsListPage(),
    );
  }

  _buildProductsListPage() {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey[100],
      child: ListView.builder(
        itemCount: 32,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildFilterWidgets(screenSize);
          } else if (index == 4) {
            return SizedBox(
              height: 12.0,
            );
          } else {
            return _dummyProductsList()[index];
          }
        },
      ),
    );
  }

  _buildFilterWidgets(Size screenSize) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      width: screenSize.width,
      child: Card(
        elevation: 4.0,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildFilterButton("SORT"),
              Container(
                color: Colors.black,
                width: 2.0,
                height: 24.0,
              ),
              _buildFilterButton("REFINE"),
            ],
          ),
        ),
      ),
    );
  }

  _buildFilterButton(String title) {
    return InkWell(
      onTap: () {
        print(title);
      },
      child: Row(
        children: <Widget>[
          Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          SizedBox(
            width: 2.0,
          ),
          Text(title),
        ],
      ),
    );
  }

  _dummyProductsList() {
    return [
      //i.ibb.co/5Ltwjpn/image.png",

      ProductsListItem(
          name: "Shoes",
          currentPrice: 599,
          originalPrice: 699,
          discount: 25,
          imageUrl:
              "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80"),
      ProductsListItem(
          name: "Shoes",
          currentPrice: 599,
          originalPrice: 699,
          discount: 25,
          imageUrl:
              "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80"),
      ProductsListItem(
          name: "Sandles",
          currentPrice: 599,
          originalPrice: 699,
          discount: 25,
          imageUrl:
              "https://ae01.alicdn.com/kf/HTB1tYKJbtzvK1RkSnfoq6zMwVXa5/2019-New-Men-Sandals-Genuine-Leather-Cowhide-Men-Sandals-Summer-Quality-Beach-Slippers-Casual-Sneakers-Outdoor.jpg"),
      ProductsListItem(
          name: "T-Shirt",
          currentPrice: 249,
          originalPrice: 349,
          discount: 25,
          imageUrl:
              "https://images.unsplash.com/photo-1562157873-818bc0726f68?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=282&q=80"),

      ProductsListItem(
          name: "Pants",
          currentPrice: 549,
          originalPrice: 649,
          discount: 25,
          imageUrl:
              "https://images.unsplash.com/photo-1605518216938-7c31b7b14ad0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80"),
      ProductsListItem(
        name: "Watch",
        currentPrice: 999,
        originalPrice: 1099,
        discount: 25,
        imageUrl:
            "https://images.unsplash.com/photo-1585123334904-845d60e97b29?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8d2F0Y2hlc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
      ),
      ProductsListItem(
          name: "Headphones",
          currentPrice: 1299,
          originalPrice: 1399,
          discount: 25,
          imageUrl:
              "https://images.unsplash.com/photo-1484704849700-f032a568e944?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aGVhZHBob25lc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      ProductsListItem(
          name: "Sunglasses",
          currentPrice: 799,
          originalPrice: 899,
          discount: 25,
          imageUrl:
              "https://images.unsplash.com/photo-1608539733292-190446b22b83?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c3VuZ2xhc3Nlc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      ProductsListItem(
          name: "Sanitizer",
          currentPrice: 99,
          originalPrice: 149,
          discount: 25,
          imageUrl:
              "https://images.unsplash.com/photo-1584744982491-665216d95f8b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fHNhbml0aXplcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      ProductsListItem(
          name: "Mask",
          currentPrice: 50,
          originalPrice: 99,
          discount: 25,
          imageUrl:
              "https://images.unsplash.com/photo-1584634731339-252c581abfc5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bWFza3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      ProductsListItem(
          name: "School Bag",
          currentPrice: 999,
          originalPrice: 1999,
          discount: 25,
          imageUrl:
              "https://ae01.alicdn.com/kf/HTB1ZVuEPFXXXXauXFXXq6xXFXXXw/2018-New-Children-School-Bag-Alleviate-Burdens-Unisex-Kids-Backpack-Casual-Bags-Backpacks-For-Teenage-Orthopedic.jpg"),
      ProductsListItem(
          name: "Ladies Bag",
          currentPrice: 1299,
          originalPrice: 1399,
          discount: 25,
          imageUrl:
              "https://i.ebayimg.com/images/i/122358638292-0-1/s-l1000.jpg"),
      ProductsListItem(
          name: "Water Bottles",
          currentPrice: 249,
          originalPrice: 349,
          discount: 25,
          imageUrl:
              "https://www.keepitpersonal.co.uk/images/large/11896_LRG.jpg"),
      ProductsListItem(
          name: "Flask",
          currentPrice: 699,
          originalPrice: 799,
          discount: 25,
          imageUrl:
              "https://www.sportsmans.com/medias/stanley-15-quart-classic-legendary-bottle-nightfall-1537161-2.jpg?context=bWFzdGVyfGltYWdlc3w3NTExMHxpbWFnZS9qcGVnfGltYWdlcy9oOWYvaDY1LzkwNTE1OTA5NTA5NDIuanBnfDkwMzdmMjJhYTQwNjFjYTI4OGJhOTRiMzNjNTliZTQxYmQ1MGIyNmU5ZDVjODA0MDQ5ZWM3NTQzYjNhZmQ3YzQ"),
      ProductsListItem(
          name: "Power Bank",
          currentPrice: 1499,
          originalPrice: 1599,
          discount: 25,
          imageUrl:
              "https://cdn.wccftech.com/wp-content/uploads/2018/08/RAVPower-26800-USB-PD-power-bank.jpg"),
      ProductsListItem(
          name: "Steam Iron Box",
          currentPrice: 2499,
          originalPrice: 2599,
          discount: 25,
          imageUrl:
              "https://th.bing.com/th/id/OIP.ReC7yr11I2u7wqN37jN5WAHaG8?pid=ImgDet&rs=1"),
      ProductsListItem(
          name: "Trimmer",
          currentPrice: 999,
          originalPrice: 1199,
          discount: 25,
          imageUrl:
              "https://th.bing.com/th/id/Radf0b5769f43408a5874661012cbe24e?rik=USviSp82lCpy1Q&riu=http%3a%2f%2fimages.beardtrimmer.biz%2fl-m%2fnew-beard-trimmer-adjustable-length-series-3500-v-987964269.jpg&ehk=DE8c3OwdeyUOiwNZhWoZGbyJ%2fNdGjvywp6bON2YQqpg%3d&risl=&pid=ImgRaw"),
      ProductsListItem(
          name: "Vacuum Cleaner",
          currentPrice: 4999,
          originalPrice: 5199,
          discount: 25,
          imageUrl:
              "https://institute.wycliffecollege.ca/wp-content/uploads/vacuum-cleaner-edited.jpg"),
      ProductsListItem(
          name: "Emergency Light",
          currentPrice: 799,
          originalPrice: 899,
          discount: 25,
          imageUrl:
              "https://th.bing.com/th/id/OIP.ye48HmJlz7ish4BTTtJPhwHaHa?pid=ImgDet&rs=1"),
      ProductsListItem(
          name: "Umberlla",
          currentPrice: 449,
          originalPrice: 549,
          discount: 25,
          imageUrl:
              "https://new.uniquejapan.com/wp-content/uploads/2010/03/Black-Soryu.jpg"),
      ProductsListItem(
          name: "Pulse OxiMeter",
          currentPrice: 1999,
          originalPrice: 2199,
          discount: 25,
          imageUrl:
              "https://choicemandu-images.s3.ap-south-1.amazonaws.com/cache/catalog/ABP/oximeter-1000x1000.jpg"),
      ProductsListItem(
          name: "Dinner Plate Set",
          currentPrice: 699,
          originalPrice: 799,
          discount: 25,
          imageUrl:
              "https://th.bing.com/th/id/R665d4f706be09f978ec410167d38e69c?rik=R%2fOFrBd41VkrEA&riu=http%3a%2f%2fwww.gorge.net.au%2fwp-content%2fuploads%2f2016%2f07%2fDinner-Plate-Sets.jpg&ehk=S%2bjdphtiHOtrVevS96BFXScHKxeBuQLFSz4ETQ7Lqzw%3d&risl=&pid=ImgRaw"),
      ProductsListItem(
          name: "Bed Sheets",
          currentPrice: 499,
          originalPrice: 549,
          discount: 25,
          imageUrl:
              "https://ae01.alicdn.com/kf/HTB1MoIibBcHL1JjSZFBq6yiGXXad/FADFAY-100-Cotton-Bedding-Set-4pcs-Rose-Floral-Duvet-Cover-Bed-Sheet-Deep-Pocket-Fitted-Sheet.jpg"),
      ProductsListItem(
          name: "Curtains",
          currentPrice: 749,
          originalPrice: 849,
          discount: 25,
          imageUrl:
              "https://n4.sdlcdn.com/imgs/a/7/4/Homefab-India-Blue-Polyester-Window-SDL687916143-1-f18cf.jpg"),
      ProductsListItem(
          name: "Clock",
          currentPrice: 449,
          originalPrice: 549,
          discount: 25,
          imageUrl:
              "https://images-na.ssl-images-amazon.com/images/I/617fJUttv1L._SX679_.jpg"),
      ProductsListItem(
          name: "Decorative Lamp",
          currentPrice: 249,
          originalPrice: 349,
          discount: 25,
          imageUrl:
              "https://i.pinimg.com/736x/c8/de/ad/c8deadcc4427576f111f4dd2e2df036b.jpg"),
      ProductsListItem(
          name: "Carpets",
          currentPrice: 449,
          originalPrice: 549,
          discount: 25,
          imageUrl:
              "https://cdn.nazmiyalantiquerugs.com/wp-content/uploads/2020/01/rug-over-carpet-orange.jpg"),
      ProductsListItem(
          name: "Rain Coats",
          currentPrice: 1249,
          originalPrice: 1349,
          discount: 25,
          imageUrl:
              "https://th.bing.com/th/id/Rbe85fe547db689ef8eaa4316cb0357aa?rik=oAcId%2bww5ENI9Q&riu=http%3a%2f%2fi.ebayimg.com%2fimages%2fi%2f172220078565-0-1%2fs-l1000.jpg&ehk=zf2Y7ABkrVLs9ma3gDGWvguyhF%2bTX0kWHDpJwA2w8us%3d&risl=&pid=ImgRaw"),
      ProductsListItem(
          name: "Travel Bags",
          currentPrice: 2499,
          originalPrice: 3499,
          discount: 25,
          imageUrl:
              "https://www.theski-shop.co.uk/images/2017w-10000783-splitroller100l-tabor-dakine.jpg?maxheight=1200"),
      ProductsListItem(
          name: "Air Cooler",
          currentPrice: 6499,
          originalPrice: 7499,
          discount: 25,
          imageUrl:
              "https://th.bing.com/th/id/OIP.IVPEPZPan6rQqAKZktB2gAHaGh?pid=ImgDet&rs=1"),
      ProductsListItem(
          name: "Deodrant Spray",
          currentPrice: 249,
          originalPrice: 299,
          discount: 25,
          imageUrl:
              "https://post.healthline.com/wp-content/uploads/2019/05/Perfume_Bottles-1200x628-Facebook.jpg"),
      ProductsListItem(
          name: "Pants",
          currentPrice: 549,
          originalPrice: 649,
          discount: 25,
          imageUrl:
              "https://images.unsplash.com/photo-1605518216938-7c31b7b14ad0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80"),
    ];
  }
}
