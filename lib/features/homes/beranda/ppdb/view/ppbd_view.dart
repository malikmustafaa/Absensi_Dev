// ignore_for_file: library_private_types_in_public_api

import 'package:b7c_clean_architecture/contants/color_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/ppbd_view_model.dart';

class PpdbPage extends StatefulWidget {
  const PpdbPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _PpdbPageState createState() => _PpdbPageState();
}

class _PpdbPageState extends State<PpdbPage> {
  int _activeStepIndex = 0;

  lanjutStep() {
    if (_activeStepIndex < 2) {
      setState(() {
        _activeStepIndex = _activeStepIndex + 1;
      });
    }
  }

  batalStep() {
    if (_activeStepIndex > 0) {
      setState(() {
        _activeStepIndex = _activeStepIndex - 1; //currentStep+=1;
      });
    }
  }

  onStepTapped(int index) {
    setState(() {
      _activeStepIndex = index;
    });
  }

  bool enableList = false;
  int? selectedIndex;
  onhandleTap() {
    setState(() {
      enableList = !enableList;
    });
  }

  onChanged(int position) {
    setState(() {
      selectedIndex = position;
      enableList = !enableList;
    });
  }

  String? _chosenValue;
  String? _chosenValue1;
  String? _chosenValue2;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => PpdbViewModel(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: default2Color,
        title: Text(widget.title),
      ),
      body: Stepper(
        elevation: 01,
        controlsBuilder: controlsBuilder,
        type: StepperType.horizontal,
        currentStep: _activeStepIndex,
        steps: stepList(),
        onStepContinue: lanjutStep,
        onStepCancel: batalStep,
        onStepTapped: onStepTapped,
      ),
    );
  }

  List<Step> stepList() => [
        Step(
          state:
              _activeStepIndex >= 0 ? StepState.complete : StepState.disabled,
          isActive: _activeStepIndex >= 0,
          title: const Text('Data Siswa'),
          content: Column(
            children: [
              const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Detail Siswa Baru',
                  style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Consumer<PpdbViewModel>(
                builder: (context, providerPpdb, child) => TextField(
                  controller: providerPpdb.controllerEmail,
                  decoration: const InputDecoration(
                    hintText: 'Masukkan email',
                    labelText: 'Email',
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Consumer<PpdbViewModel>(
                builder: (context, providerPpdb, child) => TextField(
                  controller: providerPpdb.controllerNamalengkap,
                  decoration: const InputDecoration(
                    hintText: 'Masukkan nama lengkap',
                    labelText: 'Nama lengkap',
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Consumer<PpdbViewModel>(
                builder: (context, providerPpdb, child) => TextField(
                  keyboardType: TextInputType.number,
                  controller: providerPpdb.controllerNisn,
                  decoration: const InputDecoration(
                    hintText: 'Masukkan nisn',
                    labelText: 'Nisn',
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: _chosenValue,
                  underline: const SizedBox(),
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                  items: <String>[
                    'Pria',
                    'Wanita',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style:
                            const TextStyle(fontSize: 16, fontFamily: 'Ubuntu'),
                      ),
                    );
                  }).toList(),
                  hint: const Text(
                    "Jenis Kelamin",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _chosenValue = value;
                    });
                  },
                ),
              ),
              Consumer<PpdbViewModel>(
                builder: (context, providerPpdb, child) => TextField(
                  controller: providerPpdb.controllerSekolahAsal,
                  decoration: const InputDecoration(
                    labelText: 'Sekolah Asal',
                    hintText: 'contoh: Smpn1 Lhokseumawe',
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Consumer<PpdbViewModel>(
                builder: (context, providerPpdb, child) => TextField(
                  controller: providerPpdb.controllerTempattggllahir,
                  decoration: const InputDecoration(
                    labelText: 'Tempat/Tanggal Lahir',
                    hintText: 'Masukkan tempat/tanggal lahir',
                  ),
                ),
              ),
              Consumer<PpdbViewModel>(
                builder: (context, providerPpdb, child) => TextField(
                  controller: providerPpdb.controllerAlamat,
                  decoration: const InputDecoration(
                    labelText: 'Alamat',
                    hintText: 'contoh: Desa, Kecamatan, Kota.',
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
        Step(
            state:
                _activeStepIndex >= 1 ? StepState.complete : StepState.disabled,
            isActive: _activeStepIndex >= 1,
            title: const Text('Data Ortu'),
            content: Column(
              children: [
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Detail Orang Tua',
                    style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Consumer<PpdbViewModel>(
                  builder: (context, providerPpdb, child) => TextField(
                    controller: providerPpdb.controllerAyah,
                    decoration: const InputDecoration(
                      labelText: 'Nama Ayah',
                      hintText: 'Masukkan nama ayah',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Consumer<PpdbViewModel>(
                  builder: (context, providerPpdb, child) => TextField(
                    controller: providerPpdb.controllerIbu,
                    decoration: const InputDecoration(
                      labelText: 'Nama Ibu',
                      hintText: 'Masukkan nama ibu',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Consumer<PpdbViewModel>(
                  builder: (context, providerPpdb, child) => TextField(
                    controller: providerPpdb.controllernotlpnSiswa,
                    decoration: const InputDecoration(
                      labelText: 'No.Tlpn/Aktif Siswa',
                      hintText: 'Masukkan no.tlpn/aktif siswa ',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Consumer<PpdbViewModel>(
                  builder: (context, providerPpdb, child) => TextField(
                    controller: providerPpdb.controllernotlpnOrtu,
                    decoration: const InputDecoration(
                      labelText: 'No.Tlpn/Aktif Ortu',
                      hintText: 'Masukkan no.tlpn/aktif ortu',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            )),
        Step(
          state:
              _activeStepIndex >= 2 ? StepState.complete : StepState.disabled,
          isActive: _activeStepIndex >= 2,
          title: const Text('Jurusan'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Detail Jurusan',
                  style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Jurusan Teknologi',
                style: styleTxtfotoprofile,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: DropdownButton<String>(
                  underline: const SizedBox(),
                  isExpanded: true,
                  value: _chosenValue1,
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                  items: <String>[
                    'DKV (Desain Komunikasi Visual)',
                    'TJKT (Teknik Jaringan Komputer dan Telekomunikasi)',
                    'PPLG (Pengembangan Perangkat Lunak',
                    'TE (Teknik Elektronika)',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style:
                            const TextStyle(fontSize: 16, fontFamily: 'Ubuntu'),
                      ),
                    );
                  }).toList(),
                  hint: const Text(
                    "Pilih Jurusan",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _chosenValue1 = value;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Jurusan Bisnis Manajemen',
                style: styleTxtfotoprofile,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: DropdownButton<String>(
                  underline: const SizedBox(),
                  isExpanded: true,
                  value: _chosenValue2,
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                  items: <String>[
                    'AKL (Akuntansi dan Keuangan Lembaga)',
                    'BD (Bisnis Digital)',
                    'MPLB (Manajemen Perkantoran dan Layanan Bisnis)',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style:
                            const TextStyle(fontSize: 16, fontFamily: 'Ubuntu'),
                      ),
                    );
                  }).toList(),
                  hint: const Text(
                    "Pilih Jurusan",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _chosenValue2 = value;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ];

  Widget controlsBuilder(context, details) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // final provider = Provider.of<PpdbViewModel>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: w / 2.5,
          height: h / 16 * 1.1,
          child: OutlinedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onPressed: details.onStepCancel,
            child: Text(
              'Batal',
              style: buttonRefreshStyle,
            ),
          ),
        ),
        SizedBox(
          width: w / 2.5,
          height: h / 16 * 1.1,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onPressed: details.onStepContinue,

            // ke provider
            // onPressed: () {
            //   provider.ppdbVM(context);
            // },
            child: Text(
              'Lanjut',
              style: buttonYaStyle,
            ),
          ),
        ),
      ],
    );
  }
}
