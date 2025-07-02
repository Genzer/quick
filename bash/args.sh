#!/usr/bin/env bash
set -u -e -o pipefail

main() {
  declare -A opts

  opts=(
    ["name"]=
    ["all_caps"]="1"
  )

  while [ "$#" -gt 0 ]; do
    key="$1"
      
    case "$key" in
    --name)
      shift
      opts["name"]="$1"
      shift
      ;;
    --all-caps)
      opts["all_caps"]="1"
      shift
      ;;
    *)
      >&2 echo "[error] - Option $key is not supported!"
      usage
      exit 2
      shift
      ;;
    esac
  done

  if [[ "${opts[all_caps]}" == "1" ]]; then
    echo "Hello " "$(echo "${opts[name]}" | tr '[:lower:]' '[:upper:]')"
  else
    echo "Hello ${opts[name]}"
  fi
}

main "$@"
