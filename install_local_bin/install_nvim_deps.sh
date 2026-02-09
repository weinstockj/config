#!/bin/bash
set -e

echo "Installing Neovim dependencies..."

# --- tree-sitter CLI (required for compiling treesitter parsers) ---
if command -v tree-sitter &>/dev/null; then
    echo "tree-sitter CLI already installed."
else
    if command -v cargo &>/dev/null; then
        echo "Installing tree-sitter CLI via cargo..."
        # On HPC/older systems, clang may not find GCC headers (stdbool.h).
        # Set C_INCLUDE_PATH to the GCC include dir as a workaround.
        GCC_INCLUDE=$(find /usr/lib/gcc -name stdbool.h -printf '%h\n' 2>/dev/null | head -1)
        if [ -n "$GCC_INCLUDE" ]; then
            echo "  Using GCC include path: $GCC_INCLUDE"
            CC=gcc C_INCLUDE_PATH="$GCC_INCLUDE" cargo install tree-sitter-cli
        else
            cargo install tree-sitter-cli
        fi
    else
        echo "ERROR: cargo not found. Install Rust first: https://rustup.rs"
        exit 1
    fi
fi

# --- pylatexenc (required for LaTeX rendering in markdown) ---
if command -v latex2text &>/dev/null; then
    echo "pylatexenc already installed."
else
    if command -v pip3 &>/dev/null; then
        echo "Installing pylatexenc via pip3..."
        pip3 install --user pylatexenc
    elif command -v pip &>/dev/null; then
        echo "Installing pylatexenc via pip..."
        pip install --user pylatexenc
    else
        echo "ERROR: pip not found. Install Python/pip first."
        exit 1
    fi
fi

echo "Neovim dependencies installed successfully!"
