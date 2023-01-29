import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lovo_photography/models/photo.dart';
import 'package:lovo_photography/services/base_client.dart';

class PhotoPrintModal extends StatefulWidget {
  const PhotoPrintModal({
    required this.packageName,
    required this.listSelectedPhoto,
    Key? key
  }) : super(key: key);

  final String? packageName;
  final List<Photo> listSelectedPhoto;

  @override
  State<PhotoPrintModal> createState() => _PhotoPrintModalState();
}

class _PhotoPrintModalState extends State<PhotoPrintModal> {
  final List<String> listSize = [
    "2R / 6x8cm / 2.5x3.5inch",
    "3R / 6x9cm / 3.5x5inch",
    "4R / 10x15cm / 4x6inch",
    "5R / 12x17cm / 5x7inch",
    "6R / 15x20cm / 6x8inch",
  ];
  late List<String> listValues = List.generate(
    widget.listSelectedPhoto.length,
    (index) => widget.packageName!.toLowerCase() == "formal"
      ? listSize.first
      : listSize[2]
  );
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 666,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  const Text("Pilihan Cetak Foto"),
                  const SizedBox(height: 50,),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: List.generate(
                        widget.listSelectedPhoto.length,
                        (index) => ListTile(
                          title: Text(
                            "Ukuran Foto ke-${index+1}",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          subtitle: Text(
                            "IMG_${widget.listSelectedPhoto[index].idPhoto}."
                            "${widget.listSelectedPhoto[index].url?.split(".").last}",
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.secondary
                            ),
                          ),
                          trailing: DropdownButton(
                            value: listValues[index],
                            onChanged: (String? value) {
                              setState(() {
                                listValues[index] = value!;
                              });
                            },
                            items: listSize.map(
                              (size) => DropdownMenuItem(
                                value: size,
                                child: Text(
                                  size.toString(),
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            ).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text("Tanggal Pengambilan Foto : "),
                    trailing: SizedBox(
                      width: 200,
                      height: 40,
                      child: TextField(
                        controller: dateController,
                        readOnly: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: "Masukkan Tanggal",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          alignLabelWithHint: true,
                        ),
                        onTap: () async {
                          final DateTime minimumDate = DateTime(
                            DateTime.now().year,
                            DateTime.now().month,
                            DateTime.now().day + 3
                          );
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: minimumDate,
                            firstDate: minimumDate,
                            lastDate: DateTime(
                              DateTime.now().year,
                              DateTime.now().month,
                              DateTime.now().day + 17
                            ),
                          );

                          if (pickedDate == null) {
                            return;
                          }

                          String formattedDate = DateFormat("dd-MM-yyyy").format(pickedDate);
                          setState(() {
                            dateController.text = formattedDate;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
            ),
          ),
          dateController.text.isNotEmpty
          ? InkWell(
            onTap: () async {
              var response = await BaseClient().post("/mark", {}, json: {
                'date_due': dateController.text,
                'id_session': widget.listSelectedPhoto.first.idSession,
                'markers': List.generate(widget.listSelectedPhoto.length,
                  (index) => {
                    'print_size': listValues[index],
                    'id_marked_type': 1,
                    'id_photo': widget.listSelectedPhoto[index].idPhoto,
                  }
                ),
              });

              if (mounted) {
                if (response.runtimeType == int) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Gagal submit data..."))
                  );

                  return;
                }

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Submit data berhasil!"))
                );
              }
            },
            child: Container(
              height: 70,
              color: Theme.of(context).colorScheme.secondary,
              child: Center(
                child: ListTile(
                  leading: Text(
                    "SUBMIT",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  trailing: const Icon(Icons.forward),
                ),
              ),
            ),
          )
          : const SizedBox(),
        ],
      ),
    );
  }
}
