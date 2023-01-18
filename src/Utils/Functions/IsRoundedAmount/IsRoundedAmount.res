let isRounded = (~amount) => {
    amount <= -10000000.0 || amount >= 10000000.0 ? true: false
}