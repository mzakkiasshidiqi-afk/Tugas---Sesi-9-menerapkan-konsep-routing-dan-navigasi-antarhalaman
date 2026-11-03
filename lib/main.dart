import 'package:flutter/material.dart';

void main() {
  runApp(const WisataApp());
}

class WisataApp extends StatelessWidget {
  const WisataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wisata Indonesia',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF087E8B),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/pantai': (context) => const KategoriPage(
              judul: 'Wisata Pantai',
              deskripsi: 'Keindahan pantai Indonesia',
              gambar: 'assets/images/pantai.jpg',
              warna: Color(0xFF087E8B),
            ),
        '/gunung': (context) => const KategoriPage(
              judul: 'Wisata Gunung',
              deskripsi: 'Pesona pegunungan Indonesia',
              gambar: 'assets/images/gunung.jpeg',
              warna: Color(0xFF39856B),
            ),
        '/budaya': (context) => const KategoriPage(
              judul: 'Wisata Budaya',
              deskripsi: 'Kekayaan budaya Nusantara',
              gambar: 'assets/images/budaya.webp',
              warna: Color(0xFFB66A36),
            ),
        '/kuliner': (context) => const KategoriPage(
              judul: 'Wisata Kuliner',
              deskripsi: 'Cita rasa khas Indonesia',
              gambar: 'assets/images/kuliner.jpeg',
              warna: Color(0xFFD18B27),
            ),
      },
    );
  }
}

// HALAMAN UTAMA
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> kategori = const [
    {
      'judul': 'Pantai',
      'deskripsi': 'Keindahan laut',
      'gambar': 'assets/images/pantai.jpg',
      'icon': Icons.beach_access,
      'route': '/pantai',
      'warna': Color(0xFF087E8B),
    },
    {
      'judul': 'Gunung',
      'deskripsi': 'Pesona alam',
      'gambar': 'assets/images/gunung.jpeg',
      'icon': Icons.terrain,
      'route': '/gunung',
      'warna': Color(0xFF39856B),
    },
    {
      'judul': 'Budaya',
      'deskripsi': 'Tradisi Nusantara',
      'gambar': 'assets/images/budaya.webp',
      'icon': Icons.museum,
      'route': '/budaya',
      'warna': Color(0xFFB66A36),
    },
    {
      'judul': 'Kuliner',
      'deskripsi': 'Makanan khas',
      'gambar': 'assets/images/kuliner.jpeg',
      'icon': Icons.restaurant,
      'route': '/kuliner',
      'warna': Color(0xFFD18B27),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF087E8B),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.travel_explore,
                        color: Colors.white,
                        size: 27,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jelajah Nusantara',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF17324D),
                          ),
                        ),
                        Text(
                          'Eksplorasi keindahan Indonesia',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // BANNER UTAMA
            SliverToBoxAdapter(
              child: Container(
                height: 220,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/indonesia.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(22),
                  alignment: Alignment.bottomLeft,
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Wonderful Indonesia',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Temukan keindahan alam dan budaya Indonesia.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // JUDUL KATEGORI
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jelajahi Wisata',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF17324D),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Pilih kategori wisata favoritmu',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),

            // GRID KATEGORI
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final item = kategori[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          item['route'] as String,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                                child: Image.asset(
                                  item['gambar'] as String,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Icon(
                                    item['icon'] as IconData,
                                    color: item['warna'] as Color,
                                    size: 22,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['judul'] as String,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          item['deskripsi'] as String,
                                          style: const TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: kategori.length,
                ),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.88,
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 30),
            ),
          ],
        ),
      ),
    );
  }
}

// HALAMAN KATEGORI
class KategoriPage extends StatelessWidget {
  final String judul;
  final String deskripsi;
  final String gambar;
  final Color warna;

  const KategoriPage({
    super.key,
    required this.judul,
    required this.deskripsi,
    required this.gambar,
    required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(
          judul,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: warna,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              gambar,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    judul,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF17324D),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    deskripsi,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tentang Wisata',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Indonesia memiliki beragam destinasi wisata '
                          'yang menarik untuk dikunjungi. Setiap daerah '
                          'memiliki keunikan dan daya tarik tersendiri, '
                          'mulai dari keindahan alam hingga kekayaan budaya.',
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.7,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Kembali ke Beranda'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: warna,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}