# Python `venv` Setup Basics Cheatsheet

This cheatsheet assumes Linux/WSL commands.

---

## 1. Standard repo-local venv setup

The usual pattern is one virtual environment per repo, named `.venv`.

```text
my-repo/
├── .venv/              # local virtual environment; do not commit
├── .vscode/
│   └── settings.json   # optional VS Code repo settings
├── requirements.txt
└── ...
```

From the repo root:

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
```

Install dependencies:

```bash
python -m pip install -r requirements.txt
```

Install a new package:

```bash
python -m pip install package-name
```

Save the current environment:

```bash
python -m pip freeze > requirements.txt
```

Deactivate the environment:

```bash
deactivate
```

Prefer:

```bash
python -m pip install ...
```

over bare:

```bash
pip install ...
```

because it guarantees that `pip` belongs to the active Python interpreter.

---

## 2. Verify that the venv is active

Basic check:

```bash
which python
python -c "import sys; print(sys.executable)"
```

Expected output should include something like:

```text
/path/to/my-repo/.venv/bin/python
```

More reliable check:

```bash
python -c "import sys; print(sys.prefix != sys.base_prefix)"
```

Expected output:

```text
True
```

This test is especially useful when working with shared or symlinked virtual environments.

---

## 3. VS Code setup

Install the VS Code extensions:

```text
Python
Pylance
```

Create:

```text
.vscode/settings.json
```

For a repo-local `.venv`, use:

```json
{
  "python.defaultInterpreterPath": "${workspaceFolder}/.venv/bin/python",
  "python-envs.workspaceSearchPaths": [
    "./.venv"
  ]
}
```

Then select the interpreter once:

```text
Ctrl+Shift+P → Python: Select Interpreter → ./.venv/bin/python
```

After selecting the interpreter, kill the existing terminal and open a new one:

```text
Terminal → Kill Terminal
Terminal → New Terminal
```

The new terminal should auto-activate the venv.

---

## 4. Enable VS Code terminal auto-activation

In your VS Code **user settings**, use:

```json
{
  "python-envs.terminal.autoActivationType": "command",
  "python.terminal.activateEnvironment": true
}
```

The newer setting is:

```json
"python-envs.terminal.autoActivationType": "command"
```

The older setting is:

```json
"python.terminal.activateEnvironment": true
```

Keeping both is usually harmless and helps across VS Code/Python extension versions.

After changing these settings, kill the current terminal and open a new one.

---

## 5. Recommended `.gitignore`

Add:

```gitignore
.venv/
__pycache__/
*.py[cod]
.pytest_cache/
.mypy_cache/
.ruff_cache/
.ipynb_checkpoints/
```

---

## 6. Sharing one venv across related projects

The usual best practice is one venv per repo. However, sharing a single venv is reasonable when several projects intentionally use the same dependency stack.

This is often convenient for related personal projects, such as several PreTeXt book repositories, where the goal is to avoid maintaining the same packages repeatedly.

Use a shared venv when:

* The projects use the same Python version.
* The projects have nearly identical dependencies.
* You control all of the projects.
* You are comfortable with package updates affecting all of them.
* The venv is mainly for development or build tooling.

Avoid sharing when:

* The projects require different versions of the same package.
* One project needs experimental packages.
* You need strict reproducibility.
* The repo will be used by students, collaborators, or CI.

Practical rule:

> Use a shared venv for closely related personal projects, but keep each repo’s `requirements.txt` accurate so you can recreate a dedicated venv later if needed.

---

## 7. Create a shared venv

Create the shared venv outside any individual repo:

```bash
mkdir -p ~/.venvs
python3 -m venv ~/.venvs/shared-pretext
source ~/.venvs/shared-pretext/bin/activate
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
```

To activate it directly later:

```bash
source ~/.venvs/shared-pretext/bin/activate
```

---

## 8. Use a shared venv through a repo-local `.venv` symlink

This approach keeps VS Code looking for `.venv`, but makes `.venv` point to the shared environment.

From the repo root:

```bash
ln -s ~/.venvs/shared-pretext .venv
```

Your repo then looks like it has a normal `.venv`, but the environment actually lives at:

```text
~/.venvs/shared-pretext
```

Use this `.vscode/settings.json`:

```json
{
  "python.defaultInterpreterPath": "${workspaceFolder}/.venv/bin/python",
  "python-envs.workspaceSearchPaths": [
    "./.venv"
  ]
}
```

Then select the interpreter once:

```text
Ctrl+Shift+P → Python: Select Interpreter → ./.venv/bin/python
```

This step matters. Creating the symlink is not always enough for VS Code to select the environment automatically.

After selecting the interpreter:

```text
Terminal → Kill Terminal
Terminal → New Terminal
```

The new terminal should auto-activate the shared venv through the local `.venv` symlink.

---

## 9. Important note about symlinked venvs

With a symlinked shared venv, this is expected:

```bash
readlink -f .venv
```

Example output:

```text
/home/gcox/.venvs/shared-pretext
```

But this may resolve to the system Python:

```bash
readlink -f .venv/bin/python
```

Example output:

```text
/usr/bin/python3.10
```

That does not necessarily mean the venv is broken. Many Linux virtual environments use the system Python executable while redirecting packages through the venv.

Use this test instead:

```bash
python -c "import sys; print(sys.prefix != sys.base_prefix)"
```

Expected output:

```text
True
```

If that prints `True`, Python is running inside a virtual environment.

---

## 10. Updating a shared venv

When dependencies change in one repo, activate the shared venv and update it:

```bash
source ~/.venvs/shared-pretext/bin/activate
python -m pip install -r requirements.txt
```

Because the venv is shared, this update affects every repo using it.

---

## 11. Common commands

| Task                                | Command                                                        |
| ----------------------------------- | -------------------------------------------------------------- |
| Create a repo-local venv            | `python3 -m venv .venv`                                        |
| Activate a repo-local venv          | `source .venv/bin/activate`                                    |
| Create a shared venv                | `python3 -m venv ~/.venvs/shared-pretext`                      |
| Activate a shared venv              | `source ~/.venvs/shared-pretext/bin/activate`                  |
| Symlink repo `.venv` to shared venv | `ln -s ~/.venvs/shared-pretext .venv`                          |
| Upgrade `pip`                       | `python -m pip install --upgrade pip`                          |
| Install dependencies                | `python -m pip install -r requirements.txt`                    |
| Add a dependency                    | `python -m pip install package-name`                           |
| Save dependencies                   | `python -m pip freeze > requirements.txt`                      |
| Check interpreter                   | `python -c "import sys; print(sys.executable)"`                |
| Check whether Python is in a venv   | `python -c "import sys; print(sys.prefix != sys.base_prefix)"` |
| Check package install location      | `python -m pip --version`                                      |
| List installed packages             | `python -m pip list`                                           |
| Check for dependency conflicts      | `python -m pip check`                                          |
| Deactivate the venv                 | `deactivate`                                                   |
| Delete a repo-local venv            | `rm -rf .venv`                                                 |
| Delete a shared venv                | `rm -rf ~/.venvs/shared-pretext`                               |

---

## 12. Minimal recipe: repo-local venv

```bash
cd my-repo

python3 -m venv .venv
source .venv/bin/activate

python -m pip install --upgrade pip
python -m pip install -r requirements.txt

mkdir -p .vscode
cat > .vscode/settings.json <<'EOF'
{
  "python.defaultInterpreterPath": "${workspaceFolder}/.venv/bin/python",
  "python-envs.workspaceSearchPaths": [
    "./.venv"
  ]
}
EOF

grep -qxF ".venv/" .gitignore || echo ".venv/" >> .gitignore
```

Then in VS Code:

```text
Ctrl+Shift+P → Python: Select Interpreter → ./.venv/bin/python
Terminal → Kill Terminal
Terminal → New Terminal
```

---

## 13. Minimal recipe: shared venv with repo-local symlink

Create the shared venv once:

```bash
mkdir -p ~/.venvs
python3 -m venv ~/.venvs/shared-pretext
source ~/.venvs/shared-pretext/bin/activate
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
```

In each repo that should use the shared venv:

```bash
cd my-repo

ln -s ~/.venvs/shared-pretext .venv

mkdir -p .vscode
cat > .vscode/settings.json <<'EOF'
{
  "python.defaultInterpreterPath": "${workspaceFolder}/.venv/bin/python",
  "python-envs.workspaceSearchPaths": [
    "./.venv"
  ]
}
EOF

grep -qxF ".venv/" .gitignore || echo ".venv/" >> .gitignore
```

Then in VS Code:

```text
Ctrl+Shift+P → Python: Select Interpreter → ./.venv/bin/python
Terminal → Kill Terminal
Terminal → New Terminal
```

Verify:

```bash
python -c "import sys; print(sys.prefix != sys.base_prefix)"
```

Expected output:

```text
True
```