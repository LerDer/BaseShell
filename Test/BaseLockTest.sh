#!/usr/bin/env bash
# shellcheck disable=SC1091
#===============================================================
source ./../../BaseShell/Starter/BaseTestHeader.sh
#===============================================================
source ./../../BaseShell/Concurrent/BaseLock.sh
source ./../../BaseShell/Concurrent/BaseThreadPool.sh
#===============================================================
test-new_lock(){
  lock=$(new_fd)
  log_debug "lock_fd:${lock}"
  new_lock "${lock}"
  read -r -u "${lock}" result
  assertTrue "${result}"

  lock=$(new_fd)
  log_debug "lock_fd:${lock}"
  new_lock "${lock}"
  read -r -u "${lock}" result2
  assertTrue "${result2}"

  (
    lock=$(new_fd)
    log_debug "lock_fd:${lock}"
    new_lock "${lock}"
    read -r -u "${lock}" result
    assertTrue "${result}"

    local lock=6
    log_debug "lock_fd:${lock}"
    new_lock "${lock}"
    read -r -u "${lock}" result
    assertTrue "${result}"
  )

  lock=$(new_fd)
  log_debug "lock_fd:${lock}"
  new_lock "${lock}"
  read -r -u "${lock}" result
  assertTrue "${result}"
}
#===============================================================
source ./../../BaseShell/Starter/BaseTestEnd.sh
