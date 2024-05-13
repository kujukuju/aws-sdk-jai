
### Changing Version Notes

Because I don't know what I'm doing with horrible cpp build processes I did this...

I gated `#    include <aws/common/math.gcc_builtin.inl>` by `!defined(JAI_GENERATOR)`.
```cpp
#if (defined(__clang__) || defined(__GNUC__)) && !defined(JAI_GENERATOR)
#    include <aws/common/math.gcc_builtin.inl>
#endif
```

I also put a fake version of _mulx_u32 inside math.msvc.inl gated by `defined(JAI_GENERATOR)`.
```cpp
#ifdef JAI_GENERATOR
#define __DEFAULT_FN_ATTRS __attribute__((__always_inline__, __nodebug__, __target__("bmi2")))
static unsigned int __DEFAULT_FN_ATTRS
_mulx_u32 (unsigned int __X, unsigned int __Y, unsigned int *__P)
{
  unsigned long long __res = (unsigned long long) __X * __Y;
  *__P = (unsigned int) (__res >> 32);
  return (unsigned int) __res;
}
#endif
```
