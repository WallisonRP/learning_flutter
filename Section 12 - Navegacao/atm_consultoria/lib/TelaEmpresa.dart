// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TelaEmpresa extends StatefulWidget {
  @override
  State<TelaEmpresa> createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Empresa"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
          children: [
            Row(
              children: [
                Image.asset("images/detalhe_empresa.png"),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                  "Sobre a empresa",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.deepOrange
                  ),
                ),
                  )
                ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin id elementum est. Fusce sed iaculis metus. Nunc ultrices odio in porttitor cursus. Nulla urna mauris, ornare a mauris quis, porta euismod lectus. Fusce ullamcorper, augue sed pellentesque ultricies, purus ex consectetur lectus, eu feugiat ex tellus ac elit. Vestibulum a turpis dui. Curabitur sit amet arcu et metus convallis accumsan. Donec vitae malesuada lacus, nec posuere massa. Fusce est metus, mollis non ligula a, hendrerit pellentesque nunc. Nulla facilisi. Ut cursus venenatis tortor ut finibus.Donec eget tortor a nibh tempor viverra. Cras rutrum sed sapien at finibus. In in urna porta, dapibus mauris nec, placerat nibh. Proin mattis turpis vel erat bibendum, a finibus diam consequat. Duis finibus, elit ut elementum imperdiet, metus dui blandit leo, sit amet ultricies augue lorem et odio. Vivamus dictum arcu vel sem commodo, ac volutpat odio accumsan. Cras ultricies quam sed dictum facilisis. Donec vitae aliquam ligula, vel cursus lacus. Proin vel nulla ut tellus ultricies dignissim id at purus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed sodales tristique nisi, eget bibendum nulla fringilla non. Mauris ligula odio, consectetur in risus id, ultricies elementum justo. Nulla vitae sollicitudin orci, ut porttitor nunc. Fusce est massa, porta ac augue non, laoreet scelerisque dolor. Aliquam magna mi, gravida sed nunc sed, porttitor tristique eros.Vivamus finibus nulla in ex elementum tempus. Sed fringilla quam ultricies varius finibus. Aenean accumsan rhoncus rutrum. Aliquam in lobortis neque, quis suscipit orci. Cras venenatis ipsum orci, id pharetra metus dapibus eget. Vivamus nec commodo velit. In eros urna, suscipit eget sapien id, tempus volutpat lorem. Maecenas venenatis, nisl ut ornare vulputate, justo felis convallis arcu, ac accumsan felis massa a arcu. Donec sed justo tempor, volutpat tellus at, gravida urna. In sit amet magna et turpis tempus dignissim. Vestibulum quis sagittis arcu, in pellentesque erat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec finibus est velit, vel aliquet massa porta quis.Cras et risus at nulla laoreet sodales. Fusce diam felis, rutrum sed suscipit eget, congue at lacus. Cras accumsan imperdiet vestibulum. Cras posuere orci a nibh egestas hendrerit. Suspendisse nec neque luctus, fermentum eros vitae, tincidunt ligula. In ut ornare nunc, vel vehicula eros. Vivamus id dignissim metus. Donec sed mi sed mi malesuada pulvinar.Aenean aliquet bibendum feugiat. Maecenas molestie nec enim a porta. Aliquam erat volutpat. Pellentesque luctus egestas laoreet. Phasellus vitae convallis enim, tristique congue leo. Praesent varius tortor nibh, id scelerisque quam rhoncus vitae. Maecenas finibus dictum varius. Morbi cursus nisi sed blandit mattis. Proin posuere ante ut dapibus cursus. Donec tempor egestas accumsan. Maecenas rhoncus ut orci et interdum. Nam in risus quis quam lacinia gravida.Vestibulum ullamcorper vitae massa venenatis laoreet. Duis sollicitudin felis in convallis scelerisque. Suspendisse iaculis tellus sed urna ultricies, a posuere nulla malesuada. Proin velit nulla, consectetur sit amet faucibus euismod, tristique id leo. Etiam quis magna sapien. Vestibulum lorem arcu, molestie laoreet tempus et, consectetur rutrum lorem. Curabitur sed efficitur magna. Phasellus quis sem purus. Donec auctor magna felis, eget tincidunt metus laoreet ut.In sed neque viverra, condimentum sem ac, dapibus urna. Nullam aliquam tempus nisi id faucibus. Duis sit amet est at dui ornare molestie quis vehicula lectus. Fusce finibus elementum lectus. Vivamus vestibulum justo in iaculis aliquam. Ut sollicitudin est ac velit pharetra aliquet. Donec tempor sodales tortor id vehicula. In pretium arcu sed libero ullamcorper fringilla. Vivamus vestibulum dui id rhoncus lobortis. Nulla ornare nisi vel nibh varius tempus. Nulla a vestibulum ante. Aliquam erat volutpat. Phasellus congue ornare nisl, vehicula varius felis ultrices eget. Mauris maximus, metus eu egestas facilisis, dui lacus accumsan neque, a semper eros nunc eget lectus. Vestibulum volutpat porta erat, non mattis massa. Quisque eu turpis et urna pharetra sodales.Aenean vel tortor a tortor suscipit semper ac eget tellus. Aenean nec lacus in risus scelerisque volutpat. Donec facilisis luctus nunc, eu placerat augue egestas ac. Aliquam non pellentesque magna. Proin luctus aliquam nisl at vestibulum. Proin non tortor vitae est blandit facilisis et sed elit. Sed eget orci euismod, placerat dui in, cursus nisl. Donec dapibus posuere est, ac fringilla dui aliquam vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nulla facilisi. Proin nec elit nec dui condimentum viverra. In rutrum dui nec magna efficitur auctor. Duis ut imperdiet justo. Sed rhoncus efficitur mi. Aliquam facilisis ex ut lectus consequat mattis. Ut eget velit eu nunc tempus mollis sed sed dui.Donec luctus hendrerit varius. Aliquam erat volutpat. Donec lobortis sapien vitae ultricies laoreet. Donec nunc massa, tristique non purus ut, vehicula iaculis risus. Pellentesque sodales ullamcorper pretium. Vestibulum mauris lectus, aliquam in enim ac, elementum porta neque. Phasellus sed magna a urna commodo aliquam.Donec quis lacus diam. Donec scelerisque mattis neque et luctus. Etiam eget est eu justo facilisis viverra nec nec urna. Duis placerat in dolor id bibendum. Sed id nisi vel eros laoreet mattis. Proin imperdiet eros tortor, quis bibendum sem eleifend nec. Nulla fermentum odio vitae tellus fermentum, et porttitor velit venenatis. Integer tempor, lacus a facilisis pretium, orci mauris rhoncus leo, sed dignissim est nunc in metus. Aenean vitae augue vel risus volutpat feugiat. Suspendisse potenti. Mauris purus nunc, volutpat ut enim sed, tincidunt volutpat metus. Nam id tempor nibh, eu lobortis arcu. Duis efficitur sollicitudin eros. Pellentesque dapibus cursus sapien sed sodales."),
              )
          ],
        ),
        ),
      ),
    );
  }
}
