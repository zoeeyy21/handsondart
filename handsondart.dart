import 'dart:io';

abstract class Mahasiswa {
  String nama;
  int semester;
  double ipk;

  Mahasiswa(this.nama, this.semester, this.ipk);

  void tampilkanStatusIPK();
  
  void cetakDataMahasiswa() {
    print('\nData Kamu Adalah:');
    print('Nama: $nama');
    print('Semester: $semester');
    print('IPK: $ipk');
  }
}

class MahasiswaS1 extends Mahasiswa {
  MahasiswaS1(String nama, int semester, double ipk) : super(nama, semester, ipk);

  @override
  void tampilkanStatusIPK() {
    if (ipk >= 3.75) {
      print("Selamat $nama, anda mendapatkan IPK yang sempurna");
    } else if (ipk >= 3.5) {
      print("Selamat $nama, anda mendapatkan IPK yang sangat baik");
    } else if (ipk >= 3.0) {
      print("Selamat $nama, anda mendapatkan IPK yang baik");
    } else if (ipk >= 2.75) {
      print("Maaf $nama, anda mendapatkan IPK yang cukup");
    } else {
      print("Maaf $nama, anda mendapatkan IPK yang sangat buruk");
    }
  }
}

class MahasiswaD3 extends Mahasiswa {
  MahasiswaD3(String nama, int semester, double ipk) : super(nama, semester, ipk);

  @override
  void tampilkanStatusIPK() {
    if (ipk >= 3.75) {
      print("Selamat $nama, IPK kamu sangat bagus!");
    } else if (ipk >= 3.0) {
      print("Selamat $nama, IPK kamu cukup baik");
    } else {
      print("Maaf $nama, IPK kamu perlu ditingkatkan");
    }
  }
}

void main() {
  try {
    stdout.write('Masukkan nama kamu : ');
    String nama = stdin.readLineSync()!;
    stdout.write('Kamu ada berapa semester? : ');
    int smt = int.parse(stdin.readLineSync()!);
    stdout.write('Masukkan IPK kamu : ');
    double ipk = double.parse(stdin.readLineSync()!);
    print('');

    if (smt < 1 || smt > 14) {
      print('Data semester tidak valid');
      return;
    }
    if (ipk < 0 || ipk > 4) {
      print('Masukkan IPK dalam rentang 0-4 dan format x.xx');
      return;
    }

    Mahasiswa mahasiswa;
    if (smt < 6) {
      print('Kamu adalah mahasiswa D3');
      mahasiswa = MahasiswaS1(nama, smt, ipk);
    } else {
      print('Kamu adalah mahasiswa S1');
      mahasiswa = MahasiswaD3(nama, smt, ipk);
    }


    mahasiswa.tampilkanStatusIPK();
    mahasiswa.cetakDataMahasiswa();

  } catch (e) {
    print('Terjadi error mohon periksa kembali data anda $e');
  }
}
