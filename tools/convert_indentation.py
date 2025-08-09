#!/usr/bin/env python3
"""
Convert GDScript files from spaces to tabs to fix Godot indentation errors.
Run this script from the project root directory.
"""

import os
import re
import sys
from pathlib import Path

def convert_file_to_tabs(file_path):
    """Convert a single file from spaces to tabs."""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()

        # Check if file already uses tabs
        if '\t' in content:
            print(f"  ✓ {file_path} already uses tabs")
            return False

        # Convert spaces to tabs (assuming 4 spaces = 1 tab)
        lines = content.split('\n')
        converted_lines = []

        for line in lines:
            # Count leading spaces
            leading_spaces = len(line) - len(line.lstrip())
            if leading_spaces > 0:
                # Convert spaces to tabs (4 spaces = 1 tab)
                tabs_count = leading_spaces // 4
                remaining_spaces = leading_spaces % 4
                new_line = '\t' * tabs_count + ' ' * remaining_spaces + line.lstrip()
                converted_lines.append(new_line)
            else:
                converted_lines.append(line)

        new_content = '\n'.join(converted_lines)

        # Only write if content actually changed
        if new_content != content:
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(new_content)
            print(f"  ✓ {file_path} converted to tabs")
            return True
        else:
            print(f"  - {file_path} no changes needed")
            return False

    except Exception as e:
        print(f"  ✗ Error processing {file_path}: {e}")
        return False

def main():
    """Main function to convert all GDScript files."""
    project_root = Path(__file__).parent.parent
    gd_files = list(project_root.rglob("*.gd"))

    if not gd_files:
        print("No .gd files found in the project.")
        return

    print(f"Found {len(gd_files)} GDScript files")
    print("Converting spaces to tabs...")

    converted_count = 0
    for gd_file in gd_files:
        if convert_file_to_tabs(gd_file):
            converted_count += 1

    print(f"\nConversion complete!")
    print(f"Files converted: {converted_count}")
    print(f"Files already using tabs: {len(gd_files) - converted_count}")

    if converted_count > 0:
        print("\nNote: You may need to restart your editor for changes to take effect.")
        print("The .editorconfig file will now enforce tab indentation for new files.")

if __name__ == "__main__":
    main()
