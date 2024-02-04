```python
#字节
import random
random_bytes = random.randbytes(16)`

hex_str =hex(int_)
hex_str =obj.hex()

bytes_ = bytes(str_, encoding="utf-8")
bytes_ = str_.encode()
bytes_ = int_.to_bytes(len,'big')

int_=int(hex_str, 16))
```



```python
#数论
gmpy2.powmod(x, y, m, /)→ mpz
gmpy2.gcd(3,12)
gmpy2.is_prime(5)
gmpy2.is_even(4) #判断一个数是否为偶数
gmpy2.is_odd(4)  #判断一个数是否为奇数
gmpy2.invert(3,11)
gmpy2.mod(x, y, /)


from sympy import legendre_symbol,sqrt_mod
```



```python
#密码学组件
from Crypto.Hash import SHA256
hashVal=SHA256.new(M).hexdigest()

Crypto.Util.number.getPrime(N, randfunc=None) 
# Return a random N-bit prime number.
Crypto.Util.number.getStrongPrime(N, e=0, false_positive_prob=1e-06, randfunc=None)
#Return a random strong N-bit prime number. In this context, p is a strong prime if p-1 and p+1 have at least one large prime factor.
```




