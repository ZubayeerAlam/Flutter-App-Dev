enum Status { pending, shipped, delivered }

void main() {
  Status status = Status.pending;

  if (status == Status.pending) {
    print("Pending");
  } else if (status == .shipped) {
    print("Approved");
  } else {
    print("Rejected");
  }

  //Perfect combination is use enum with switch case

  switch (status) {
    case Status.pending:
      print("Pending");
      break;
    case Status.shipped:      //here must be apply all status of enum in case
      print("Approved");
      break;
    default:
      print("Rejected");
  }
}





