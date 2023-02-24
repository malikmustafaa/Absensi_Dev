enum FharFormat {
  formatEKTP,
  formatSwafoto,
  formatTandaTangan,
}

enum FharOrientation { landscape, portrait }

abstract class FharModel {
  double? ratio;

  double? cornerRadius;

  FharOrientation? orientation;
}

class CardFhar implements FharModel {
  CardFhar(
      {this.ratio = 1.5,
      this.cornerRadius = 0.66,
      this.orientation = FharOrientation.landscape});

  @override
  double? ratio;
  @override
  double? cornerRadius;
  @override
  FharOrientation? orientation;

  static byFormat(FharFormat format) {
    switch (format) {
      case (FharFormat.formatEKTP):
        return CardFhar(ratio: 1.59, cornerRadius: 0.064);
      case (FharFormat.formatSwafoto):
        // return CardFhar(ratio: 1.42, cornerRadius: 0.067);
        return CardFhar(ratio: 0.672, cornerRadius: 0.027);
      case (FharFormat.formatTandaTangan):
        return CardFhar(ratio: 1.42, cornerRadius: 0.067);
    }
  }
}
