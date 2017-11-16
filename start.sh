#!/bin/bash

TEST_FILES=/test_files/*
declare -a file_base=("test_1" "test_2")

for file in "${file_base[@]}"; do
	echo "============================ "
	echo "Processing ${file}:"

	file_in="/test_files/${file}.in"
	file_out="/test_files/${file}.out"

	cat ${file_in} | java Main > /test_files/${file}.out.tst

	file_out_tst="/test_files/${file}.out.tst"

	if [ ! -f "$file_in" ]; then
		printf "In file %s is missing\n" "$file_in"
		continue;
	fi
	if [ ! -f "$file_out" ]; then
		printf "Validation file %s is missing\n" "$file_out_val"
		continue;
	fi
	if [ ! -f "$file_out_tst" ]; then
		printf "Validation file %s is missing\n" "$file_out_val"
		continue;
	fi

	diff -iad "${file_out_tst}" "${file_out}"

	e_code=$?
	if [ $e_code != 0 ]; then
		printf "TEST FAIL : %d\n" "$e_code"
	else
		printf "TEST OK!\n"
	fi
	echo "============================ "
done

