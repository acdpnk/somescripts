#!/bin/bash

post=""

for word in $@; do
	post="$post $word"
done

tw "$post" && adn "$post"