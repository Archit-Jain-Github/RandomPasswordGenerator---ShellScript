# Random Password Generator

## Shell Script (`generate_password.sh`)

### Overview

This shell script (`generate_password.sh`) generates a random password using `/dev/urandom`, filters out non-alphanumeric characters, and allows customization of the password length via a command-line argument.

### Option 1: Using GitHub (Downloading)

1. **Download the Script**

   - Download the `generate_password.sh` script.

2. **Make the Script Executable**

   - Open your terminal.
   - Navigate to the directory where `generate_password.sh` is located.
   - Run the following command to make the script executable:
     ```sh
     chmod 755 generate_password.sh
     ```

3. **Run the Script**

   - Execute the script to generate a random password:
     ```sh
     ./generate_password.sh [length]
     ```
     Replace `[length]` with the desired password length. If no length is provided, the script defaults to 12 characters.

### Option 2: Creating via Terminal

1. **Create the Script file**

   - Create a new file named `generate_password.sh`.

2. **Make the Script Executable**

   - Run the following command to make the script executable:
     ```sh
     chmod 755 generate_password.sh
     ```

3. **Write the Script**

   ```bash
   #!/bin/bash

   # Function to generate a random password
   generate_password() {
       local password_length=$1
       local password=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c $password_length)
       echo "$password"
   }

   # Default password length
   DEFAULT_PASSWORD_LENGTH=12

   # Determine password length based on user input or default
   password_length=${1:-$DEFAULT_PASSWORD_LENGTH}

   # Generate and display the password
   password=$(generate_password $password_length)
   echo "Generated Password: $password"
   ```

4. **Run the Script**

   - Execute the script to generate a random password:
     ```sh
     ./generate_password.sh [length]
     ```
     Replace `[length]` with the desired password length. If no length is provided, the script defaults to 12 characters.

### Script Explanation

#### Shell Script: `generate_password.sh`

```bash
#!/bin/bash
```

- **Line 1:** Shebang (`#!`) line specifies the interpreter (`/bin/bash`).

```bash
# Function to generate a random password
generate_password() {
    local password_length=$1
    local password=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c $password_length)
    echo "$password"
}
```

- **Lines 3-8:** Defines `generate_password()` function:
  - `local password_length=$1`: Captures the password length argument.
  - `head /dev/urandom`: Reads random bytes from `/dev/urandom`.
  - `tr -dc A-Za-z0-9`: Filters non-alphanumeric characters.
  - `head -c $password_length`: Limits the output to desired length.
  - `echo "$password"`: Outputs generated password.

```bash
# Default password length
DEFAULT_PASSWORD_LENGTH=12
```

- **Line 11:** Sets default password length.

```bash
# Determine password length based on user input or default
password_length=${1:-$DEFAULT_PASSWORD_LENGTH}
```

- **Line 14:** Sets password length from user input or default.

```bash
# Generate and display the password
password=$(generate_password $password_length)
echo "Generated Password: $password"
```

- **Lines 17-18:** Generates and displays the password.

### Example Usage

- **Example 1:** Generate default 12-character password:
  ```sh
  ./generate_password.sh
  ```
  Output:
  ```
  Generated Password: xY9JZmBi64CG
  ```

- **Example 2:** Generate 16-character password:
  ```sh
  ./generate_password.sh 16
  ```
  Output:
  ```
  Generated Password: k0D6wvTCw8Z8z8HB
  ```

### Notes

- Uses `/dev/urandom` for secure random password generation.
- Accepts optional length argument for flexibility.
- Passwords consist of alphanumeric characters (A-Z, a-z, 0-9).

### Conclusion

This script offers a simple method to generate secure random passwords on Unix-like systems using shell scripting. It's suitable for both manual and automated use cases, ensuring passwords meet typical security requirements.

---

