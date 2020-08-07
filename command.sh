#!/bin/sh

function update_domain {
  if [ -z ${1+x} ]
  then
    echo "No domain passed, nothing to do.."
    return 0
  fi
  if [ -z ${2+x} ]
  then
    echo "No IP Version passed, nothing to do.."
    return 0
  fi
  OUT=$(curl -${2} --basic --silent -u "$YDNS_USER:$YDNS_PASSWD" https://ydns.io/api/v1/update/?host=${1})
  if [ "${OUT}" = "ok" ]; then
    echo "Successfully updated IPv${2} '${1}'";
  else
    echo "Error updating IPv${2} '${1}': ${OUT}";
  fi
}

domains=$(env | grep ^DOMAIN | cut -d '=' -f2)

if [ -z "${domains}" ]
then
    echo "No domains set. Example: DOMAIN1=mine.example.org"
    exit 1
fi

if [ -z "${ENABLE_IPV4}" ] && [ -z "${ENABLE_IPV6}" ]
then
    echo "No IP version enabled, set at least one: ENABLE_IPV4, ENABLE_IPV6"
    exit 1
fi

while [ true ]
do
    for domain in ${domains}
    do
        if [ -n "${ENABLE_IPV4}" ]
        then
            update_domain ${domain} 4
        fi
        if [ -n "${ENABLE_IPV6}" ]
        then
            update_domain ${domain} 6
        fi
    done
    sleep "${UPDATE_DELAY}"
done
