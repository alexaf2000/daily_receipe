/// `Rate` object model that indicates the rate of another object
/// it have's a 5 limit number.
class Rate {
  int puntuation;

  // Constructor
  Rate({puntuation}) {
    // Only set if is lower than 0
    if (puntuation <= 5) {
      this.puntuation = puntuation;
    } else {
      throw new Exception("Rate puntuation can not be higher than 5.");
    }
  }

  /// Adds a single point to the `Rate` puntuation
  void addPoint() {
    // If not passes the rate limit (5 points)
    if (this.puntuation + 1 <= 5) {
      this.puntuation++;
    }
  }

  /// Adds a single point to the `Rate` puntuation
  void removePoint() {
    // If still removable
    if (this.puntuation - 1 >= 0) {
      this.puntuation++;
    }
  }
}
