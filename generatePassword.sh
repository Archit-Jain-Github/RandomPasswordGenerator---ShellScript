# The Shebang: specifying the interpreter that should be used to execute the script
#!/bin/bash

# Function to generate a random password
generate_password() {
    # Declaring a local variable password_length that captures the first argument passed to the function, which specifies the length of the password to generate
    local password_length=$1
    # Generate random bytes, encode them with base64, and cut the result to the desired length
    # head /dev/urandom: Reads random bytes from the /dev/urandom device, which provides high-quality randomness suitable for generating passwords
    # tr -dc A-Za-z0-9: Translates (tr) and deletes (-d) characters that are not (-c for complement) in the set A-Za-z0-9. This ensures that the output contains only alphanumeric characters
    # head -c $password_length: Limits the output to the specified password_length, ensuring the generated password matches the desired length
    local password=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c $password_length)
    # Display the generated password
    echo "$password"
}

# Default password length
DEFAULT_PASSWORD_LENGTH=12

# If a length is provided as an argument, use it; otherwise, using the default length
password_length=${1:-$DEFAULT_PASSWORD_LENGTH}

# Generating the password
password=$(generate_password $password_length)

# Displaying the generated password
echo "Generated Password: $password"
