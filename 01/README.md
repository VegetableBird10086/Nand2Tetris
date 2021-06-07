# 这里简述一下各种门的实现
## 1.And
Nand(a, b) = Not(And(a, b))
因此，可以用Nand(Nand(a, b), Nand(a, b))表示And(a, b)

## 2.And16
使用And即可
