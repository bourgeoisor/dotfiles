# Contributing to this repository

Thank you for your interest in contributing to my personal dotfiles! Since this is my personal configuration, contributions are generally limited to bug fixes for the installation script, improvements to configuration options, or updates to documentation.

## How to contribute

### 1. Reporting issues
If you find a bug in the installer script or an issue with one of the configurations, please open an issue on the GitHub repository detailing:
- What OS / shell version you are running.
- A description of the issue (and terminal errors if applicable).
- Steps to reproduce it.

### 2. Submitting fixes or improvements
1. Fork this repository.
2. Create a new branch (e.g., `git checkout -b fix/installer-on-linux`).
3. Make your changes.
4. Open a Pull Request detailing the changes made.

---

## Development & testing guide

### Local testing
1. Clone your fork and navigate to the directory:
   ```sh
   git clone https://github.com/your-username/dotfiles.git
   cd dotfiles
   ```
2. Test the installation script. Remember that the installer will check if links exist and back up any conflicts to `~/.dotfiles_backup/`.
3. Verify that your configuration changes work as intended in your terminal, shell, or multiplexer environment.
