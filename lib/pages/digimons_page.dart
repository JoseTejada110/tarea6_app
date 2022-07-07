import 'package:flutter/material.dart';
import 'package:tarea6_app/data/data.dart';
import 'package:tarea6_app/models/digimon_model.dart';

class DigimonsPage extends StatefulWidget {
  const DigimonsPage({Key? key}) : super(key: key);

  @override
  State<DigimonsPage> createState() => _DigimonsPageState();
}

class _DigimonsPageState extends State<DigimonsPage> {
  bool isLoading = true;
  List<Digimon> digimons = [];

  @override
  void initState() {
    _loadDigimons();
    super.initState();
  }

  void _loadDigimons() async {
    final result = await getDigimons();
    digimons = result;
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Digimons'),
      ),
      body: isLoading ? _showLoading() : _buildDigimonList(),
    );
  }

  Widget _buildDigimonList() {
    return ListView.separated(
      itemCount: digimons.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        final digimon = digimons[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(digimon.img),
          ),
          title: Text(digimon.name),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) =>
                  _DigimonDetailDialog(digimon: digimon),
            );
          },
        );
      },
    );
  }

  Widget _showLoading() {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}

class _DigimonDetailDialog extends StatelessWidget {
  const _DigimonDetailDialog({
    Key? key,
    required this.digimon,
  }) : super(key: key);
  final Digimon digimon;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTitle(context),
          const SizedBox(
            height: 10.0,
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(10.0),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(digimon.img),
            ),
            title: Text(
              digimon.level,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            digimon.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          IconButton(
            tooltip: 'Cerrar',
            color: Colors.white,
            splashRadius: 25,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
