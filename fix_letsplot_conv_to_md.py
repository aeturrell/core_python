import os
import re


def replace_text_in_files(directory_path, search_pattern, replace_pattern):
    for root, dirs, files in os.walk(directory_path):
        for file_name in files:
            if file_name.endswith(".md"):
                file_path = os.path.join(root, file_name)

                # Read the entire content of the file
                with open(file_path, "r") as file:
                    content = file.read()

                # Replace the search_pattern with replace_pattern using regex
                updated_content = re.sub(search_pattern, replace_pattern, content)

                # Write the updated content back to the file
                with open(file_path, "w") as file:
                    file.write(updated_content)


if __name__ == "__main__":
    # Replace the following variables with your desired values
    directory_path = "."  # Directory containing markdown files
    search_pattern = r"\n(\s*)<g\s>"  # Regex pattern to match newline and any number of spaces before "<g >"
    replace_pattern = (
        r"\1<g>"  # Replacement pattern with captured spaces \1 followed by "<g>"
    )

    replace_text_in_files(directory_path, search_pattern, replace_pattern)
