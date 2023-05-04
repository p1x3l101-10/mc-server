#!/usr/bin/env bash

rm $PREFIX/overrides.yml
IFS='~'
ENVVARS=()
VOLS=()
for arg in "$@" "--env"; do
  case $arg in
    --env)
      NEWDEST='ENVVAR'
      NEW='true'
      ;;
    --vol)
      NEWDEST='VOLUME'
      NEW='true'
      ;;
    *)
      NEW='false'
      work+="$arg"
      ;;
  esac
  if [[ $NEW == 'true' ]];then
    case $DEST in
      'ENVVAR')ENVVARS+=( "$work" );;
      'VOLUME')VOLS+=( "$work" );;
    esac
    unset work
  fi
  DEST=$NEWDEST
done

DBLprintf() {
  printf "$@"
  printf "$@" 1>&2
}

toFile() {
  DBLprintf "$@" >> overrides.yml
  DBLprintf '\n' >> overrides.yml
}

toFile "services:"
toFile "  mc:"
toFile "    environment:"

for environ in ${ENVVARS[@]}; do
  toFile "      $environ"
done

toFile "      VERSION: $MC_VERS"
toFile "      TYPE: $MODLOADER"

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
