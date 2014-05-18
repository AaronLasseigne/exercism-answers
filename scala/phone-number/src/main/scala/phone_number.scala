class PhoneNumber(phoneNumber: String) {
  lazy val number = PhoneNumber.clean(phoneNumber)

  lazy val areaCode = number.substring(0, 3)

  override lazy val toString = {
    s"($areaCode) ${number.substring(3, 6)}-${number.substring(6)}"
  }
}

object PhoneNumber {
  private def clean(number: String) = {
    var cleanNumber = number.replaceAll("""[^\d]""", "")

    if (cleanNumber.size == 11 && cleanNumber.startsWith("1")) {
      cleanNumber = cleanNumber.substring(1)
    } else if (cleanNumber.size != 10) {
      cleanNumber = "0000000000"
    }

    cleanNumber
  }
}
