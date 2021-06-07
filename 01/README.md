# 这里简述一下部分门的实现
## 1.And
Nand(a, b) = Not(And(a, b))
因此，可以用Nand(Nand(a, b), Nand(a, b))表示And(a, b)

## 2.Not
Not(in) = Nand(in, in)

## 3.Or 
Nand(a, b) = Or(Not(a), Not(b))
Or(a, b) = Nand(Not(a), Not(b))

## 4.Mux
Mux是一个选择器，如果为0选择a，否则选择b
因此，可以考虑用a与\bar{sel}通过And门相连
b与\bar{sel}通过And门相连
