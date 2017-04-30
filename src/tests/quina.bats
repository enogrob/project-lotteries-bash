#!/usr/bin/env bats
#!./test/libs/bats/bin/bats

## Crafted (c) 2013~2017 by ZoatWorks Software LTDA.
## Prepared : Roberto Nogueira
## File     : quina.bats
## Version  : PA01
## Date     : 2017-04-30
## Project  : project-lotteries-bash
## Reference: bash
##
## Purpose  : Develop the test for quina.sh

load 'libs/bats-support/load'
load 'libs/bats-assert/load'

__setup(){
  source ../quina.sh
}

@test "01 - quina" {
  # skip
  __setup
  result=(`__quina 5`)
  assert_equal "5" "${#result[@]}"
}

@test "02 - sum" {
  # skip
  __setup
  result=`__sum 1 2 3 4`
  assert_equal "10" "$result"
}
