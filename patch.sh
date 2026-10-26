KEY_ADDR=$(readelf -S build/main/main | grep .text | awk '{printf "0x%08x\n", strtonum("0x"$5)}')
PAYLOAD_OFFSET=$(readelf -S build/main/main | grep .payload | awk '{printf "0x%08x\n", strtonum("0x"$5)}')

sed -i "s/dd .*; @KEY_ADDR@/dd $KEY_ADDR  ; @KEY_ADDR@/" main.asm
sed -i "s/dd .*; @PAYLOAD_OFFSET@/dd $PAYLOAD_OFFSET  ; @PAYLOAD_OFFSET@/" main.asm
