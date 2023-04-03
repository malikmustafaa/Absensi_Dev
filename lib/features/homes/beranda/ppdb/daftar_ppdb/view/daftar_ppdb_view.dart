import 'package:b7c_clean_architecture/contants/color_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view/ppdb_view.dart';
import '../view_model/daftar_ppdb_view_model.dart';
import 'widgets/button_batal.dart';
import 'widgets/button_lanjut.dart';

class DaftarPpdbView extends StatelessWidget {
  static const routeName = "/DaftarPpdbView";
  const DaftarPpdbView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => DaftarPpdbViewModel(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: default2Color,
          title: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, PpdbView.routeName,
                      ModalRoute.withName('/PpdbView'));
                },
                icon: const Icon(Icons.arrow_back),
              ),
              const Text('Formulir Pendaftaran'),
            ],
          ),
          automaticallyImplyLeading: false,
        ),
        body: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: Consumer<DaftarPpdbViewModel>(
            builder: (context, provider, child) => Stepper(
              elevation: 01,
              controlsBuilder: (context, controller) {
                return const SizedBox.shrink();
              },
              type: StepperType.horizontal,
              currentStep: provider.activeStepIndex,
              steps: stepList(context),
              onStepTapped: provider.onStepTapped,
            ),
          ),
        ),
      ),
    );
  }

  List<Step> stepList(BuildContext context) {
    final provider = Provider.of<DaftarPpdbViewModel>(context, listen: false);
    return [
      Step(
        state: provider.activeStepIndex >= 0
            ? StepState.complete
            : StepState.disabled,
        isActive: provider.activeStepIndex >= 0,
        title: const Text('Data Siswa'),
        content: Form(
          key: provider.formkeys[0],
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Detail Siswa Baru',
                  style: styleHeaderForm,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                inputFormatters: [provider.formatDenySpase],
                validator: provider.valEmail,
                controller: provider.controllerEmailF,
                decoration: const InputDecoration(
                  hintText: 'Masukkan email',
                  labelText: 'Email',
                  labelStyle: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.text,
                validator: provider.valNamaLengkap,
                controller: provider.controllerNamalengkap,
                decoration: const InputDecoration(
                  hintText: 'Masukkan nama lengkap',
                  labelText: 'Nama lengkap',
                  labelStyle: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                inputFormatters: [provider.formatDenySpase],
                validator: provider.valNisn,
                maxLength: 10,
                keyboardType: TextInputType.number,
                controller: provider.controllerNisn,
                decoration: const InputDecoration(
                  hintText: 'Masukkan nisn',
                  labelText: 'Nisn',
                  labelStyle: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                validator: provider.valJenisKelamin,
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
              TextFormField(
                validator: provider.valSekolahAsal,
                controller: provider.controllerSekolahAsal,
                decoration: const InputDecoration(
                  labelText: 'Sekolah Asal',
                  hintText: 'contoh: Smp Negeri 2 Lhokseumawe',
                  labelStyle: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                validator: provider.valTempatTgl,
                controller: provider.controllerTempatTgl,
                decoration: const InputDecoration(
                  labelText: 'Tempat/Tanggal Lahir',
                  hintText: 'Masukkan tempat/tanggal lahir',
                  labelStyle: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              TextFormField(
                validator: provider.valAlamat,
                controller: provider.controllerAlamat,
                decoration: const InputDecoration(
                  labelText: 'Alamat',
                  hintText: 'contoh: Desa, Kecamatan, Kota.',
                  labelStyle: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              const SizedBox(height: 25),
              Row(
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
            ],
          ),
        ),
      ),
      Step(
        state: provider.activeStepIndex >= 1
            ? StepState.complete
            : StepState.disabled,
        isActive: provider.activeStepIndex >= 1,
        title: const Text('Data Ortu'),
        content: Form(
          key: provider.formkeys[1],
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Detail Orang Tua',
                  style: styleHeaderForm,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                validator: provider.valNamaAyah,
                controller: provider.controllerAyah,
                decoration: const InputDecoration(
                  labelText: 'Nama Ayah',
                  hintText: 'Masukkan nama ayah',
                  labelStyle: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                validator: provider.valNamaIbu,
                controller: provider.controllerIbu,
                decoration: const InputDecoration(
                  labelText: 'Nama Ibu',
                  hintText: 'Masukkan nama ibu',
                  labelStyle: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                maxLength: 15,
                inputFormatters: [
                  provider.formatDenySpase,
                ],
                validator: provider.valNoSiswa,
                keyboardType: TextInputType.number,
                controller: provider.controllernotlpnSiswa,
                decoration: const InputDecoration(
                  labelText: 'No.Tlpn/Aktif Siswa',
                  hintText: 'Masukkan no.tlpn/aktif siswa ',
                  labelStyle: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                maxLength: 15,
                inputFormatters: [
                  provider.formatDenySpase,
                ],
                validator: provider.valNoOrtu,
                keyboardType: TextInputType.number,
                controller: provider.controllernotlpnOrtu,
                decoration: const InputDecoration(
                  labelText: 'No.Tlpn/Aktif Ortu',
                  hintText: 'Masukkan no.tlpn/aktif ortu',
                  labelStyle: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              const SizedBox(height: 25),
              Row(
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
            ],
          ),
        ),
      ),
      Step(
        state: provider.activeStepIndex >= 2
            ? StepState.complete
            : StepState.disabled,
        isActive: provider.activeStepIndex >= 2,
        title: const Text('Jurusan'),
        content: Consumer<DaftarPpdbViewModel>(
          builder: (context, provider, child) => Form(
            key: provider.formkeys[2],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Detail Jurusan',
                    style: styleHeaderForm,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Jurusan Teknologi',
                  style: styleTxtfotoprofile,
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  isDense: false,
                  validator: provider.valJrsnTeknologi,
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
                const SizedBox(height: 20),
                Text(
                  'Jurusan Bisnis Manajemen',
                  style: styleTxtfotoprofile,
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  isDense: false,
                  validator: provider.valJrsnBsnsMnjmn,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ), //
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
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonBatalWidget(
                        nama: 'Batal',
                        onTap: () {
                          provider.batalStep(context);
                        }),
                    ButtonLanjutWidget(
                      nama: 'Oke',
                      onTap: () {
                        provider.stepTree(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ];
  }
}
