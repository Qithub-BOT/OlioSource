[![All Tests](https://github.com/Qithub-BOT/OlioSource/actions/workflows/all-tests.yml/badge.svg)](https://github.com/Qithub-BOT/OlioSource/actions/workflows/all-tests.yml)

# OlioSource

"oliosource" is a simple shell script that merges "sourced" shell scripts as a single script for your convenient distribution.

In other words, " `. ./foo.sh` " or " `source ./foo.sh` " lines in a shell script get replaced with the content of " `./foo.sh` " without the shebang.

## Usage

```bash
oliosource /path/to/target/main.sh
```

* Note
  + If `shfmt` is installed then it will format the output as well.
  + Runs on POSIX compatible shells.
  + Tested on latest macOS and Linux(Ubuntu).

## About OlioSource

Grouping the frequently used functions in other files and import or source them eliminates duplicate code and reduces the size of a script for better visibility and maintenance.

Even though we like this approach, we felt distributing as a single script is much convenient for the users to download.

To solve this problem, "oliosource" is our rough draft to merge the "sourced" scripts into one file. It simply replaces the " `.` " or " `source` " line to the source file's content without the `shebang` and nothing more.

Any contribution for the better is welcome!

## Example

```shellsession
$ cat ./path/to/main_script.sh
#!/bin/bash

# shellcheck disable=SC1091
. ./parrotry.sh

if [ 0 = $# ]; then
    echo >&2 "argument missing"
    exit 1
fi

parrotry "$@"

$ cat ./path/to/parrotry.sh
#!/bin/bash

# parrotry echoes the given args to STDOUT
parrotry() {
    echo "$@"
}

$ # Let's run!!
$ oliosource ./path/to/main_script.sh
#!/bin/bash

# parrotry echoes the given args to STDOUT
parrotry() {
    echo "$@"
}

if [ 0 = $# ]; then
    echo >&2 "argument missing"
    exit 1
fi

parrotry "$@"

```

## Download

* Raw script: `https://raw.githubusercontent.com/Qithub-BOT/OlioSource/master/oliosource`

```bash
curl -sL https://raw.githubusercontent.com/Qithub-BOT/OlioSource/master/oliosource
```

* To install the script, place it in any path at `$PATH` env variable and `chmod +x` to give access.

## Remarks

* Issues and PRs may be in Japanese, Spanish or English.
* Providing a test that reproduces the failure in the issue will help us a lot.

## License

* [MIT](https://github.com/Qithub-BOT/OlioSource/blob/master/LICENSE)
* Copyright (c) [The OlioSource Contributors](https://github.com/Qithub-BOT/OlioSource/graphs/contributors)
