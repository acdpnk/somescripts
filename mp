#!/bin/bash

post=""

for word in $@; do
	post="$post $word"
done

/Users/chrifpa/.scrpt/t "$post" && /Users/chrifpa/.scrpt/a "$post"
