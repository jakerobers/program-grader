# Program Grader

I created a small script that runs in a docker container that runs programs and validates output.

## Setup

Only tested on Mac, but should work in Windows and Linux. Install Docker before proceeding.

```
git clone https://github.com/jakerobers/program-grader
cd program-grader
```

## How to Use

Place your test suite of files in the `test_files` directory. They can be named anything so long that there is a `<<filename>>.in` that accompanies a `<<filename.out>>`. All student test results will be named `<<filename.out.tst>>`

Put a student's program in the src directory and change the name to `Main.java` or `Main.cpp`. Otherwise adjust the start.sh script to account for this.

There is a directory named `archive` for previously tested files, which is not tracked by git.

```
docker build -t program-grader
docker run program-grader
```

