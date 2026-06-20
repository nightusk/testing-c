#include "erl_nif.h"
#include "../../c/lib.c"

static ERL_NIF_TERM nif_fibonacci(ErlNifEnv *env, int argc,
                                  const ERL_NIF_TERM argv[]) {
  if (argc != 1)
    return enif_make_badarg(env);

  uint32_t n;
  if (!enif_get_uint(env, argv[0], &n))
    return enif_make_badarg(env);

  return enif_make_uint64(env, fibonacci((uint8_t)n));
}

static ErlNifFunc nif_funcs[] = {
    {"fibonacci", 1, nif_fibonacci},
};

ERL_NIF_INIT(test, nif_funcs, NULL, NULL, NULL, NULL)
