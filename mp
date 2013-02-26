#!/bin/bash

post=""

for word in $@; do
	post="$post $word"
done

adn "$post"
tw "$post"
