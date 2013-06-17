#!/bin/sh
file="${0}"
dir="`dirname ${file}`"
cd "${dir}" || exit 1

modulepath="/vagrant"
manifestpath="/vagrant"
alltests="0"
oktests="0"
failedtests="0"
snapshot="yes"

noop=""
if [ "${1}" = "noop" ]; then
  noop="--noop"
fi

runtest() {
  alltests="$((${alltests} + 1))"
  vagrant ssh -c "sudo puppet apply --verbose --detailed-exitcodes ${noop} --modulepath=${modulepath} ${manifestpath}/${1}"
  ec="${?}"
  if [ "${ec}" -eq 4 -o "${ec}" -eq 6 ]; then
    echo "\033[31mTest FAILED\033[0m"
    failedtests="$((${failedtests} + 1))"
  else
    echo "\033[32mTest OK\033[0m"
    oktests="$((${oktests} + 1))"
  fi
}

getuuid() {
  if [ -r ".vagrant" ]; then
    awk -F '"' '{ print $6 }' ".vagrant"
    return 0
  else
    return 1
  fi
}

#MAIN

vagrant up
if [ "${snapshot}" = "yes" ]; then
  uuid=`getuuid`
  vboxmanage snapshot "${uuid}" list | grep -q "before-puppet-test"
  if [ $? -gt 0 ]; then
    vboxmanage snapshot "${uuid}" take "before-puppet-test"
  fi
fi

#TESTS START
runtest "ntp/tests/ntp.pp"
runtest "acpid/tests/acpid_on.pp"
runtest "acpid/tests/acpid_off.pp"
runtest "acpid/tests/acpid_on.pp"
runtest "vimuser/tests/vimuser_add.pp"
runtest "vimuser/tests/vimuser_remove.pp"
#TESTS END

if [ "${snapshot}" = "yes" ]; then
  vagrant halt -f
  vboxmanage snapshot "${uuid}" restorecurrent
fi

if [ "${failedtests}" -eq "0" ]; then
  echo "\033[32m${oktests}/${alltests} TESTS OK\n${failedtests}/${alltests} TESTS FAILED\033[0m"
  exit 0
else
  echo "\033[31m${oktests}/${alltests} TESTS OK\n${failedtests}/${alltests} TESTS FAILED\033[0m"
  exit 1
fi
