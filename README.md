# Project: Compute Connect

## Overview
`compute-connect` is a streamlined Bash script (`start.sh`) designed to simplify the process of managing SSH connections to Google Cloud Platform (GCP) compute instances. The script allows users to easily select a project, list active compute instances, and connect to a desired instance with minimal effort.

## Features
- Lists available GCP projects from a configuration file (`projects.config`).
- Enables selection of a project to set as the active project.
- Displays all active compute instances with numbering for easy selection.
- Facilitates SSH connections to the selected compute instance.

## Prerequisites
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) installed and configured on your local machine.
- Access to a GCP project with compute instances.
- A `projects.config` file containing a list of project IDs.

## Installation
1. Clone this repository:
   ```bash
   git clone https://github.com/webdevtodayjason/compute-connect.git
   cd compute-connect
   ```
2. Ensure `start.sh` has executable permissions:
   ```bash
   chmod +x start.sh
   ```
3. Create a `projects.config` file in the same directory and add your project IDs, one per line:
   ```
   another-project-id
   another-project-id2
   another-project-id65
   another-project-id23
   ```

## Usage
Run the script using:
```bash
./start.sh
```

### Steps in the Script
1. **Project Selection**: The script reads the `projects.config` file and displays a numbered list of projects.
2. **Instance Listing**: Lists all active instances in the selected project, with numbering for easy reference.
3. **SSH Connection**: Prompts the user to select an instance by number and connects via SSH.

## Notes
- Ensure you have the necessary permissions to access the specified GCP projects and instances.
- Update the `projects.config` file as needed to add or remove project IDs.

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.

## Contributing
Pull requests are welcome. For significant changes, please open an issue first to discuss what you would like to change.

## Author
Created by [Jason](https://github.com/webdevtodayjason).

## Acknowledgements
- Google Cloud Platform documentation
- [Bash Scripting Guide](https://www.gnu.org/software/bash/manual/)

