#!/bin/bash

post=""

for word in $@; do
	post="$post $word"
done

t "$post" && a "$post"
