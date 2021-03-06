// RUN: %dafny /env:0 /compile:0 "%s" > "%t.result"
// RUN: %diff "%s.expect" "%t.result"

module E {
  module SubE {
    export SubE provides T
    export A reveals TT
    type T = bool
    type TT = int
  }

  import SubEA = SubE`A
  
  method Test() {
    var g : SubE.TT; // error
    var gg : SubEA.TT;
    var e : SubE.T;
    var f := e == false; // error
    var gtest := gg == 1;
    
  }

}
