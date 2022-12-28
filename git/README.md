Git configuration and custom commands

## Commands

### Usage

Make the scripts executable:
```sh
chmod +x commands/git-<command-name>
```

Add them to your path

```sh
# Find your PATH directories
echo $PATH

# Copy the scripts to one of these directories
cp commands/* /usr/local/bin/  # (or any location)
```

Anything after after `git-` prefix will be avaiable as a custom git command.

Use from any git repository:
```sh
git pushh
```

### Available commands:
- git-pushh: Push changes to your current branch


