

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
