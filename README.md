# How to Use Bash

There are many ways to use bash, but there are also many practices you should avoid.

In this repository, I will share a few best practices that I have personally found useful.

## KISS: Keep It Simple, Stupid!

If your bash script is too big or too complicated, you probably did something wrong. 
Bash scripts should be small and use simple syntax.

Bash scripts should help you perform tasks more efficiently, not solve every problem. For instance, if you frequently run a series of commands, put them in a small helper script. However, bash is not the language to implement your next big project in; it is more of a tool to make your workflows easier.

If they become to big or complicated, something is wrong.

## Shebang

When writing bash scripts, it's important to specify the correct path in the shebang. Here are two common options:
1. `#!/usr/bin/env bash`
2. `#!/bin/bash`

### -e 
However, it's even more crucial to consider the arguments you pass to bash. For example, using `-e` will cause bash to exit immediately if any command exits with a non-zero status.

For a example, check the "shebang/" folder in this repository.

A script should never blindly assume everything is in order, only to proceed into chaos when things go awry. 

Using `-e` ensures that the script halts at the first sign of trouble, rather than ignoring the issue like an ostrich burying its head in the sand, pretending all is well while the script wreaks havoc on your system.

So always start your scripts with either 
```
#!/bin/bash -e
```
or
```
#!/usr/bin/env bash
set -e
```

### -x

To help debug a bash script it is usually not needed to add a lot of prints, 
just to see where it failed or what args was used. 

if you add the -x argument to bash all lines that is executed 
will be printed with a + signed at the start of the line, 
that way you can se what was executed and with what args. 


## exit codes

Exit codes are a crucial part of bash scripting. They indicate the success or failure of the commands executed within the script. By convention, an exit code of `0` signifies that the command was successful, while any non-zero exit code indicates an error.

### Checking Exit Codes

You can check the exit code of the last executed command using the special variable `$?`. For example:

```bash
#!/bin/bash

mkdir /some/directory
if [ $? -ne 0 ]; then
    echo "Failed to create directory"
    exit 1
fi
```

In this script, if the `mkdir` command fails, the script will print an error message and exit with a status of `1`.

### Custom Exit Codes

You can also specify custom exit codes in your scripts to indicate different types of errors. For example:

```bash
#!/bin/bash

if [ -z "$1" ]; then
    echo "No argument provided"
    exit 2
fi

# Rest of the script
```

In this script, if no argument is provided, the script exits with a status of `2`.

### Using `exit` Command

The `exit` command is used to terminate a script and can be followed by an exit code. If no exit code is provided, the script will exit with the status of the last executed command.

```bash
#!/bin/bash

echo "This is a test script"
exit 0
```

In this example, the script will exit with a status of `0`, indicating success.

By properly using exit codes, you can make your bash scripts more robust and easier to debug.


## || and &&

TBD

```
command || exit 1
```