import unit_threaded.check;
import cerealed.cerealiser;


void testEncodeBool() {
    auto cereal = new Cerealiser();
    cereal.grain(false);
    cereal.grain(true);
    cereal.grain(false);
    checkEqual(cereal.bytes, [ 0x0, 0x1, 0x0 ]);
}

void testEncodeByte() {
    auto cereal = new Cerealiser();
    byte[] ins = [ 1, 3, -2, 5, -4];
    foreach(b; ins) cereal.grain(b);
    checkEqual(cereal.bytes, [ 0x1, 0x3, 0xfe, 0x5, 0xfc ]);
}
