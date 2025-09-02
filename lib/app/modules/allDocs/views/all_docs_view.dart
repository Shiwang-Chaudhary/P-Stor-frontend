import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_docs_controller.dart';

class AllDocsView extends GetView<AllDocsController> {
  const AllDocsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllDocsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AllDocsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
