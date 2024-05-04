# Git Remote Branches Summary Script

## Overview
This Bash script generates a summary of remote branches in a Git repository, including information about their latest commits and whether they have been merged into the master branch. The summary is exported to a CSV file for easy reference.

## Requirements
- Git installed on your system.
- Bash shell environment.

## Usage
1. Clone or download the repository containing this script.
2. Open a terminal and navigate to the directory where the script is located.
3. Make sure the script has executable permissions. If not, run the following command:
    ```bash
    chmod +x remote_branch_list.sh
    ```
4. Execute the script by running the following command:
    ```bash
    ./remote_branch_list.sh
    ```
5. The script will fetch the latest changes from the remote repository, generate the summary, and export it to a CSV file named "remote_branches.csv" in the same directory.

## Output Format
The CSV file contains the following columns:
1. Branch: Name of the remote branch.
2. Latest Commit Date: Date of the latest commit on the branch.
3. Author: Author of the latest commit on the branch.
4. Merged into master: Indicates whether the branch has been merged into the master branch (true/false).

## Notes
- The script may take some time to execute, especially for repositories with a large number of branches.
- Ensure that you have the necessary permissions to fetch from the remote repository and access branch information.

## License
This script is provided under the [MIT License](LICENSE).

