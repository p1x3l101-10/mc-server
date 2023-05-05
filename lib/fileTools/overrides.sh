#!/usr/bin/env bash

toFile() {
  printf "$@" >> overrides.yml
  printf '\n' >> overrides.yml
}

toFile "services:"
toFile "  mc:"

IFS='~'
ENVVARS=()
VOLS=()
for arg in "$@" "--dry"; do
  case $arg in
    --env)
      NEWDEST='ENVVAR'
      NEW='true'
      ;;
    --vol)
      NEWDEST='VOLUME'
      NEW='true'
      ;;
    --img)
      NEWDEST="IMAGE"
      NEW='true'
      ;;
    --dry)
      NEWDEST="NONE"
      NEW='true'
      ;;
    *)
      NEW='false'
      work+=" $arg"
      ;;
  esac
  if [[ $NEW == 'true' ]];then
    case $DEST in
      'ENVVAR')ENVVARS+=("$work");;
      'VOLUME')VOLS+=("$work");;
      'IMAGE')toFile "    image: $work";;
    esac
    unset work
  fi
  DEST=$NEWDEST
done

toFile "    environment:"

for environ in ${ENVVARS[@]}; do
  toFile "      $environ"
done

if [[ -n $MC_VERS ]]; then
  toFile "      VERSION: $MC_VERS"
fi

if [[ -n $MC_VERS ]]; then
  toFile "      TYPE: $MODLOADER"
fi

toFile ""

toFile "volumes:"
for volume in ${VOLS[@]}; do
  toFile "  $volume:"
  toFile "    driver: local"
  toFile "    driver_opts:"
  toFile "      type: 'none'"
  toFile "      o: 'bind'"
  toFile "      device: '$PREFIX/$volume'"
done
