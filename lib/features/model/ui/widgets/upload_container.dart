import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadFile extends StatefulWidget {
  final Function(Uint8List?)? onFileSelected;
  final int maxFileSizeInMB;

  const UploadFile({
    super.key,
    this.onFileSelected,
    this.maxFileSizeInMB = 5,
  });

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  Uint8List? _selectedFile;
  String? _fileName;
  bool _isHovering = false;

  void _pickImage() async {
    final picker = ImagePicker();
    final result = await picker.pickImage(source: ImageSource.gallery);
    if (result != null) {
      final bytes = await result.readAsBytes();
      final size = bytes.lengthInBytes;
      if (size > widget.maxFileSizeInMB * 1024 * 1024) {
        _showErrorDialog(
            'الملف يتجاوز الحد الأقصى (${widget.maxFileSizeInMB} ميجابايت)');
        return;
      }
      setState(() {
        _selectedFile = bytes;
        _fileName = result.name;
      });
      widget.onFileSelected?.call(_selectedFile);
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('خطأ'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('موافق'),
          ),
        ],
      ),
    );
  }

  void _clearFile() {
    setState(() {
      _selectedFile = null;
      _fileName = null;
    });
    widget.onFileSelected?.call(null);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovering = true),
        onExit: (_) => setState(() => _isHovering = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _isHovering
                  ? [Colors.teal.shade100, Colors.teal.shade50]
                  : [Colors.grey.shade100, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: _isHovering ? Colors.teal.shade300 : Colors.grey.shade300,
              width: 2,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: _selectedFile == null
              ? _buildUploadPrompt()
              : _buildFilePreview(),
        ),
      ),
    );
  }

  Widget _buildUploadPrompt() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.upload_file,
          size: 70,
          color: _isHovering ? Colors.teal : Colors.grey.shade500,
        ),
        const SizedBox(height: 14),
        Text(
          'اختر صورة من الجهاز',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: _isHovering ? Colors.teal.shade800 : Colors.grey.shade700,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'يدعم كافة أنواع الصور',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildFilePreview() {
    return Row(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            image: DecorationImage(
              image: MemoryImage(_selectedFile!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 18),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _fileName ?? 'صورة مختارة',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                '${(_selectedFile!.length / 1024).toStringAsFixed(2)} KB',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: _clearFile,
          icon: const Icon(Icons.close, color: Colors.red),
        ),
      ],
    );
  }
}
