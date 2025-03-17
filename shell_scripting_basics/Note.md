

# **Shell Scripting Basics**  

## **What is a Script?**  
A script is a list of commands that can be interpreted and executed by a scripting language. Unlike compiled languages, scripting languages are interpreted at runtime, making them easier and faster to develop but generally slower to run.  

## **Use Cases for Scripting**  
Scripts are widely used to automate various tasks, including:  
- ETL (Extract, Transform, Load) jobs  
- File backups and archiving  
- System administration tasks  
- Application integration  
- Web application development  

## **Understanding the Shebang (`#!`) Directive**  
The first line of a script usually contains a *shebang* (`#!`) directive, which specifies the interpreter to execute the script. Examples include:  
- `#!/bin/sh` → Uses the Bourne shell (`sh`)  
- `#!/bin/bash` → Uses the Bash shell  
- `#!/usr/bin/env python3` → Runs the script using Python 3  

## **Creating and Running a Simple Shell Script**  
Follow these steps to create and execute a simple "Hello, World!" shell script:  

1. **Create an empty script file:**  
   ```bash
   touch hello_world.sh
   ```  
   
2. **Add the shebang directive for Bash:**  
   ```bash
   echo "#!/bin/bash" >> hello_world.sh
   ```  

3. **Write a command inside the script:**  
   ```bash
   echo "echo Hello World" >> hello_world.sh
   ```  

4. **Check current file permissions:**  
   ```bash
   ls -l hello_world.sh
   ```  
   - If the script is not executable (missing `x` in permissions), update it using the next step.  

5. **Make the script executable:**  
   ```bash
   chmod +x hello_world.sh
   ```  

6. **Run the script:**  
   ```bash
   ./hello_world.sh
   ```  
   - Output: `Hello World`  

## **Key Takeaways**  
- A shell script is an executable text file that starts with a *shebang* directive.  
- Shell scripts automate tasks by executing commands and running programs.  
- Scripting languages are interpreted at runtime, while compiled languages are faster but require more development effort.  
 

<br/>

<br/>

# **Filters, Pipes, and Variables**  

## **Filters**  
Filters are shell commands or programs that:  
- Take input from **standard input** (usually the keyboard).  
- Return output to **standard output** (usually the terminal).  
- Transform input data into output data.  

### **Common Filters**  
Examples of commonly used filters:  
- `wc` → Counts words, lines, and characters.  
- `cat` → Concatenates and displays file content.  
- `more`, `head` → Display portions of a file.  
- `sort` → Sorts text.  
- `grep` → Searches for patterns in text.  

## **Pipes (`|`)**  
Pipes allow chaining multiple filter commands together.  
- Syntax:  
  ```bash
  command1 | command2 | command3
  ```  
  - The output of `command1` becomes the input for `command2`, and so on.  

### **Example:**  
Reverse sorting directory contents:  
```bash
ls | sort -r
```  

## **Shell Variables**  
Shell variables exist **only within the shell session** in which they are created.  
- To list all shell variables:  
  ```bash
  set  
  ```  
  - Because `set` outputs a lot of data, use a pipe to limit the display:  
    ```bash
    set | head -4
    ```  

### **Defining and Using Shell Variables**  
- Assign a value (no spaces around `=`):  
  ```bash
  GREETINGS="Hello"
  ```  
- Access and print the variable:  
  ```bash
  echo $GREETINGS
  ```  
- Define another variable and combine outputs:  
  ```bash
  AUDIENCE="World"
  echo $GREETINGS $AUDIENCE
  ```  
  - Output: `Hello World`  

- Remove a variable:  
  ```bash
  unset AUDIENCE
  ```  

## **Environment Variables**  
Environment variables are like shell variables but **persist across child processes**.  
- Convert a shell variable to an environment variable:  
  ```bash
  export GREETINGS
  ```  
- List all environment variables:  
  ```bash
  env
  ```  
- Check if `GREETINGS` is now an environment variable:  
  ```bash
  env | grep GREE
  ```  

## **Key Takeaways**  
- **Filters** process input and generate output (e.g., `wc`, `grep`, `sort`).  
- **Pipes (`|`)** allow chaining multiple commands together.  
- **Shell variables** exist only in the current shell session and are created using `=`.  
- **Environment variables** persist across child processes and are created using `export`.  

<br/>
<br/>

# Useful Features of the Bash Shell

## Key Features of Bash Shell-Scripting

### Metacharacters
Metacharacters are special characters that have meaning to the shell:
- `#` - Used for comments, ignored by the shell.
- `;` - Separates multiple commands on the same line.
- `*` - Represents any number of consecutive characters in a filename pattern.
- `?` - Acts as a single-character wildcard.

### Quoting
Quoting determines how the shell interprets special characters:
- **Backslash (`\`)** - Escapes a single character to be treated literally.
- **Double quotes (`""`)** - Preserves literal text but allows metacharacters to be interpreted.
- **Single quotes (`''`)** - Interprets all contents literally.

### Input/Output (I/O) Redirection
Redirects standard input and output:
- `>` - Redirects standard output to a file (overwrites file contents).
- `>>` - Appends standard output to a file.
- `2>` - Redirects error messages to a file.
- `2>>` - Appends error messages to a file.
- `<` - Redirects file contents as standard input.

### Command Substitution
Replaces a command with its output:
- **Syntax 1:** `$(command)`
- **Syntax 2:** `` `command` `` (backticks)

Example:
```bash
here=$(pwd)
echo $here
```

### Command Line Arguments
Used to pass arguments to a shell script:
```bash
./MyBashScript.sh arg1 arg2
```

### Modes of Execution
- **Batch Mode:** Commands execute sequentially.
  ```bash
  command1; command2
  ```
- **Concurrent Mode:** Commands run in parallel using `&`.
  ```bash
  command1 & command2
  ```

## Summary
- **Metacharacters** define special characters with meaning to the shell.
- **Quoting** controls whether special characters are interpreted or escaped.
- **I/O redirection** redirects input and output streams.
- **Command substitution** allows replacing a command with its output.
- **Command line arguments** pass parameters to a script.
- **Concurrent mode** enables parallel execution of commands.

<br/>
<br/>
<br/>

# **Advanced Bash Scripting**  

## **Conditionals**  
```bash
  if [ condition ]
  then
      statement_block_1  
  else
      statement_block_2  
  fi
```

```bash
  ## && operator
  if [ condition1 ] && [ condition2 ]
  then
      echo "conditions 1 and 2 are both true"
  else
      echo "one or both conditions are false"
  fi

  ## || operator
  if [ condition1 ] || [ condition2 ]
  then
      echo "conditions 1 or 2 are true"
  else
      echo "both conditions are false"
  fi
```
## **Logical operators**
https://tldp.org/LDP/abs/html/comparison-ops.html

## **Arithmetic calculations $(())**
```bash
## 
  echo $((3+2))

##
  a=3
  b=2
  c=$(($a+$b))
  echo $c
```

## **Arrays**
The array is a Bash built-in data structure. An array is a space-delimited list contained in parentheses
```bash
# built-in 
my_array=(1 2 "three" "four" 5)

# empty array
declare -a empty_array
# add items to your array after creating it
my_array+=("six")
my_array+=(7)

# access individual or multiple elements
# print the first item of the array:
echo ${my_array[0]}
# print the third item of the array:
echo ${my_array[2]}
# print all array elements:
echo ${my_array[@]}

```

## **for loops**

```bash
for item in ${my_array[@]}; do
  echo $item
done

#or
for i in ${!my_array[@]}; do
  echo ${my_array[$i]}
done

#or
N=6
for (( i=0; i<=$N; i++ )) ; do
  echo $i
done

#for loops to accomplish all sorts of things
#!/usr/bin/env bash
# initialize array, count, and sum
my_array=(1 2 3)
count=0
sum=0
for i in ${!my_array[@]}; do
  # print the ith array element
  echo ${my_array[$i]}
  # increment the count by one
  count=$(($count+1))
  # add the current value of the array to the sum
  sum=$(($sum+${my_array[$i]}))
done
echo $count
echo $sum

```

<br/>
<br/>

# **Scheduling Jobs Using Cron**  

## **What is Cron?**  
Cron is a utility in Linux and Unix-like operating systems that allows users to schedule tasks (known as cron jobs) to run automatically at specified times.  

### **Key Components:**  
- **Cron** → The tool that runs scheduled jobs.  
- **Crond** → The daemon that reads and executes cron jobs.  
- **Crontab** → A table (file) that contains scheduled jobs.  

---

## **Using Crontab**  

### **Opening Crontab Editor**  
To create or edit cron jobs, use:  
```bash
crontab -e
```
This opens the default text editor (usually **nano**).  



## **Cron Job Syntax**  
A cron job follows this format:  
```bash
* * * * * command_to_run
```
Where:  
| Field         | Meaning                  | Allowed Values   |
|--------------|--------------------------|-----------------|
| **Minute**   | When to run (0 - 59)      | `0-59` or `*`   |
| **Hour**     | Hour of the day (0 - 23)  | `0-23` or `*`   |
| **Day**      | Day of the month (1 - 31) | `1-31` or `*`   |
| **Month**    | Month (1 - 12)            | `1-12` or `*`   |
| **Weekday**  | Day of the week (0 - 6) (Sunday = 0) | `0-6` or `*` |

---

## **Examples of Cron Jobs**  
| Task | Cron Syntax | Description |
|------|------------|-------------|
| Append current date to `sundays.txt` every Sunday at 3:30 PM | `30 15 * * 0 date >> ~/sundays.txt` | Runs every Sunday at 3:30 PM |
| Run `load_data.sh` script every day at midnight | `0 0 * * * /home/user/load_data.sh` | Runs daily at 12:00 AM |
| Run `backup.sh` every Sunday at 2:00 AM | `0 2 * * 0 /home/user/backup.sh` | Runs weekly on Sundays at 2:00 AM |

---

## **Managing Cron Jobs**  
### **List Existing Cron Jobs**  
```bash
crontab -l
```

### **Remove a Cron Job**  
1️⃣ Run `crontab -e`  
2️⃣ Delete the specific job line  
3️⃣ Save and exit  

To remove all cron jobs, run:  
```bash
crontab -r
```

---

## **Summary**  
🔹 **Cron** automates task scheduling in Linux.  
🔹 **Crontab** manages scheduled jobs.  
🔹 Use `crontab -e` to edit and `crontab -l` to list jobs.  
🔹 Cron syntax includes **minute, hour, day, month, and weekday**.  