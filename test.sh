#!/usr/bin/env bash

assert() {
    expected="$1"
    input="$2"

    ./9cc "$input" > tmp.s
    cc -o tmp tmp.s
    ./tmp
    actual="$?"

    if [ "$actual" = "$expected" ]; then
        echo "$input => $actual"
    else
        echo "$input => $expected expected, but got $actual"
        exit 1
    fi
}

assert 0 0
assert 42 42
assert 21 '5+20-4'
assert 41 ' 12 + 34 - 5 '
assert 13 '3 + 2 * 5'
assert 5  '3 + 13 / 5'
assert 4  '(3+5)/2'
assert 10 '-10+20'
assert 0 '10*-2+20'

echo OK
