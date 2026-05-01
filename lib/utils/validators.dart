class Validators {

  // 🔹 Wajib isi
  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Wajib diisi";
    }
    return null;
  }

  // 🔹 Nama
  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Nama wajib diisi";
    }
    if (value.length < 3) {
      return "Nama terlalu pendek";
    }
    return null;
  }

  // 🔹 NIK
  static String? nik(String? value) {
    if (value == null || value.isEmpty) {
      return "NIK wajib diisi";
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return "NIK harus angka";
    }
    if (value.length != 16) {
      return "NIK harus 16 digit";
    }
    return null;
  }

  // 🔹 Email
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return "Email wajib diisi";
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return "Format email tidak valid";
    }
    return null;
  }

  // 🔹 No HP
  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return "No HP wajib diisi";
    }
    if (value.length < 10) {
      return "No HP tidak valid";
    }
    return null;
  }

  // 🔹 Tahun Lulus
  static String? year(String? value) {
    if (value == null || value.isEmpty) {
      return "Tahun wajib diisi";
    }
    if (value.length != 4) {
      return "Harus 4 digit";
    }

    int? year = int.tryParse(value);
    if (year == null) {
      return "Harus angka";
    }

    if (year < 2000 || year > DateTime.now().year) {
      return "Tahun tidak valid";
    }

    return null;
  }
}