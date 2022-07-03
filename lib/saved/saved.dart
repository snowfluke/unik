import 'package:flutter/material.dart';
import 'package:unik/shared/shared.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      title: "Tersimpan",
      child: Column(
        children: const [
          Header(
            title: "Daftar NIK Tersimpan",
            description: "Mempermudah NIK tanpa perlu mengingat-ingat kembali",
          ),
          Body(
            child: ListTile(
              title: Text(
                "1234567890123456",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.delete),
            ),
          )
        ],
      ),
    );
  }
}
