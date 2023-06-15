
# Call pdb after any exception
c.InteractiveShell.pdb = True

# Do not ask to confirm CTRL-D exit
c.TerminalInteractiveShell.confirm_exit = False

# Run lines on startup
c.TerminalIPythonApp.exec_lines = [
    "print('\\n (╯°□°)╯︵ ┻━┻')",
]

# Ignore startup venv warning
c.InteractiveShell.warn_venv = False
