# Common Linux Shell Commands  

A **shell** is an interactive user interface for Unix-like operating systems that interprets commands and runs programs. It also serves as a scripting language for automating tasks. The default shell on most Linux systems is **Bash (Bourne Again Shell)**, but others include SH, KSH, TCSH, ZSH, and Fish.  

#### **Common Applications of Shell Commands:**  
1. **Getting system information**  
   - `whoami` – Returns the current user  
   - `id` – Displays user and group IDs  
   - `uname` – Shows the OS name  
   - `ps` / `top` – Displays running processes  
   - `df` – Shows disk usage  
   - `date` – Prints today's date  

2. **File Management**  
   - `cp` – Copy files  
   - `mv` – Rename or move files  
   - `rm` – Delete files  
   - `touch` – Create empty files or update timestamps  
   - `chmod` – Modify file permissions  
   - `wc` – Count lines, words, and characters  
   - `grep` – Search for text patterns  

3. **Directory Navigation**  
   - `ls` – List files and directories  
   - `find` – Search for files  
   - `pwd` – Show current directory  
   - `mkdir` – Create a new directory  
   - `cd` – Change directory  
   - `rmdir` – Remove a directory  

4. **Printing File Contents**  
   - `cat` – Print entire file content  
   - `more` – View file content page by page  
   - `head` / `tail` – Display first/last lines of a file  
   - `echo` – Print strings or variables  

5. **File Compression & Archiving**  
   - `tar` – Archive multiple files  
   - `zip` – Compress files  
   - `unzip` – Extract files  

6. **Networking Commands**  
   - `hostname` – Display the system's hostname  
   - `ping` – Check connectivity to a URL  
   - `ifconfig` – View network configuration  
   - `curl` – Fetch a file from a URL  
   - `wget` – Download files  

For Windows users, Linux can be run via dual-boot, virtual machines, **CygWin**, or the **Windows Subsystem for Linux (WSL)**.

<br/>

# Viewing File Content

- **`cat`**: Prints the entire file to standard output.  
- **`more`**: Displays a file page by page, allowing navigation with the space bar.  
- **`head`**: Shows the first 10 lines of a file by default (customizable with `-n`).  
- **`tail`**: Displays the last 10 lines of a file by default (customizable with `-n`).  
- **`wc`**: Counts lines, words, and characters in a file. Options include `-l` for lines, `-w` for words, and `-c` for characters.  

<br/>

# Useful Commands for Wrangling Text Files

- **`sort`**: Sorts file lines alphanumerically (`-r` for reverse order).  
- **`uniq`**: Removes consecutive duplicate lines from a file.  
- **`grep`**: Searches for lines matching a pattern (case-insensitive with `-i`).  
- **`cut`**: Extracts specific character ranges (`-c`) or fields (`-d` for delimiter, `-f` for field selection).  
- **`paste`**: Merges lines from multiple files into columns (default delimiter: tab, customizable with `-d`).  

<br/>

# **Networking Commands**  

- **`hostname`**: Displays or sets the machine’s hostname.  
  - `hostname -s` → Shows the hostname without the domain suffix.  
  - `hostname -i` → Returns the IP address of the hostname.  

- **`ifconfig`**: Displays network interface details (IP address, MAC address, data stats).  
  - `ifconfig` → Lists all network interfaces.  
  - `ifconfig eth0` → Shows details of a specific Ethernet adapter.  

- **`ping`**: Tests connectivity to a URL or IP address.  
  - `ping google.com` → Sends continuous ICMP requests.  
  - `ping -c 5 google.com` → Sends only 5 requests and then stops.  

- **`curl`**: Transfers data from a URL.  
  - `curl www.google.com` → Fetches and displays the HTML content.  
  - `curl -o google.txt www.google.com` → Saves the output to a file.  

- **`wget`**: Downloads files from a URL (supports recursive downloading).  
  - `wget http://example.com/file.txt` → Downloads a file.  
  - `wget -r http://example.com/folder/` → Recursively downloads all files in a directory.  

<br/>

# **File Archiving and Compression Commands**  
 

## **1. Archiving vs. Compression**  
- **Archiving**: Storing multiple files and directories in a single file for easy transfer and backup.  
- **Compression**: Reducing file size to save storage space and speed up transfers.  

## **2. Using `tar` (Tape Archiver) for Archiving**  
- **Create an archive (tarball):**  
  ```bash
  tar -cf notes.tar notes
  ```
  - `-c` → Create an archive  
  - `-f` → Use the given filename  

- **List contents of a tarball:**  
  ```bash
  tar -tf notes.tar
  ```
  - `-t` → Show contents of archive  

- **Extract files from a tarball:**  
  ```bash
  tar -xf notes.tar
  ```
  - `-x` → Extract  

## **3. Compressing Tarballs (`tar.gz`)**  
- **Create a compressed tarball:**  
  ```bash
  tar -czf notes.tar.gz notes
  ```
  - `-z` → Apply `gzip` compression  

- **Extract and decompress a `tar.gz` file:**  
  ```bash
  tar -xzf notes.tar.gz
  ```

## **4. Using `zip` and `unzip`**  
- **Create a compressed zip file:**  
  ```bash
  zip -r notes.zip notes
  ```
  - `-r` → Recursively include directories  

- **Extract a zip file:**  
  ```bash
  unzip notes.zip
  ```

### **Key Differences Between `tar` and `zip`**  
| Feature | `tar` + `gzip` | `zip` |
|---------|---------------|-------|
| Compression order | Archive first, then compress | Compress files individually, then archive |
| Extraction command | `tar -xzf file.tar.gz` | `unzip file.zip` |
