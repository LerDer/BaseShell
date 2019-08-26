#!/usr/bin/env bash
# shellcheck disable=SC1091
#===============================================================
source ./../../BaseShell/Starter/BaseTestHeader.sh
#===============================================================
source ./../../BaseShell/Lang/BaseObject.sh
#===============================================================
test-equals(){
  equals "1" "1"
  assertTrue $?

  equals "1" "1 "
  assertFalse $?

  equals "a" "a"
  assertTrue $?

  equals "11" ""
  assertFalse $?

  equals "" ""
  assertTrue $?

  equals "" "0"
  assertFalse $?
}


test-isNatural(){
  isNatural "1"
  assertTrue $?

  isNatural "2.1"
  assertFalse $?
}

test-new_fd(){
  fd=$(new_fd)
  assertEquals "${fd}" "4"

  exec 4<>file && rm file
  fd=$(new_fd)
  assertEquals "${fd}" "5"

  exec 4>&-
  fd=$(new_fd)
  assertEquals "${fd}" "4"
}

#===============================================================
source ./../../BaseShell/Starter/BaseTestEnd.sh
