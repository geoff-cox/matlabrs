# Copilot Instructions for matlabrs Repository

## Repository Overview

**Project**: Introduction to Programming with MATLAB - A textbook built with PreTeXt  
**Type**: Educational textbook/documentation project  
**Format**: PreTeXt XML (.ptx files) compiled to HTML and PDF  
**Size**: Small (~11MB, 45 .ptx source files, ~22,500 lines of content)  
**Primary Language**: PreTeXt XML  
**Target Audience**: Mathematicians, Engineers, and Scientists learning MATLAB

This repository contains an interactive textbook teaching MATLAB programming fundamentals using the PreTeXt authoring system. The book covers basics, programming constructs (scripts, functions, logic, conditionals), arrays, and advanced programming topics like nested loops.

## Project Structure

### Root Files
- `project.ptx` - Main PreTeXt project manifest defining build targets (web, dev, pdf, runestone)
- `requirements.txt` - Python dependencies (pretext==2.36.0)
- `README.md` - Basic PreTeXt project documentation
- `codechat_config.yaml` - CodeChat previewer configuration (auto-generated)
- `.gitignore` - Excludes output/, published/, generated-assets/, node_modules/, logs/, .cache/, and most `.github/` files, while explicitly including `.github/copilot-instructions.md`.

### Source Structure (`source/`)
- `main.ptx` - Primary book source (table of contents that xi:includes each chapter file)
- `main-dev.ptx` - Development version with commented-out sections
- `aa-bookends/` - Front/back matter (book-info.ptx, front-matter.ptx)
- `chp-welcome-to-matlab/` - Chapter: Welcome to MATLAB (4 sections, exercises)
- `chp-scripts-functions/` - Chapter: Scripts & Functions (2 sections, exercises)
- `chp-if-switch-statements/` - Chapter: Logic, If, & Switch (4 sections, exercises)
- `chp-for-while-loops/` - Chapter: For & While Loops (4 sections, exercises)
- `chp-arrays/` - Chapter: Arrays: Vectors & Matrices (sections commented out, incomplete)
- `chp-nested-loops/` - Chapter: Additional Topics (nested loops, sections commented out)

### Configuration Files
- `publication/publication.ptx` - Publication settings for web/pdf output (chunking level 3, TOC level 4)
- `publication/runestone.ptx` - Runestone platform-specific settings

### Assets
- `assets/figures/` - Images and GIFs for MATLAB desktop, UI elements (14 files, ~5.4MB total)
- `generated-assets/dynamic_subs/` - Auto-generated exercise substitutions

### Build Outputs (Git-ignored)
- `output/web/` - HTML build output
- `output/dev/` - Development HTML build
- `output/print/` - PDF/LaTeX build output  
- `output/runestone/` - Runestone platform build
- `logs/` - PreTeXt build logs (timestamped .log files)

## Build Targets (from project.ptx)

Four targets defined:
1. **web** - HTML format, publication.ptx, output to `output/web/`, deploy to `interactive/`
2. **dev** - HTML development version using main-dev.ptx source with author tools enabled
3. **pdf** - PDF format using pdflatex, output to `output/print/debookrs.pdf`, deploy to `pdf/`
4. **runestone** - HTML for Runestone Academy platform with custom publication settings

## Dependencies and Environment Setup

### Required Software
- **Python 3.12.3** (verified working)
- **PreTeXt CLI 2.36.0** (specified in requirements.txt)
- **Node.js 22.10+** (CRITICAL: Current system has v20.20.0 which is insufficient)
- **pdflatex** (for PDF builds - NOT installed in default environment)

### Installation Steps

**ALWAYS run these commands in order before any build:**

```bash
# 1. Install Python dependencies (required first step)
pip3 install -r requirements.txt

# 2. Verify PreTeXt installation
pretext --version  # Should output: 2.36.0
```

**Expected output**: "Resources are already installed at /home/runner/.ptx/2.36.0"

## Build Instructions

### Available Commands

**List available targets:**
```bash
pretext -t
# Output: web, dev, pdf, runestone
```

### Known Build Issues and Workarounds

⚠️ **CRITICAL KNOWN ISSUES:**

1. **Node.js Version Error (All HTML Builds)**
   - **Error**: "Node version must be at least 22.10 to extract dynamic substitutions"
   - **Impact**: Non-fatal - build continues but cannot extract dynamic exercise substitutions
   - **Current system**: Node v20.20.0
   - **Workaround**: This is a warning, not a failure. Builds can proceed.

2. **Runestone Services Error (web/dev/runestone targets)**
   - **Error**: "cannot access local variable 'services_xml' where it is not associated with a value"
   - **Cause**: Unable to download from https://runestone.academy/cdn/runestone/latest/webpack_static_imports.xml
   - **Impact**: FATAL - Prevents all HTML builds from completing
   - **Status**: No workaround available - this is a PreTeXt/Runestone integration issue
   - **Affected targets**: web, dev, runestone

3. **PDF Build Requirements**
   - **Error**: "cannot locate executable with configuration name `LatexEngine.PDFLATEX` as command `pdflatex`"
   - **Cause**: pdflatex not installed in environment
   - **Impact**: Cannot build PDF target
   - **Workaround**: Install TeXLive or similar LaTeX distribution

### Building HTML (Web Target)

**IMPORTANT**: Currently FAILS due to Runestone services issue.

```bash
# Attempt to build (will fail with Runestone error)
pretext build web

# Expected behavior:
# - XSL conversion succeeds
# - Asset generation warns about Node version (non-fatal)
# - npm packages install successfully (51 packages)
# - Build fails at Runestone services download
# - Exits with code 1
```

**Build time**: ~2-3 seconds before failure

### Building Development Version (Dev Target)

**IMPORTANT**: Currently FAILS with same Runestone error as web target.

```bash
pretext build dev

# Uses main-dev.ptx with fewer sections enabled
# Same Runestone services failure as web target
```

### Building PDF (Print Target)

**IMPORTANT**: Requires pdflatex installation (not available by default).

```bash
# Will fail without pdflatex installed
pretext build pdf

# Successful steps before failure:
# - XSL conversion to LaTeX succeeds
# - LaTeX file created in /tmp/ptx-*/main.tex
# - Fails when trying to run pdflatex
```

### Generating Assets

```bash
pretext generate

# Result:
# - Warns about Node version (non-fatal)
# - Cannot extract dynamic exercise substitutions
# - Exits successfully but with warnings
```

### Preview Server

```bash
# Start local preview server (does not require successful build)
pretext view web

# Behavior:
# - Starts server on http://localhost:8128
# - Opens browser to /output/web
# - Server runs until stopped (Ctrl+C)
# - Works even if build failed
```

## Testing and Validation

**No automated tests** - This is a documentation project with no test suite.

**Manual validation**:
1. Run `pretext build web` to verify XML is valid
2. Check `logs/` directory for detailed error messages
3. Use `pretext view web` to preview locally
4. Verify changes don't introduce XML validation errors

## Common Development Workflows

### Editing Content

1. Edit .ptx files in `source/` directories
2. Build to verify syntax: `pretext build web` (expect Runestone failure)
3. Check logs for XML validation errors
4. Preview changes if needed (server can run despite build failures)

### Adding New Sections

1. Create new .ptx file in appropriate chapter directory
2. Add `<xi:include href="new-file.ptx" />` in the chapter-level .ptx file (e.g., chp-arrays/chp-arrays.ptx)
3. Rebuild to validate inclusion

### Adding Images

1. Place images in `assets/figures/`
2. Reference in .ptx with `<image source="figures/filename.png"/>`
3. Supported formats: PNG, GIF, JPG

### Working with Chapters

Each chapter directory contains a chapter-level .ptx file (e.g., `chp-welcome-to-matlab/chp-welcome-to-matlab.ptx`) that defines the chapter element and xi:includes its section files. The main.ptx file xi:includes each chapter-level file.

- chp-welcome-to-matlab: 4 sections on MATLAB environment and variables
- chp-scripts-functions: 2 sections on scripts and functions
- chp-if-switch-statements: 4 sections on logic, if-statements, and switch-statements
- chp-for-while-loops: 4 sections on for-loops, while-loops, and flow control
- chp-arrays: Array operations (sections commented out, incomplete)
- chp-nested-loops: Nested loops content (sections commented out)

Some sections in main-dev.ptx are commented out for development purposes.

## File Naming Conventions

- Chapter directories: `chp-name/` (e.g., chp-welcome-to-matlab, chp-scripts-functions)
- Chapter files: `chp-name/chp-name.ptx` (e.g., chp-arrays/chp-arrays.ptx)
- Section files: `sec-topic-name.ptx`
- Exercise files: `exercises-chapter-name.ptx`
- Bookend files: In `aa-bookends/`

## Important Notes for Coding Agents

1. **DO NOT** attempt to fix Runestone services error - it's external to this repository
2. **DO NOT** install or upgrade Node.js unless explicitly requested - it may break other tools
3. **ALWAYS** validate XML syntax when editing .ptx files
4. **DO NOT** commit files in output/, generated-assets/, logs/, or node_modules/ (git-ignored)
5. **EXPECT** Node.js version warnings - they are non-fatal
6. **EXPECT** Runestone service failures on HTML builds - this is a known limitation
7. The build process uses npm under the hood but there's no package.json in the repo
8. PreTeXt manages its own resources at /home/runner/.ptx/2.36.0/
9. Check logs/ directory for detailed error information after any build
10. .gitignore explicitly excludes .github/ directory - be aware when adding files there

## Quick Reference

**Install dependencies:**
```bash
pip3 install -r requirements.txt
```

**List targets:**
```bash
pretext -t
```

**Build (expect failures):**
```bash
pretext build web    # Fails: Runestone error
pretext build dev    # Fails: Runestone error  
pretext build pdf    # Fails: Missing pdflatex
```

**Preview:**
```bash
pretext view web     # Works despite build failures
```

**Check logs:**
```bash
ls -lt logs/         # Most recent log first
cat logs/<latest>.log
```

## Trust These Instructions

These instructions were created through systematic testing of all build commands and careful examination of the repository structure. The known issues have been verified and documented. Do not waste time trying to fix external service dependencies (Runestone) or searching for solutions that don't exist in this repository. Focus on content editing and XML validation, which work correctly.
