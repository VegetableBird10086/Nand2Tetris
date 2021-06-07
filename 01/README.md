# ADD GATE:
```cpp
CHIP And {
    IN a, b;
    OUT out;

    PARTS:
    Nand(a=a, b=b, out=temp);
	Nand(a=temp, b=temp, out=out);
}
```
