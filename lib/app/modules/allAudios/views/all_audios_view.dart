import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_audios_controller.dart';

class AllAudiosView extends GetView<AllAudiosController> {
  const AllAudiosView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllAudiosView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AllAudiosView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
