# Package

version       = "0.1.0"
author        = "Anonymous"
description   = "test c in nim"
license       = "MIT"

# Dependencies

requires "nim >= 2.2.10"

# Task

import std/os

task test, "Run tests":
  setCommand "c", "nim/test.nim"
  switch("run")
  switch("backend", "c")
