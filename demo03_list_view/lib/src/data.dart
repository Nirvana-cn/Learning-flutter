class MockData {
  final String imageUrl;
  final String time;
  final double eFee;
  final double serviceFee;
  final double totalFee;

  MockData(
      {this.imageUrl, this.time, this.eFee, this.serviceFee, this.totalFee});
}

final List<MockData> data = [
  new MockData(
      imageUrl: "lib/assets/gu.png",
      time: "00:00-7:00",
      eFee: 0.4023,
      serviceFee: 0.8000,
      totalFee: 1.2023),
  new MockData(
      imageUrl: "lib/assets/ping.png",
      time: "07:00-10:00",
      eFee: 0.8697,
      serviceFee: 0.6000,
      totalFee: 1.4697),
  new MockData(
      imageUrl: "lib/assets/feng.png",
      time: "10:00-15:00",
      eFee: 1.3884,
      serviceFee: 0.6000,
      totalFee: 1.9884),
  new MockData(
      imageUrl: "lib/assets/ping.png",
      time: "15:00-18:00",
      eFee: 0.8697,
      serviceFee: 0.6000,
      totalFee: 1.4697)
];
