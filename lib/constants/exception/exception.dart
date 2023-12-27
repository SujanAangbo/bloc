import 'dart:io';

class ProductNotFoundException extends HttpException {
  ProductNotFoundException(super.message);
}
