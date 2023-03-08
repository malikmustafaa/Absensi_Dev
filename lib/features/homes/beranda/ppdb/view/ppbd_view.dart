import 'package:b7c_clean_architecture/contants/color_style.dart';
import 'package:b7c_clean_architecture/features/homes/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/ppdb_view_model.dart';
import 'widgets/button_batal.dart';
import 'widgets/button_lanjut.dart';

class PpdbPage extends StatelessWidget {
  static const routeName = "/PpdbPage";
  const PpdbPage({Key? key}) : super(key: key);

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
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName,
                    ModalRoute.withName('/HomePage'));
              },
              icon: const Icon(Icons.arrow_back),
            ),
            const Text('Formulir Pendaftaran'),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Consumer<PpdbViewModel>(
        builder: (context, provider, child) => Stepper(
          elevation: 01,
          controlsBuilder: (context, controller) {
            return const SizedBox.shrink();
          },
          type: StepperType.horizontal,
          currentStep: provider.activeStepIndex,
          steps: stepList(provider),
          onStepTapped: provider.onStepTapped,
        ),
      ),
    );
  }

  List<Step> stepList(
    provider,
  ) =>
      [
        Step(
          state: provider.activeStepIndex >= 0
              ? StepState.complete
              : StepState.disabled,
          isActive: provider.activeStepIndex >= 0,
          title: const Text('Data Siswa'),
          content: Consumer<PpdbViewModel>(
            builder: (context, provider, child) => Form(
              key: provider.formkeys[0],
              child: Column(
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
                  const SizedBox(height: 16),
                  Consumer<PpdbViewModel>(
                    builder: (context, provider, child) => TextFormField(
                      validator: provider.validator,
                      controller: provider.controllerEmail,
                      decoration: const InputDecoration(
                        hintText: 'Masukkan email',
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Consumer<PpdbViewModel>(
                    builder: (context, provider, child) => TextFormField(
                      validator: provider.validator,
                      controller: provider.controllerNamalengkap,
                      decoration: const InputDecoration(
                        hintText: 'Masukkan nama lengkap',
                        labelText: 'Nama lengkap',
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Consumer<PpdbViewModel>(
                    builder: (context, provider, child) => TextFormField(
                      validator: provider.validator,
                      keyboardType: TextInputType.number,
                      controller: provider.controllerNisn,
                      decoration: const InputDecoration(
                        hintText: 'Masukkan nisn',
                        labelText: 'Nisn',
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Consumer<PpdbViewModel>(
                    builder: (context, provider, child) =>
                        DropdownButtonFormField<String>(
                      validator: provider.validator,
                      isExpanded: true,
                      decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      value: provider.chosenValue,
                      style: styleDroa,
                      items: provider.dropdownItems
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(item, style: styleDropdown),
                              ))
                          .toList(),
                      hint: Text("Jenis Kelamin", style: styleDropdown),
                      onChanged: provider.onChangedJnsKlmn,
                    ),
                  ),
                  Consumer<PpdbViewModel>(
                    builder: (context, provider, child) => TextFormField(
                      validator: provider.validator,
                      controller: provider.controllerSekolahAsal,
                      decoration: const InputDecoration(
                        labelText: 'Sekolah Asal',
                        hintText: 'contoh: Smpn1 Lhokseumawe',
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Consumer<PpdbViewModel>(
                    builder: (context, provider, child) => TextFormField(
                      validator: provider.validator,
                      controller: provider.controllerTempattggllahir,
                      decoration: const InputDecoration(
                        labelText: 'Tempat/Tanggal Lahir',
                        hintText: 'Masukkan tempat/tanggal lahir',
                      ),
                    ),
                  ),
                  Consumer<PpdbViewModel>(
                    builder: (context, provider, child) => TextFormField(
                      validator: provider.validator,
                      controller: provider.controllerAlamat,
                      decoration: const InputDecoration(
                        labelText: 'Alamat',
                        hintText: 'contoh: Desa, Kecamatan, Kota.',
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Consumer<PpdbViewModel>(
                    builder: (context, value, child) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonBatalWidget(
                            nama: 'Batal',
                            onTap: () {
                              provider.batalStep(context);
                            }),
                        ButtonLanjutWidget(
                          nama: 'Lanjut',
                          onTap: () {
                            provider.stepOne(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Step(
            state: provider.activeStepIndex >= 1
                ? StepState.complete
                : StepState.disabled,
            isActive: provider.activeStepIndex >= 1,
            title: const Text('Data Ortu'),
            content: Consumer<PpdbViewModel>(
              builder: (context, provider, child) => Form(
                key: provider.formkeys[1],
                child: Column(
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
                    const SizedBox(height: 16),
                    Consumer<PpdbViewModel>(
                      builder: (context, provider, child) => TextFormField(
                        validator: provider.validator,
                        controller: provider.controllerAyah,
                        decoration: const InputDecoration(
                          labelText: 'Nama Ayah',
                          hintText: 'Masukkan nama ayah',
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Consumer<PpdbViewModel>(
                      builder: (context, provider, child) => TextFormField(
                        validator: provider.validator,
                        controller: provider.controllerIbu,
                        decoration: const InputDecoration(
                          labelText: 'Nama Ibu',
                          hintText: 'Masukkan nama ibu',
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Consumer<PpdbViewModel>(
                      builder: (context, provider, child) => TextFormField(
                        validator: provider.validator,
                        keyboardType: TextInputType.number,
                        controller: provider.controllernotlpnSiswa,
                        decoration: const InputDecoration(
                          labelText: 'No.Tlpn/Aktif Siswa',
                          hintText: 'Masukkan no.tlpn/aktif siswa ',
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Consumer<PpdbViewModel>(
                      builder: (context, provider, child) => TextFormField(
                        validator: provider.validator,
                        keyboardType: TextInputType.number,
                        controller: provider.controllernotlpnOrtu,
                        decoration: const InputDecoration(
                          labelText: 'No.Tlpn/Aktif Ortu',
                          hintText: 'Masukkan no.tlpn/aktif ortu',
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Consumer<PpdbViewModel>(
                      builder: (context, value, child) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ButtonBatalWidget(
                              nama: 'Batal',
                              onTap: () {
                                provider.batalStep(context);
                              }),
                          ButtonLanjutWidget(
                            nama: 'Lanjut',
                            onTap: () {
                              provider.stepTwo(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
        Step(
          state: provider.activeStepIndex >= 2
              ? StepState.complete
              : StepState.disabled,
          isActive: provider.activeStepIndex >= 2,
          title: const Text('Jurusan'),
          content: Consumer<PpdbViewModel>(
            builder: (context, provider, child) => Form(
              key: provider.formkeys[2],
              child: Column(
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
                  const SizedBox(height: 30),
                  Text(
                    'Jurusan Teknologi',
                    style: styleTxtfotoprofile,
                  ),
                  const SizedBox(height: 10),
                  Consumer<PpdbViewModel>(
                    builder: (context, provider, child) =>
                        DropdownButtonFormField<String>(
                      isDense: false,
                      validator: provider.validator,
                      isExpanded: true,
                      decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      value: provider.chosenValue1,
                      style: styleDroa,
                      items: provider.dropdownItems1
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(item, style: styleDropdown),
                              ))
                          .toList(),
                      hint: Text("Pilih Jurusan", style: styleDropdown),
                      onChanged: provider.onChangedJrsnTknlgi,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Jurusan Bisnis Manajemen',
                    style: styleTxtfotoprofile,
                  ),
                  const SizedBox(height: 10),
                  Consumer<PpdbViewModel>(
                    builder: (context, provider, child) =>
                        DropdownButtonFormField<String>(
                      isDense: false,
                      validator: provider.validator,
                      isExpanded: true,
                      decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      value: provider.chosenValue2,
                      style: styleDroa,
                      items: provider.dropdownItems2
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(item, style: styleDropdown),
                              ))
                          .toList(),
                      hint: Text("Pilih Jurusan", style: styleDropdown),
                      onChanged: provider.onChangedJrsnBsnsMnjmn,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Consumer<PpdbViewModel>(
                    builder: (context, value, child) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonBatalWidget(
                            nama: 'Batal',
                            onTap: () {
                              provider.batalStep(context);
                            }),
                        ButtonLanjutWidget(
                          nama: 'Lanjut',
                          onTap: () {
                            provider.stepTree(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ];
}
