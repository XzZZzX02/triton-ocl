// Translator must return an error, never abort, for a known but unsupported op.
module {
  func.func @unsupported(%x: i32) {
    %y = math.ctpop %x : i32
    return
  }
}
