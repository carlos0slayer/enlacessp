import 'dart:io';

import 'package:enlacessp/pages/Animation/FadeAnimation.dart';
import 'package:enlacessp/pages/indexPageResources/draw_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

// ignore: camel_case_types
class NuevaInfraccion extends StatefulWidget {
  @override
  _NuevaInfraccionState createState() => _NuevaInfraccionState();
}

// ignore: camel_case_types
class _NuevaInfraccionState extends State<NuevaInfraccion> {
  File _image;
  File _image2;
  File _image3;
  File _image4;
  File pickedImage;
  var curp = '';
  String validacionFinal = '';
  String validacionCurp = '';
  String completarInputs = '';

  @override
  void dispose() {
    // TODO: implement dispose
    _nombre.dispose();
    _apellidoPaterno.dispose();
    _apellidoMaterno.dispose();
    _obtenercurp.dispose();
    _calle.dispose();
    _numeroExterior.dispose();
    _numeroInterior.dispose();
    _codigoPostal.dispose();
    _noAparece.dispose();
    _referencias.dispose();
    _otroBeneficio.dispose();
    _cantidad.dispose();
    _observaciones.dispose();
    super.dispose();
  }

  Future _getImage() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      _image = image;
    });
  }

  Future _getImage2() async {
    // ignore: deprecated_member_use
    File image2 = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      _image2 = image2;
    });
  }

  Future _getImage3() async {
    // ignore: deprecated_member_use
    File image3 = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      _image3 = image3;
    });
  }

  Future _getImage4() async {
    // ignore: deprecated_member_use
    File image4 = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      _image4 = image4;
    });
  }

  List _myActivities;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivities = [];
  }

//================================Controladores=========================================
  TextEditingController _municipioTextFieldControoler =
      new TextEditingController();
  TextEditingController _localidadesTextFieldControoler =
      new TextEditingController();
  final formkey = GlobalKey<FormState>();
  TextEditingController _nombre = new TextEditingController();
  TextEditingController _apellidoPaterno = new TextEditingController();
  TextEditingController _apellidoMaterno = new TextEditingController();
  TextEditingController _obtenercurp = new TextEditingController();
  TextEditingController _numeroCel = new TextEditingController();
  TextEditingController _calle = new TextEditingController();
  TextEditingController _numeroExterior = new TextEditingController();
  TextEditingController _numeroInterior = new TextEditingController();
  TextEditingController _codigoPostal = new TextEditingController();
  TextEditingController _noAparece = new TextEditingController();
  TextEditingController _referencias = new TextEditingController();
  TextEditingController _otroBeneficio = new TextEditingController();
  TextEditingController _cantidad = new TextEditingController();
  TextEditingController _observaciones = new TextEditingController();

  //================================Controladores=========================================

  String _fecha = '';
  String _tipoLicencia;
  String _claseVehiculo;
  String _empresaSeleccionada;
  String _corralonSeleccionado;
  String _opcionSeleccionadaLicencia = 'AUTOMOVILISTA';
  String _opcionSeleccionadaClaseVehiculo = 'Motoneta';
  String _opcionSeleccionadaEmpresa = 'GRUAS MONARCA';
  String _opcionSeleccionadaCorralon = 'SALIDA A CHARO';
  List<String> _tipodeLicencia = [
    'AUTOMOVILISTA',
    'CHOFER',
    'MOTOCICLISTA',
    'SERVICIO PUBLICO'
  ];
  List<String> _corralon = ['SALIDA A CHARO'];
  List<String> _claseDeVehiculo = [
    'Motoneta',
    'Cuatrimoto',
    'Hatchback',
    "Sedan",
    "Familiar",
    "Crossover",
    "Suv"
  ];
  List<String> _empresa = ['GRUAS MONARCA', 'GRUAS VELAZQUEZ'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(30, 42, 82, 3),
        title: Text('Registrar Infraccion'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: FadeAnimation(
              2,
              Column(
                children: <Widget>[
                  Divider(),
                  _ciudadEventoInput(),
                  Divider(),
                  _direccionInput(),
                  Divider(),
                  _labelFaltas(),
                  Divider(),
                  _descripccionHechos(),
                  Divider(),
                  _nombreConductor(),
                  Divider(),
                  _primerApellido(),
                  Divider(),
                  _segundoApellido(),
                  Divider(),
                  _domicilioConductor(),
                  Divider(),
                  _seleccionTipoLicencia(),
                  _tipodeLicenciaWidget(),
                  Divider(),
                  _numeroLicencia(),
                  Divider(),
                  _servcioVehiculo(),
                  Divider(),
                  _numeroPlaca(),
                  Divider(),
                  _marcaInput(),
                  Divider(),
                  _lineaInput(),
                  Divider(),
                  _modeloInput(),
                  Divider(),
                  _seleccionClaseCehiculo(),
                  _clasVehiculoInput(),
                  Divider(),
                  _garantiaInput(),
                  Divider(),
                  _observacionesInput(),
                  Divider(),
                  _montoInput(),
                  Divider(),
                  _labelEmpresa(),
                  _empresaInput(),
                  Divider(),
                  _labelCorralon(),
                  _corralonInput(),
                  Divider(),
                  _labelFotos(),
                  _camaraInput(),
                  Divider(),
                  _firmaButton(),
                  Divider(),
                  _labelSubmit(),
                  _submitInput(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _ciudadEventoInput() {
    return Container(
      child: TextFormField(
        autofocus: false,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue[800], width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(30, 42, 82, 3), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Ciudad del Evento',
          labelText: 'Ciudad Evento',
          labelStyle: TextStyle(
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
          suffixIcon: Icon(
            FontAwesomeIcons.city,
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
        ),
        validator: (value) {
          if (value.length < 3) {
            return 'Porfavor Ingrese la Ciudad';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _direccionInput() {
    return Container(
      child: TextFormField(
        autofocus: false,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue[800], width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(30, 42, 82, 3), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Dirección',
          labelText: 'Dirección',
          labelStyle: TextStyle(
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
          suffixIcon: Icon(
            FontAwesomeIcons.mapMarked,
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
        ),
        validator: (value) {
          if (value.length < 3) {
            return 'Porfavor Ingrese la Ciudad';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _labelFaltas() {
    return Container(
      child: Text(
        "FALTAS",
        style: TextStyle(
            color: Color.fromRGBO(30, 42, 82, 3),
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      width: 300.0,
      height: 35.0,
    );
  }

  Widget _descripccionHechos() {
    return Container(
      child: TextFormField(
        autofocus: false,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue[800], width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(30, 42, 82, 3), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Descripcción de los Hechos',
          labelText: 'Descripcción',
          labelStyle: TextStyle(
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
          suffixIcon: Icon(
            FontAwesomeIcons.clipboardList,
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
        ),
        validator: (value) {
          if (value.length < 3) {
            return 'Porfavor Ingrese la Ciudad';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _nombreConductor() {
    return Container(
      child: TextFormField(
        autofocus: false,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue[800], width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(30, 42, 82, 3), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Conductor',
          labelText: 'Nombre del conductor',
          labelStyle: TextStyle(
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
          suffixIcon: Icon(
            FontAwesomeIcons.userAlt,
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
        ),
        validator: (value) {
          if (value.length < 3) {
            return 'Porfavor Ingrese el nombre del conductor';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _primerApellido() {
    return Container(
      child: TextFormField(
        autofocus: false,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue[800], width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(30, 42, 82, 3), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Primer Apellido',
          labelText: 'Primer Apellido',
          labelStyle: TextStyle(
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
          suffixIcon: Icon(
            FontAwesomeIcons.userAlt,
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
        ),
        validator: (value) {
          if (value.length < 3) {
            return 'Porfavor Ingrese el primer Apellido';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _segundoApellido() {
    return Container(
      child: TextFormField(
        autofocus: false,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue[800], width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(30, 42, 82, 3), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Segundo Apellido',
          labelText: 'Segundo Apellido',
          labelStyle: TextStyle(
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
          suffixIcon: Icon(
            FontAwesomeIcons.userAlt,
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
        ),
        validator: (value) {
          if (value.length < 3) {
            return 'Porfavor Ingrese el segundo Apellido';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _domicilioConductor() {
    return Container(
      child: TextFormField(
        autofocus: false,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue[800], width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(30, 42, 82, 3), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Domicilio del Conductor',
          labelText: 'Domicilio del Conductor',
          labelStyle: TextStyle(
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
          suffixIcon: Icon(
            FontAwesomeIcons.mapMarked,
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
        ),
        validator: (value) {
          if (value.length < 3) {
            return 'Porfavor Ingrese el Domicilio del Conductor';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _seleccionTipoLicencia() {
    return Container(
      child: Text(
        "Seleccione Licencia",
        style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      width: 300.0,
      height: 35.0,
    );
  }

  Widget _tipodeLicenciaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          FontAwesomeIcons.idCard,
          color: Color.fromRGBO(30, 42, 82, 3),
        ),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                value: _opcionSeleccionadaLicencia,
                iconSize: 30.0,
                icon: (null),
                style: TextStyle(
                    color: Color.fromRGBO(30, 42, 82, 3),
                    fontWeight: FontWeight.bold),
                hint: Text("Selecciona una Opcion"),
                onChanged: (opt) {
                  setState(() {
                    _opcionSeleccionadaLicencia = opt;
                    _tipoLicencia = _opcionSeleccionadaLicencia;
                  });
                },
                items: getOpcionesLicencia(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpcionesLicencia() {
    List<DropdownMenuItem<String>> lista = new List();
    _tipodeLicencia.forEach((licenia) {
      lista.add(DropdownMenuItem(
        child: Text(licenia),
        value: licenia,
      ));
    });
    return lista;
  }

  Widget _numeroLicencia() {
    return Container(
      child: TextFormField(
        autofocus: false,
        keyboardType: TextInputType.number,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue[800], width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(30, 42, 82, 3), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Número de Licencia',
          labelText: 'Número de Licencia',
          labelStyle: TextStyle(
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
          suffixIcon: Icon(
            FontAwesomeIcons.idCard,
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
        ),
        validator: (value) {
          if (value.length < 3) {
            return 'Porfavor Ingrese el Numero de Licencia';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _servcioVehiculo() {
    return Container(
      child: TextFormField(
        autofocus: false,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue[800], width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(30, 42, 82, 3), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Servicio Vehiculo',
          labelText: 'Servicio Vehiculo',
          labelStyle: TextStyle(
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
          suffixIcon: Icon(
            FontAwesomeIcons.servicestack,
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
        ),
        validator: (value) {
          if (value.length < 3) {
            return 'Porfavor Ingrese el Servicio Vehiculo';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _numeroPlaca() {
    return Container(
      child: TextFormField(
        autofocus: false,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue[800], width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(30, 42, 82, 3), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Numero de Placa',
          labelText: 'Numero de Placa',
          labelStyle: TextStyle(
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
          suffixIcon: Icon(
            FontAwesomeIcons.servicestack,
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
        ),
        validator: (value) {
          if (value.length < 3) {
            return 'Porfavor Ingrese el Numero de Placa';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _marcaInput() {
    return Container(
      child: TextFormField(
        autofocus: false,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue[800], width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(30, 42, 82, 3), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Marca',
          labelText: 'Marca',
          labelStyle: TextStyle(
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
          suffixIcon: Icon(
            FontAwesomeIcons.servicestack,
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
        ),
        validator: (value) {
          if (value.length < 3) {
            return 'Porfavor Ingrese la Marca';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _lineaInput() {
    return Container(
      child: TextFormField(
        autofocus: false,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue[800], width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(30, 42, 82, 3), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Linea',
          labelText: 'Linea',
          labelStyle: TextStyle(
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
          suffixIcon: Icon(
            FontAwesomeIcons.servicestack,
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
        ),
        validator: (value) {
          if (value.length < 3) {
            return 'Porfavor Ingrese la Linea';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _modeloInput() {
    return Container(
      child: TextFormField(
        autofocus: false,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue[800], width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(30, 42, 82, 3), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Modelo',
          labelText: 'Modelo',
          labelStyle: TextStyle(
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
          suffixIcon: Icon(
            FontAwesomeIcons.servicestack,
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
        ),
        validator: (value) {
          if (value.length < 3) {
            return 'Porfavor Ingrese el Modelo';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _seleccionClaseCehiculo() {
    return Container(
      child: Text(
        "Seleccione la Clase del Vehiculo",
        style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      width: 300.0,
      height: 35.0,
    );
  }

  Widget _clasVehiculoInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          FontAwesomeIcons.idCard,
          color: Color.fromRGBO(30, 42, 82, 3),
        ),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                value: _opcionSeleccionadaClaseVehiculo,
                iconSize: 30.0,
                icon: (null),
                style: TextStyle(
                    color: Color.fromRGBO(30, 42, 82, 3),
                    fontWeight: FontWeight.bold),
                hint: Text("Selecciona una Opcion"),
                onChanged: (opt) {
                  setState(() {
                    _opcionSeleccionadaClaseVehiculo = opt;
                    _claseVehiculo = _opcionSeleccionadaClaseVehiculo;
                  });
                },
                items: getOpcionesClaseVehiculo(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpcionesClaseVehiculo() {
    List<DropdownMenuItem<String>> lista = new List();
    _claseDeVehiculo.forEach((clase) {
      lista.add(DropdownMenuItem(
        child: Text(clase),
        value: clase,
      ));
    });
    return lista;
  }

  Widget _garantiaInput() {
    return Container(
      child: TextFormField(
        autofocus: false,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue[800], width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(30, 42, 82, 3), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Garantia',
          labelText: 'Garantia',
          labelStyle: TextStyle(
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
          suffixIcon: Icon(
            FontAwesomeIcons.servicestack,
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
        ),
        validator: (value) {
          if (value.length < 3) {
            return 'Porfavor Ingrese la Garantia';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _observacionesInput() {
    return TextFormField(
      autofocus: false,
      controller: _observaciones,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue[800], width: 2.0),
            borderRadius: BorderRadius.circular(20.0)),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromRGBO(30, 42, 82, 3), width: 2.0),
            borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Observaciones del Beneficiario',
        labelText: 'Observaciones',
        labelStyle: TextStyle(color: Color.fromRGBO(30, 42, 82, 3)),
        suffixIcon: Icon(
          Icons.remove_red_eye,
          color: Color.fromRGBO(30, 42, 82, 3),
        ),
      ),
    );
  }

  Widget _montoInput() {
    return Container(
      child: TextFormField(
        autofocus: false,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue[800], width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(30, 42, 82, 3), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Monto',
          labelText: 'Monto a Pagar',
          labelStyle: TextStyle(
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
          suffixIcon: Icon(
            FontAwesomeIcons.coins,
            color: Color.fromRGBO(30, 42, 82, 3),
          ),
        ),
        validator: (value) {
          if (value.length < 3) {
            return 'Porfavor Ingrese el monto';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _labelEmpresa() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "Seleccione Empresa de Grua",
        style: TextStyle(
            color: Color.fromRGBO(30, 42, 82, 3), fontWeight: FontWeight.bold),
      ),
      width: 300.0,
      height: 35.0,
    );
  }

  Widget _empresaInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          FontAwesomeIcons.idCard,
          color: Color.fromRGBO(30, 42, 82, 3),
        ),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                value: _opcionSeleccionadaEmpresa,
                iconSize: 30.0,
                icon: (null),
                style: TextStyle(
                    color: Color.fromRGBO(30, 42, 82, 3),
                    fontWeight: FontWeight.bold),
                hint: Text("Selecciona una Opcion"),
                onChanged: (opt) {
                  setState(() {
                    _opcionSeleccionadaEmpresa = opt;
                    _empresaSeleccionada = _opcionSeleccionadaEmpresa;
                  });
                },
                items: getOpcionesEmpresa(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpcionesEmpresa() {
    List<DropdownMenuItem<String>> lista = new List();
    _empresa.forEach((empresa) {
      lista.add(DropdownMenuItem(
        child: Text(empresa),
        value: empresa,
      ));
    });
    return lista;
  }

  Widget _labelCorralon() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "Seleccione Corralon",
        style: TextStyle(
            color: Color.fromRGBO(30, 42, 82, 3), fontWeight: FontWeight.bold),
      ),
      width: 300.0,
      height: 35.0,
    );
  }

  Widget _corralonInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          FontAwesomeIcons.idCard,
          color: Color.fromRGBO(30, 42, 82, 3),
        ),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                value: _opcionSeleccionadaCorralon,
                iconSize: 30.0,
                icon: (null),
                style: TextStyle(
                    color: Color.fromRGBO(30, 42, 82, 3),
                    fontWeight: FontWeight.bold),
                hint: Text("Selecciona una Opcion"),
                onChanged: (opt) {
                  setState(() {
                    _opcionSeleccionadaCorralon = opt;
                    _corralonSeleccionado = _opcionSeleccionadaCorralon;
                  });
                },
                items: getOpcionesCorralon(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpcionesCorralon() {
    List<DropdownMenuItem<String>> lista = new List();
    _corralon.forEach((_corralon) {
      lista.add(DropdownMenuItem(
        child: Text(_corralon),
        value: _corralon,
      ));
    });
    return lista;
  }

  Widget _labelSubmit() {
    return Container(
      alignment: Alignment.center,
      child: completarInputs == 'false'
          ? Text(
              'Porfavor completa los campos marcados',
              style: TextStyle(
                color: Colors.red,
              ),
            )
          : Text(
              "",
              style: TextStyle(
                  color: Color.fromRGBO(24, 122, 123, 3),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
      width: 300.0,
      height: 35.0,
    );
  }

  Widget _labelFotos() {
    return Container(
      width: 500.0,
      height: 60.0,
      child: Column(
        children: <Widget>[
          Icon(Icons.camera_alt, color: Color.fromRGBO(30, 42, 82, 3)),
          Text(
            'Fotografias de Evidencia',
            style: TextStyle(
                color: Color.fromRGBO(30, 42, 82, 3),
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _camaraInput() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: 350,
            child: Text(
              '1: Foto de infraccion 1',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 350,
            child: Text(
              '2: Foto de infraccion 2',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 350,
            child: Text(
              '3: Foto de Placa',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 350,
            child: Text(
              '4: Foto Licencia',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          GridView.count(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.all(20.0),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: <Widget>[
              GestureDetector(
                onTap: _getImage,
                child: Container(
                  color: Color.fromRGBO(30, 42, 82, 3),
                  child: _image == null
                      ? Icon(
                          FontAwesomeIcons.plus,
                          color: Colors.white,
                        )
                      : Image.file(_image),
                ),
              ),
              GestureDetector(
                onTap: _getImage2,
                child: Container(
                  color: Color.fromRGBO(30, 42, 82, 3),
                  child: _image2 == null
                      ? Icon(
                          FontAwesomeIcons.plus,
                          color: Colors.white,
                        )
                      : Image.file(_image2),
                ),
              ),
              GestureDetector(
                onTap: _getImage3,
                child: Container(
                  color: Color.fromRGBO(30, 42, 82, 3),
                  child: _image3 == null
                      ? Icon(
                          FontAwesomeIcons.plus,
                          color: Colors.white,
                        )
                      : Image.file(_image3),
                ),
              ),
              GestureDetector(
                onTap: _getImage4,
                child: Container(
                  color: Color.fromRGBO(30, 42, 82, 3),
                  child: _image4 == null
                      ? Icon(
                          FontAwesomeIcons.plus,
                          color: Colors.white,
                        )
                      : Image.file(_image4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _firmaButton() {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.90,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(29, 43, 82, 3),
            Color.fromRGBO(29, 43, 82, .9),
          ])),
      child: FlatButton(
        child: Text(
          "Firma del conductor",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Draw(),
          ));
        },
      ),
    );
  }

  Widget _submitInput() {
    return Container(
      height: 50,
      width: 500,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(30, 42, 82, 3),
            Color.fromRGBO(30, 42, 82, .9),
          ])),
      child: FlatButton(
        child: Text(
          "Registrar Infracción",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onPressed: _submit,
      ),
    );
  }

  bool validarCurp(String value) {
    Pattern pattern =
        r'([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0\d|1[0-2])(?:[0-2]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)';
    RegExp regex = new RegExp(pattern);

    return (!regex.hasMatch(value)) ? false : true;
  }

  void _submit() {
    if (!formKey.currentState.validate()) {
      setState(() {
        completarInputs = 'false';
        if (validarCurp(_obtenercurp.text) == true) {
          validacionFinal = "true";
          //print("Tu Curp ${_obtenercurp.text} Es Valida");
        } else {
          //print("Tu Curp ${_obtenercurp.text} No es Valida");
          validacionFinal = "false";
        }
        print(_numeroExterior);
      });
    } else {
      setState(() {
        completarInputs = '';
        if (validarCurp(_obtenercurp.text) == true) {
          validacionFinal = "true";
          //print("Tu Curp ${_obtenercurp.text} Es Valida");
        } else {
          //print("Tu Curp ${_obtenercurp.text} No es Valida");
          validacionFinal = "false";
        }
        print(_numeroExterior);
      });
    }
  }

  Widget _leerCurp() {
    return ListTile(
        title: validacionFinal == 'true'
            ? Text(
                "Curp: ${_obtenercurp.text}  es Valida",
                style: TextStyle(color: Colors.green),
              )
            : validacionFinal == 'false'
                ? Text(
                    "Curp: ${_obtenercurp.text} no es Valida",
                    style: TextStyle(color: Colors.red),
                  )
                : Text(''));
  }
}
