#!/bin/bash

# Fetch the latest changes from the remote repository
git fetch

# Create a temporary file to store merged branches
merged_branches=$(mktemp)

# Find merged branches into master
git branch -r --merged origin/master | grep -v 'origin/master' > "$merged_branches"

# Open the output file for writing
output_file="remote_branches.csv"
> "$output_file"  # Clear the file if it already exists

# Write the CSV header
echo "Branch,Latest Commit Date,Author,Merged into master" >> "$output_file"

# Loop through each remote branch
while IFS= read -r branch; do
    # Get the latest commit hash and commit date for the branch
    latest_commit_hash=$(git rev-parse --abbrev-ref $branch)
    latest_commit_date=$(git log -n 1 --format="%cd" --date=iso $branch)
    # Get the author of the latest commit
    latest_commit_author=$(git log -n 1 --format="%an" $branch)

    # Check if the branch is merged into master
    is_merged=false
    while IFS= read -r merged_branch; do
        if [[ "$branch" == "$merged_branch" ]]; then
            is_merged=true
            break
        fi
    done < "$merged_branches"

    # Write the branch name, latest commit date, author, and merged status to the CSV file
    echo "$branch,$latest_commit_date,$latest_commit_author,$is_merged" >> "$output_file"

done < <(git branch -r | grep -v '\->')

# Remove the temporary file
rm "$merged_branches"

echo "List of remote branches with latest commit date, author, and merged status into master has been written to $output_file"
