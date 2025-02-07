import 'package:ecommerce_delivery/src/pages/delivery/orders/list/delivery_orders_list_controller.dart';
import 'package:ecommerce_delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
class DeliveryOrdersListPage extends StatefulWidget {
  const DeliveryOrdersListPage({Key key}) : super(key: key);

  @override
  _DeliveryOrdersListPageState createState() => _DeliveryOrdersListPageState();
}

class _DeliveryOrdersListPageState extends State<DeliveryOrdersListPage> {

  DeliveryOrdersListController _con= new DeliveryOrdersListController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context,refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.key,
      appBar: AppBar(
          leading: _menuDrawer()
      ),
      drawer: _drawer(),
      body: Center(
        child: Text('Delivery orders list'),
      ),
    );
  }
  Widget _menuDrawer(){
    return GestureDetector(
      onTap: _con.openDrawer,
      child: Container(
        margin: EdgeInsets.only(left: 30),
        alignment: Alignment.centerLeft,
        child: Image.asset('assets/img/menu.png',width: 20,height: 20),
      ),
    );
  }
  Widget _drawer(){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  color: MyColors.primaryColor
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nombre de usuario',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                    maxLines: 1,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[200],
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic
                    ),
                    maxLines: 1,
                  ),
                  Text(
                    'Telefono',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[200],
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic
                    ),
                    maxLines: 1,
                  ),
                  Container(
                    height: 60,
                    width: 80,
                    margin: EdgeInsets.only(top: 10),
                    child: FadeInImage(
                        image: AssetImage('assets/img/no-image.png'),
                        fit: BoxFit.contain,
                        fadeInDuration: Duration(milliseconds: 50),
                        placeholder: AssetImage('ssets/img/no-image.png')
                    ),
                  )
                ],
              )
          ),
          _con.user != null ? _con.user.roles.length > 1 ?
          ListTile(
            onTap: _con.goToRoles,
            title: Text('Seleccionar rol'),
            trailing: Icon(Icons.person_outline),
          ): Container(): Container(),
          ListTile(
            onTap: _con.logout,
            title: Text('Cerrar sesion'),
            trailing: Icon(Icons.power_settings_new),
          )
        ],
      ),
    );
  }
  void refresh(){
    setState((){});
  }
}
